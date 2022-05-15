package com.myspring.mypet;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.DiaryDAO;
import com.mypet.vo.DiaryVO;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryDAO DiaryDAO;
	
	@RequestMapping(value="/diary_free.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView diary_free(String pnum) {
		ModelAndView mv = new ModelAndView();
		int pageNumber = 1;
		 
		if(pnum != null) {
	  		pageNumber = Integer.parseInt(pnum);
	  	}
		
		int startnum = ((pageNumber-1)*10) +1;
		int endnum = pageNumber*10; 
		int pagenum = (pageNumber -1) * 10;
		int target = 0;
		
		ArrayList<DiaryVO> free_list = DiaryDAO.getFreeList(startnum,endnum);
		for (int i=0; i<free_list.size(); i++) {
			free_list.get(i).setC_count(DiaryDAO.getFreeCommentCount(free_list.get(i).getFid()));
		}
		
		target = DiaryDAO.targetPage(pagenum);
		int targetpage = 0;
		if(pageNumber != 1 ) {
			targetpage = (target-2) / 10 ;
		} else {
			targetpage = (target-1) / 10 ;
		}
		
		mv.addObject("free_list", free_list);
		mv.addObject("targetpage", String.valueOf(targetpage));
		mv.addObject("pageNumber", String.valueOf(pageNumber));
		mv.setViewName("diary/diary_free");
		
		return mv;
	}
	
	@RequestMapping(value="/diary_free_writing.do")
	public String diary_free_writing() {
		return "diary/diary_free_writing";
	}
	
	@RequestMapping(value="/diary_free_contents.do", method=RequestMethod.GET)
	public ModelAndView diary_free_contents(String fid) {
		ModelAndView mv = new ModelAndView();
		DiaryDAO.getFreeHit(fid);
		DiaryVO vo = DiaryDAO.getFreeContents(fid);
		ArrayList<DiaryVO> list = DiaryDAO.getFreeCommentList(fid);
				
		mv.setViewName("diary/diary_free_contents");
		mv.addObject("list", list);
		mv.addObject("vo", vo);
		mv.addObject("count", DiaryDAO.getFreeCommentCount(fid));
		
		return mv;
	}
	
	@RequestMapping(value="/diary_pictures_contents.do")
	public String diary_pictures_contents() {
		return "diary/diary_pictures_contents";
	}

	@RequestMapping(value="/diary_pictures_writing.do")
	public String diary_pictures_writing() {
		return "diary/diary_pictures_writing";
	}
	
	@ResponseBody
	@RequestMapping(value="/free_upload.do", method=RequestMethod.POST)
	public boolean free_upload(HttpServletRequest request, DiaryVO vo) {
		boolean result = false;
		HttpSession session = request.getSession(); //技记 积己
		
		vo.setId((String)session.getAttribute("session_id"));
		
		int val = DiaryDAO.getFreeUpload(vo);
		
		if (val!=0) {
			result = true;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/free_up_heart.do", method=RequestMethod.POST)
	public void free_up_heart(HttpServletRequest request, String fid) {
		HttpSession session = request.getSession(); //技记 积己
		DiaryVO vo = new DiaryVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setFid(fid);
		
		if (DiaryDAO.getFreeUpInfo(vo) == 0) {
			DiaryDAO.getFreeUpHeart(vo);
			DiaryDAO.getFreeUpUpdate(fid);
		} else {
			DiaryDAO.getFreeDownHeart(vo);
			DiaryDAO.getFreeDownUpdate(fid);
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/free_up_nheart.do", method=RequestMethod.POST)
	public void free_up_nheart(HttpServletRequest request, String fid) {
		HttpSession session = request.getSession(); //技记 积己
		DiaryVO vo = new DiaryVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setFid(fid);
		
		if (DiaryDAO.getFreeDownInfo(vo) == 0) {
			DiaryDAO.getFreeUpNheart(vo);
			DiaryDAO.getFreeNupUpdate(fid);
		} else {
			DiaryDAO.getFreeDownNheart(vo);
			DiaryDAO.getFreeNdownUpdate(fid);
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/free_comment_upload.do", method=RequestMethod.POST)
	public void free_comment_upload(HttpServletRequest request, String fid, String ccomment) {
		HttpSession session = request.getSession(); //技记 积己
		DiaryVO vo = new DiaryVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setFid(fid); vo.setCcomment(ccomment);
		
		DiaryDAO.getFreeCommentUpload(vo);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/free_comment_delete.do", method=RequestMethod.POST)
	public void free_comment_delete(String cid) {		
		
		 DiaryDAO.getFreeCommentDelete(cid);	
		
	}
	
	@ResponseBody
	@RequestMapping(value="/free_delete.do", method=RequestMethod.POST)
	public void free_delete(String fid) {		
		DiaryDAO.getFreeDelete(fid);
	}
	
	@RequestMapping(value="/diary_free_update.do", method=RequestMethod.GET)
	public ModelAndView free_diary_update(String fid) {
		ModelAndView mv = new ModelAndView();
		
		DiaryVO vo = DiaryDAO.getFreeContents(fid);
		mv.addObject("vo", vo);
		mv.setViewName("diary/diary_free_update");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/free_update.do", method=RequestMethod.POST)
	public boolean free_update(DiaryVO vo) {
		boolean result = false;
		
		int val = DiaryDAO.getFreeUpdate(vo);
		
		if (val!=0) {
			result = true;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/free_comment_update.do", method=RequestMethod.POST)
	public void free_comment_update(String cid, String ccomment) {
		DiaryVO vo = new DiaryVO();
		vo.setCid(cid); vo.setCcomment(ccomment);
		DiaryDAO.getFreeCommentUpdate(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/pictures_upload.do", method=RequestMethod.POST)
	public boolean pictures_upload(DiaryVO vo, MultipartHttpServletRequest request) throws Exception {
		boolean result = false;
		HttpSession session = request.getSession(); //技记 积己
		vo.setId((String)session.getAttribute("session_id"));
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "\\resources\\upload\\";

		// rfname 吝汗规瘤 贸府
		UUID uuid = UUID.randomUUID();
		
		String ptag[] = vo.getTrue_ptag().split("@");
		String pfile = "";
		String psfile = "";
		
		for (int i = 0; i<ptag.length; i++) {
			pfile = pfile+ "@" +vo.pfile(i).getOriginalFilename();
			psfile = psfile + "@" + uuid + "_" + vo.pfile(i).getOriginalFilename();
		}
		
		String pfile2[] = pfile.split("@");
		String psfile2[] = psfile.split("@");		
		
		vo.setPfile(pfile); vo.setPsfile(psfile);
		vo.setPtag(vo.getTrue_ptag());
		
		int val = DiaryDAO.getPicturesUpload(vo);		
		if (val!=0) {
			
			if (ptag.length >= 2) {
				for (int j=1; j<psfile2.length; j++) {					
					 File f = new File(root_path + attach_path + psfile2[j]); 
					 vo.pfile(j-1).transferTo(f); 
				}					
			} else {
				 File f = new File(root_path + attach_path + psfile2[1]); 
				 vo.pfile(0).transferTo(f); 
			}
			
			
			result = true;
			
		}
		
		return result;
	}
	
	@RequestMapping(value="/diary_pictures.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView diary_pictures(String pnum) {
		ModelAndView mv = new ModelAndView();
		int pageNumber = 1;
		 
		if(pnum != null) {
	  		pageNumber = Integer.parseInt(pnum);
	  	}
		
		int startnum = ((pageNumber-1)*10) +1;
		int endnum = pageNumber*10; 
		int pagenum = (pageNumber -1) * 10;
		int target = 0;
		
		ArrayList<DiaryVO> pictures_list = DiaryDAO.getPicturesList(startnum,endnum);
		for (int i=0; i<pictures_list.size(); i++) {
			pictures_list.get(i).setPheart(DiaryDAO.getPicturesUpList(pictures_list.get(i).getPid()));
			pictures_list.get(i).setPc_count(DiaryDAO.getPicturesCommentCount(pictures_list.get(i).getPid()));

			String pfile[] = pictures_list.get(i).getPfile().split("@");
			String psfile[] = pictures_list.get(i).getPsfile().split("@");
			
			pictures_list.get(i).setPfile(pfile[1]);
			pictures_list.get(i).setPsfile(psfile[1]);
		}
		
		target = DiaryDAO.ptargetPage(pagenum);
		int targetpage = 0;
		if(pageNumber != 1 ) {
			targetpage = (target-2) / 10 ;
		} else {
			targetpage = (target-1) / 10 ;
		}
		
		mv.addObject("pictures_list", pictures_list);
		mv.addObject("targetpage", String.valueOf(targetpage));
		mv.addObject("pageNumber", String.valueOf(pageNumber));
		mv.setViewName("diary/diary_pictures");
		
		return mv;
	}
	
	@RequestMapping(value="/diary_pictures_contents.do", method=RequestMethod.GET)
	public ModelAndView diary_pictures_contents(String pid) {
		ModelAndView mv = new ModelAndView();
		DiaryDAO.getPicturesHit(pid);
		DiaryVO vo = DiaryDAO.getPicturesContents(pid);
		ArrayList<DiaryVO> list = DiaryDAO.getPicturesCommentList(pid);
		String psfile[] = vo.getPsfile().split("@");
		String ptag[] = vo.getPtag().split("@");
		ArrayList<DiaryVO> plist = new ArrayList<DiaryVO>();
		
		for (int i=0; i<ptag.length; i++) {		
			DiaryVO dvo = new DiaryVO();
			dvo.setPsfile(psfile[i+1]); dvo.setPtag(ptag[i]);
			plist.add(dvo);
		}
				
		mv.setViewName("diary/diary_pictures_contents");
		mv.addObject("list", list);
		mv.addObject("vo", vo);
		mv.addObject("plist", plist);
		mv.addObject("count", DiaryDAO.getPicturesCommentCount(pid));
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/pictures_up_heart.do", method=RequestMethod.POST)
	public void pictures_up_heart(HttpServletRequest request, String pid) {
		HttpSession session = request.getSession(); //技记 积己
		DiaryVO vo = new DiaryVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setPid(pid);
		
		if (DiaryDAO.getPicturesUpInfo(vo) == 0) {
			DiaryDAO.getPicturesUpHeart(vo);
			DiaryDAO.getPicturesUpUpdate(pid);
		} else {
			DiaryDAO.getPicturesDownHeart(vo);
			DiaryDAO.getPicturesDownUpdate(pid);
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/pictures_up_nheart.do", method=RequestMethod.POST)
	public void pictures_up_nheart(HttpServletRequest request, String pid) {
		HttpSession session = request.getSession(); //技记 积己
		DiaryVO vo = new DiaryVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setPid(pid);
		
		if (DiaryDAO.getPicturesDownInfo(vo) == 0) {
			DiaryDAO.getPicturesUpNheart(vo);
			DiaryDAO.getPicturesNupUpdate(pid);
		} else {
			DiaryDAO.getPicturesDownNheart(vo);
			DiaryDAO.getPicturesNdownUpdate(pid);
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/pictures_comment_upload.do", method=RequestMethod.POST)
	public void pictures_comment_upload(HttpServletRequest request, String pid, String ccomment) {
		HttpSession session = request.getSession(); //技记 积己
		DiaryVO vo = new DiaryVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setPid(pid); vo.setCcomment(ccomment);
		
		DiaryDAO.getPicturesCommentUpload(vo);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/pictures_delete.do", method=RequestMethod.POST)
	public void pictures_delete(String pid) {		
		DiaryDAO.getPicturesDelete(pid);
	}
	
}
