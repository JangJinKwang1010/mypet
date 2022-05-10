package com.myspring.mypet;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.DiaryDAO;
import com.mypet.dao.MypageDAO;
import com.mypet.dao.NearDAO;
import com.mypet.vo.DiaryVO;
import com.mypet.vo.MemberVO;
import com.mypet.vo.NearVO;

@Controller
public class MypageController {
	
	boolean pass_result = false;
	
	@Autowired
	private MypageDAO MypageDAO;
	
	@Autowired
	private NearDAO NearDAO;
	
	@Autowired
	private DiaryDAO DiaryDAO;
	
	@RequestMapping(value="/mypage.do") 
	public String mypage() {
		pass_result = false;
		
		return "mypage/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value="/ok_proc.do", method=RequestMethod.POST)
	public boolean mypage_pass_ok(String pass, HttpServletRequest request) {
		
		boolean result = false;
		
		HttpSession session = request.getSession(); //技记 积己
		MemberVO vo = new MemberVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setPass(pass);
		
		int value = MypageDAO.getMypageinpass(vo);
		
		if (value==1) {
			result = true;
			pass_result = true;
		} 
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage_pass_proc.do", method=RequestMethod.POST)
	public boolean mypage_pass_proc() {
		boolean result = false;
		
		if (pass_result) {
			result = true;
		}
		
		return result;
	}
	

	@RequestMapping(value="/mypage_update.do") 
	public ModelAndView mypage_update(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession(); //技记 积己
		
		String id = (String)session.getAttribute("session_id");
		if (id != null) {
			MemberVO vo = MypageDAO.getMemberInfo(id);
			mv.addObject("vo", vo);
		}
		mv.setViewName("mypage/mypage_update");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage_update_proc.do", method=RequestMethod.POST)
	public boolean mypage_update_proc(HttpServletRequest request, String email, String addr1, String addr2) {
		HttpSession session = request.getSession(); //技记 积己
		boolean result = false;
		MemberVO vo = new MemberVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setEmail(email);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		
		int val = MypageDAO.getMypageUpdate(vo);
		
		if (val!=0) {
			MypageDAO.getMypageUpdateMap(vo);
			vo.setAddr1(addr1+ " " + addr2);
			MypageDAO.getMypageUpdateCare(vo);
			
			result = true;
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/mypage_pass.do") 
	public String mypage_pass() {
		return "mypage/mypage_pass";
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage_pass_update_proc.do", method=RequestMethod.POST)
	public boolean mypage_pass_update_proc(HttpServletRequest request, String pass) {
		boolean result = false;
		HttpSession session = request.getSession(); //技记 积己
		MemberVO vo = new MemberVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setPass(pass);
		
		int val = MypageDAO.getMypagePass(vo);
		
		if (val!=0) {
			result = true;
		}
		
		return result;
	}
	
	
	@RequestMapping(value="/mypage_delete.do") 
	public String mypage_delete() {
		return "mypage/mypage_delete";
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage_delete_proc.do", method=RequestMethod.POST)
	public boolean mypage_delete_proc(HttpServletRequest request) {
		boolean result = false;
		HttpSession session = request.getSession(); //技记 积己
		String id= (String)session.getAttribute("session_id");
		
		ArrayList<DiaryVO> dlist = MypageDAO.getMypageFidList(id);
		for (int i=0; i<dlist.size(); i++) {
			MypageDAO.getMypageFidDelete(dlist.get(i).getFid());
		}
		
		ArrayList<NearVO> nlist = MypageDAO.getMypageNidList(id);
		for (int i=0; i<nlist.size(); i++) {
			MypageDAO.getMypageNidDelete(nlist.get(i).getNid());
		}
		
		int val = MypageDAO.getMypageDelete(id);
		
		if (val!=0) {
			result  = true;
		}
		
		return result;
	}
	
	@RequestMapping(value="/mypage_post.do",  method= {RequestMethod.GET,RequestMethod.POST}) 
	public ModelAndView mypage_post(String pnum, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		String id= (String)session.getAttribute("session_id");
		int pageNumber = 1;
		 
		if(pnum != null) {
	  		pageNumber = Integer.parseInt(pnum);
	  	}
		
		int startnum = ((pageNumber-1)*7) +1;
		int endnum = pageNumber*7; 
		int pagenum = (pageNumber -1) * 7;
		int target = 0;
		
		DiaryVO vo = new DiaryVO();
		vo.setId(id); vo.setStartnum(startnum); vo.setEndnum(endnum); vo.setPagenum(pagenum);
		
		ArrayList<DiaryVO> post_list = MypageDAO.getMypagePost(vo);
		for (int i=0; i<post_list.size(); i++) {
			post_list.get(i).setC_count(DiaryDAO.getFreeCommentCount(post_list.get(i).getFid()));
		}
		
		target = MypageDAO.getMypagePostTarget(vo);
		
		int targetpage = 0;
		if(pageNumber != 1 ) {
			targetpage = (target-2) / 10 ;
		} else {
			targetpage = (target-1) / 10 ;
		}
		
		mv.addObject("list", post_list);
		mv.addObject("targetpage", String.valueOf(targetpage));
		mv.addObject("pageNumber", String.valueOf(pageNumber));
		mv.setViewName("mypage/mypage_post");
		
		return mv;
	}
	
	@RequestMapping(value="/mypage_comment.do", method= {RequestMethod.GET,RequestMethod.POST}) 
	public ModelAndView mypage_comment(String pnum, HttpServletRequest request ) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		String id= (String)session.getAttribute("session_id");
		int pageNumber = 1;
		 
		if(pnum != null) {
	  		pageNumber = Integer.parseInt(pnum);
	  	}
		
		int startnum = ((pageNumber-1)*7) +1;
		int endnum = pageNumber*7; 
		int pagenum = (pageNumber -1) * 7;
		int target = 0;
		
		DiaryVO vo = new DiaryVO();
		vo.setId(id); vo.setStartnum(startnum); vo.setEndnum(endnum); vo.setPagenum(pagenum);
		
		ArrayList<DiaryVO> comment_list = MypageDAO.getMypageComment(vo);
		for (int i=0; i<comment_list.size(); i++) {
			
			if (comment_list.get(i).getSeq_id().substring(0, 1).equals("f")) {
				comment_list.get(i).setFtitle(MypageDAO.getFtitleSelect(comment_list.get(i).getSeq_id()));
				comment_list.get(i).setType("f");
			} else {
				comment_list.get(i).setPtitle(MypageDAO.getPtitleSelect(comment_list.get(i).getSeq_id()));
				comment_list.get(i).setType("p");
			}
		}
		
		target = MypageDAO.getMypageCommentTarget(vo);
		
		int targetpage = 0;
		if(pageNumber != 1 ) {
			targetpage = (target-2) / 10 ;
		} else {
			targetpage = (target-1) / 10 ;
		}
		
		mv.addObject("list", comment_list);
		mv.addObject("targetpage", String.valueOf(targetpage));
		mv.addObject("pageNumber", String.valueOf(pageNumber));
		mv.setViewName("mypage/mypage_comment");
		
		return mv;
	}
	
	@RequestMapping(value="/mypage_near.do") 
	public ModelAndView mypage_near(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		String id= (String)session.getAttribute("session_id");
		
		ArrayList<NearVO> list = MypageDAO.getMypageNear(id);
		for (int i=0; i<list.size(); i++) {
			list.get(i).setCategory(NearDAO.getNearPet(list.get(i).getPid()));
			
			String s[] = list.get(i).getStartdate().split(" ");
			list.get(i).setStartdate(s[0]);
			
		}
		
		mv.addObject("list", list);		
		mv.setViewName("mypage/mypage_near");
		
		return mv;
	}
}
