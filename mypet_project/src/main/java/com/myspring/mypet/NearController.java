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

import com.mypet.dao.MemberDAO;
import com.mypet.dao.MypageDAO;
import com.mypet.dao.NearDAO;
import com.mypet.dao.PetDAO;
import com.mypet.vo.MemberVO;
import com.mypet.vo.NearVO;
import com.mypet.vo.PetVO;

@Controller
public class NearController {
	
	@Autowired
	private NearDAO nearDAO;
	
	@Autowired
	private PetDAO petDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private MypageDAO mypageDAO;
	
	@RequestMapping(value="/near.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView near(HttpServletRequest request, String search_select, String search_text) {		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		
		if (search_select == null) {
			if (session.getAttribute("session_id") != null) {
				String addr = nearDAO.getaddr_select((String)session.getAttribute("session_id"));
				mv.addObject("addr", addr);
			}		
			
			ArrayList<NearVO> list = nearDAO.getNearList();
			for (int i=0; i<list.size(); i++) {
				list.get(i).setCategory(nearDAO.getNearPet(list.get(i).getPid()));
			}
			
			ArrayList<NearVO> alist = nearDAO.getAddrList();	
			ArrayList<ArrayList<NearVO>> Mlist = new ArrayList<ArrayList<NearVO>>();
			ArrayList<NearVO> mlist = new ArrayList<NearVO>();
			
			for (int i=0; i<alist.size(); i++) {
				mlist = nearDAO.getMapList(alist.get(i).getAddr());
				
				for (int j=0; j<mlist.size(); j++) {
					PetVO vo = petDAO.getPetContent(mlist.get(j).getPid());
					mlist.get(j).setVo(vo);				
				}				
				
				Mlist.add(mlist);
			}
			
			for (int i=0; i<list.size(); i++) {
				String name = memberDAO.getName(list.get(i).getId());
				list.get(i).setName(name.substring(0, 1));
				
				String s[] = list.get(i).getStartdate().split(" ");
				list.get(i).setStartdate(s[0]);
				
			}
			
			mv.addObject("alist", alist);
			mv.addObject("list", list);
			mv.addObject("mlist", Mlist);
			
		} else {
			
			String addr = null;
			
			if (session.getAttribute("session_id") != null) {
				addr = nearDAO.getaddr_select((String)session.getAttribute("session_id"));
			}		
			
			NearVO vo = new NearVO();
			vo.setSearch_select(search_select); vo.setSearch_text(search_text);
			
			ArrayList<NearVO> list = nearDAO.getNearListVO(vo);
			ArrayList<NearVO> alist = new ArrayList<NearVO>();
			
			for (int i=0; i<list.size(); i++) {
				list.get(i).setCategory(nearDAO.getNearPet(list.get(i).getPid()));				
				alist.add(nearDAO.getAddrListVO(list.get(i).getNid()));	
			}			
			
			ArrayList<ArrayList<NearVO>> Mlist = new ArrayList<ArrayList<NearVO>>();
			ArrayList<NearVO> mlist = new ArrayList<NearVO>();
			
			for (int i=0; i<alist.size(); i++) {
				mlist = nearDAO.getMapList(alist.get(i).getAddr());
				
				for (int j=0; j<mlist.size(); j++) {
					addr = mlist.get(j).getAddr();
					PetVO pvo = petDAO.getPetContent(mlist.get(j).getPid());
					mlist.get(j).setVo(pvo);				
				}				
				
				Mlist.add(mlist);
			}
			
			for (int i=0; i<list.size(); i++) {
				String name = memberDAO.getName(list.get(i).getId());
				list.get(i).setName(name.substring(0, 1));
				
				String s[] = list.get(i).getStartdate().split(" ");
				list.get(i).setStartdate(s[0]);
				
			}
			
			mv.addObject("alist", alist);
			mv.addObject("list", list);
			mv.addObject("mlist", Mlist);
			mv.addObject("addr", addr);
			
		}		
		
		mv.setViewName("near/near");
		return mv;
	}
	
	@RequestMapping(value="/near_contents.do", method=RequestMethod.GET)
	public ModelAndView near_contents(String nid, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		
		nearDAO.getHit(nid);
		NearVO nvo = new NearVO();
		nvo.setId((String)session.getAttribute("session_id"));
		nvo.setNid(nid);
		if (nvo.getId()== null) {
			nvo.setId("admin");
		}
			
		int val = nearDAO.getNearHeartResult(nvo);
		int count = nearDAO.getNearHeartCount(nid);
		mv.addObject("count", count);
		
		if (val!=0) {
			mv.addObject("heart", "t");
		} else {
			mv.addObject("heart", "f");
		}
		
		NearVO vo = nearDAO.getNearContent(nid);
		vo.setCategory(nearDAO.getNearPet(vo.getPid()));
				
		mv.addObject("vo", vo);
		mv.setViewName("near/near_contents");
		
		return mv;
	}
	
