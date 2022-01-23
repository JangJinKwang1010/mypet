package com.myspring.mypet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.MemberDAO;
import com.mypet.dao.PetDAO;
import com.mypet.vo.MemberVO;

@Controller
public class PetController {
	
	@Autowired
	private PetDAO petdao;
	
	@RequestMapping(value="/pet.do")
	public ModelAndView pet(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		String id = (String)session.getAttribute("session_id");
		
		MemberVO vo = petdao.getinfo(id);
		mv.addObject("vo", vo);
		mv.setViewName("pet/pet");
		
		return mv;
	}
	
}
