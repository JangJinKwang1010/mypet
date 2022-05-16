package com.myspring.mypet;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.CareDAO;
import com.mypet.dao.DiaryDAO;
import com.mypet.dao.MemberDAO;
import com.mypet.dao.MypageDAO;
import com.mypet.dao.NearDAO;
import com.mypet.dao.PetDAO;
import com.mypet.vo.CareVO;
import com.mypet.vo.DiaryVO;
import com.mypet.vo.MemberVO;
import com.mypet.vo.NearVO;
import com.mypet.vo.PetVO;

@Controller
public class ManagerController {
	
	@Autowired
	private MemberDAO MemberDAO;
	
	@Autowired
	private MypageDAO MypageDAO;
	
	@Autowired
	private PetDAO PetDAO;
	
	@Autowired
	private NearDAO NearDAO;
	
	@Autowired
	private DiaryDAO DiaryDAO;
	
	@Autowired
	private CareDAO CareDAO;
	
	@RequestMapping(value="/manager_commons.do") 
	public String manager_commons() {
		return "manager/manager_commons";
	}
	
	@RequestMapping(value="/manager.do") 
	public String manager() {
		return "manager/manager";
	}
	
	@RequestMapping(value="/manager_member.do") 
	public ModelAndView manager_member() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<MemberVO> list = MemberDAO.getMemberList();
		mv.addObject("list", list);		
		mv.setViewName("manager/manager_member");		
		
		return mv;
	}
	
	@RequestMapping(value="/manager_pet.do") 
	public ModelAndView manager_pet() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<PetVO> list = PetDAO.getManagerPetList();
		mv.addObject("list", list);
		mv.setViewName("manager/manager_pet");
		
		return mv;
	}
	
	@RequestMapping(value="/manager_near.do") 
	public ModelAndView manager_near() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<NearVO> list = NearDAO.getManagerNearList();
		for (int i=0; i<list.size(); i++) {
			String start[] = list.get(i).getStartdate().split(" ");
			list.get(i).setStartdate(start[0]);
		}
		
		mv.addObject("list", list);
		mv.setViewName("manager/manager_near");
		
		return mv;
	}
	
	@RequestMapping(value="/manager_free_diary.do") 
	public ModelAndView manager_free_diary() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<DiaryVO> list = DiaryDAO.getManagerFreeList();
		mv.addObject("list", list);
		mv.setViewName("manager/manager_free_diary");
		
		return mv;
	}
	
	@RequestMapping(value="/manager_pictures_diary.do") 
	public ModelAndView manager_pictures_diary() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<DiaryVO> list = DiaryDAO.getManagerPicturesList();
		
		mv.addObject("list", list);
		mv.setViewName("manager/manager_pictures_diary");
		
		return mv;
	}
	
	@RequestMapping(value="/manager_pet_content.do", method=RequestMethod.GET) 
	public ModelAndView manager_pet_content(String pid) {
		ModelAndView mv = new ModelAndView();
		
		PetVO vo = PetDAO.getManagerPetContent(pid);
		String start[] = vo.getStartdate().split("-");
		String start1[] = start[2].split(" ");
		vo.setStartdate(start[0]+"년 "+start[1]+"월 "+ start1[0]+"일");
		
		String birth[] = vo.getPbirth().split("-");
		String birth1[] = birth[2].split(" ");
		vo.setPbirth(birth[0]+"년 "+birth[1]+"월 "+ birth1[0]+"일");
		
		
		
		mv.setViewName("manager/manager_pet_content");
		mv.addObject("vo", vo);
		
		
		return mv;
	}
	
	@RequestMapping(value="/manager_member_content.do", method=RequestMethod.GET) 
	public ModelAndView manager_member_content(String id) {
		ModelAndView mv = new ModelAndView();
		
		MemberVO vo = MypageDAO.getMemberInfo(id);
		String birth[] = vo.getBirth().split("-");
		String birth1[] = birth[2].split(" ");
		vo.setBirth(birth[0]+"년 "+birth[1]+"월 "+ birth1[0]+"일");
		
		ArrayList<CareVO> list = CareDAO.getInfoCareer(id);
				
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		mv.setViewName("manager/manager_member_content");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/manager_member_delete.do", method=RequestMethod.POST)
	public boolean manager_member_delete(String id) {
		boolean result = false;
		
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
	
	@ResponseBody
	@RequestMapping(value="/manager_pet_delete.do", method=RequestMethod.POST)
	public boolean manager_pet_delete(String pid) {
		boolean result = false;
		
		int val = MypageDAO.getMypagePetDelete(pid);		
		
		if (val!=0) {
			result  = true;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/manager_near_delete.do", method=RequestMethod.POST)
	public boolean manager_near_delete(String nid) {
		boolean result = false;
		
		NearDAO.getManagerHeartDelete(nid);
		NearDAO.getMapDelete(nid);		
		int val = NearDAO.getNearDelete(nid);			
		
			if (val!=0) {
				result = true;
			}
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/manager_free_delete.do", method=RequestMethod.POST)
	public boolean manager_free_delete(String fid) {
		boolean result = false;
		
		int val = DiaryDAO.getFreeDelete(fid);		
		
			if (val!=0) {
				result = true;
			}
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/manager_pictures_delete.do", method=RequestMethod.POST)
	public boolean manager_pictures_delete(String pid) {
		boolean result = false;
		
		int val = DiaryDAO.getPicturesDelete(pid);	
		
			if (val!=0) {
				result = true;
			}
		
		
		return result;
	}
	
}