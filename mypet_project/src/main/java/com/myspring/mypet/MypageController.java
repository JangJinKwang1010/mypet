package com.myspring.mypet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.MypageDAO;
import com.mypet.vo.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO MypageDAO;
	
	@RequestMapping(value="/mypage.do") 
	public String mypage() {
		return "mypage/mypage";
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
	
	@RequestMapping(value="/mypage_pass.do") 
	public String mypage_pass() {
		return "mypage/mypage_pass";
	}
	@RequestMapping(value="/mypage_delete.do") 
	public String mypage_delete() {
		return "mypage/mypage_delete";
	}
	@RequestMapping(value="/mypage_postmanager.do") 
	public String mypage_postmanager() {
		return "mypage/mypage_postmanager";
	}
	@RequestMapping(value="/mypage_nearpet.do") 
	public String mypage_nearpet() {
		return "mypage/mypage_nearpet";
	}
}
