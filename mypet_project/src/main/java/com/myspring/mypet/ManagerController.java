package com.myspring.mypet;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.MemberDAO;
import com.mypet.dao.MypageDAO;
import com.mypet.vo.MemberVO;

@Controller
public class ManagerController {
	
	@Autowired
	private MemberDAO MemberDAO;
	
	@Autowired
	private MypageDAO MypageDAO;
	
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
	public String manager_pet() {
		return "manager/manager_pet";
	}
	
	@RequestMapping(value="/manager_near.do") 
	public String manager_near() {
		return "manager/manager_near";
	}
	
	@RequestMapping(value="/manager_diary.do") 
	public String manager_diary() {
		return "manager/manager_diary";
	}
	
	@RequestMapping(value="/manager_pet_content.do") 
	public String manager_pet_content() {
		return "manager/manager_pet_content";
	}
	
	@RequestMapping(value="/manager_member_content.do", method=RequestMethod.GET) 
	public ModelAndView manager_member_content(String id) {
		ModelAndView mv = new ModelAndView();
		
		MemberVO vo = MypageDAO.getMemberInfo(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("manager/manager_member_content");
		
		return mv;
	}
}