	@RequestMapping(value="/near_writing.do")
	public ModelAndView near_writing(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		String id = (String)session.getAttribute("session_id");
		
		ArrayList<PetVO> list = petDAO.getPetList(id);
		mv.addObject("list", list);		
		mv.setViewName("near/near_writing");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/near_upload.do", method=RequestMethod.POST)
	public boolean near_upload(HttpServletRequest request, NearVO vo) {
		HttpSession session = request.getSession(); //技记 积己
		boolean result = false;
		
		vo.setId((String)session.getAttribute("session_id"));
		vo.setAddr(nearDAO.getaddr_select(vo.getId()));
		String a[] = vo.getKind().split("/");
		vo.setPid(a[0]);
		vo.setKind(a[1]);
		vo.setCategory(a[2]);
		
		int val = nearDAO.getNearUpload(vo);
		
		if (val!=0) {
			vo.setNid(nearDAO.getNidSelect());			
			val = nearDAO.getMapUpload(vo);
			if (val!=0) {
				result = true;				
			}
			
		}		
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/near_delete.do", method=RequestMethod.POST)
	public boolean near_delete(HttpServletRequest request) {
		boolean result = false;
		
		String nid = request.getParameter("nid");
		int val = nearDAO.getMapDelete(nid);
		
		if (val!=0) {
			val = nearDAO.getNearDelete(nid);			
			if (val!=0) {
				result = true;
			}
		}
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/near_heart_upload.do", method=RequestMethod.POST)
	public boolean near_heart_upload(HttpServletRequest request) {
		HttpSession session = request.getSession(); //技记 积己
		boolean result = false;
		NearVO vo = new NearVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setNid(request.getParameter("nid"));
		
		int val = nearDAO.getNearHeartUpload(vo);
		
		if (val!=0) {
			result = true;
		}
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/near_heart_delete.do", method=RequestMethod.POST)
	public boolean near_heart_delete(HttpServletRequest request) {
		HttpSession session = request.getSession(); //技记 积己
		boolean result = false;
		NearVO vo = new NearVO();
		vo.setId((String)session.getAttribute("session_id"));
		vo.setNid(request.getParameter("nid"));
		
		int val = nearDAO.getNearHeartDelete(vo);
		
		if (val!=0) {
			result = true;
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/near_update.do", method=RequestMethod.GET)
	public ModelAndView near_update(String nid) {
		ModelAndView mv = new ModelAndView();
		
		NearVO vo = nearDAO.getNearContent(nid);
		
		vo.setCategory(nearDAO.getNearPet(vo.getPid()));
		
		mv.addObject("vo", vo);
		mv.setViewName("near/near_update");		
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/near_update_upload.do", method=RequestMethod.POST)
	public boolean near_upadate_upload(NearVO vo) {
		boolean result = false;
		
		String a[] = vo.getKind().split("/");
		vo.setKind(a[0]);
		vo.setCategory(a[1]);
		
		int val = nearDAO.getNearUpdateUpload(vo);
		
		if (val!=0) {
			val = nearDAO.getMapUpdateUpload(vo);
			
			if (val!=0) {
				result = true;				
			}
		}
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/near_end.do", method=RequestMethod.POST)
	public boolean near_end(HttpServletRequest request) {
		boolean result = false;
		
		String nid = request.getParameter("nid");
		int val = nearDAO.getNearEnd(nid);
		
		if (val!=0) {			
				result = true;
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/near2.do")
	public ModelAndView near2() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<NearVO> list = nearDAO.getNearList2();
		for (int i=0; i<list.size(); i++) {
			MemberVO vo = mypageDAO.getMemberInfo(list.get(i).getId());
			list.get(i).setEmail(vo.getEmail());
			String addr[] = vo.getAddr1().split(" ");
			list.get(i).setAddr(addr[0]+" "+addr[1]);
		}
		
		mv.addObject("list", list);		
		mv.setViewName("near/near2");
		
		return mv;
	}
	
	@RequestMapping(value="/near_writing2.do")
	public String near_writing2() {
		return "near/near_writing2";
	}
	@ResponseBody
	@RequestMapping(value="/near_upload2.do", method=RequestMethod.POST)
	public boolean near_upload2(HttpServletRequest request, NearVO vo) {
		HttpSession session = request.getSession(); //技记 积己
		boolean result = false;
		
		vo.setId((String)session.getAttribute("session_id"));
		
		int val = nearDAO.getNearUpload2(vo);
		
		if (val!=0) {			
				result = true;	
		}		
		
		return result;
		
	}
	
	@RequestMapping(value="/near_contents2.do", method=RequestMethod.GET)
	public ModelAndView near_contents2(String nid, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		
		nearDAO.getHit2(nid);
		NearVO nvo = new NearVO();
		nvo.setId((String)session.getAttribute("session_id"));
		nvo.setNid(nid);
				
		NearVO vo = nearDAO.getNearContent2(nid);
				
		mv.addObject("vo", vo);
		mv.setViewName("near/near_contents2");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/near_delete2.do", method=RequestMethod.POST)
	public boolean near_delete2(HttpServletRequest request) {
		boolean result = false;
		
		String nid = request.getParameter("nid");
		int val = nearDAO.getNearDelete2(nid);		
		
		if (val!=0) {
			result =true;
		}
		
		return result;		
		
	}
	
	@RequestMapping(value="/near_update2.do", method=RequestMethod.GET)
	public ModelAndView near_update2(String nid) {
		ModelAndView mv = new ModelAndView();
				
		NearVO vo = nearDAO.getNearContent2(nid);			
		
		mv.addObject("vo", vo);
		mv.setViewName("near/near_update2");		
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/near_update_upload2.do", method=RequestMethod.POST)
	public boolean near_upadate_upload2(NearVO vo) {
		boolean result = false;
		
		int val = nearDAO.getNearUpdateUpload2(vo);
		
			
			if (val!=0) {
				result = true;				
			}
		
		return result;
	}
	

}
