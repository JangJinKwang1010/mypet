package com.myspring.mypet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.MemberDAO;
import com.mypet.service.MemberService;
import com.mypet.vo.MemberVO;
@Controller
public class MemberController {
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private MemberDAO MemberDAO;
	
	//회원가입
	@RequestMapping(value="/join.do")
	public String join() {
		return "member/join";
	}
	
	//회원가입 proc
	@ResponseBody
	 @RequestMapping(value="/join_proc.do", method=RequestMethod.POST) 
	public ModelAndView join_proc(MemberVO vo) { 
		 ModelAndView mv = new ModelAndView();		 
		 
		 boolean result = MemberService.getJoinResult(vo);
		 
		 if (result) {			 
			 mv.setViewName("redirect:/index.do"); 
		} else {
			mv.setViewName("redirect:/join.do");
		}
		
		 return mv; 
	}
	
	//로그인 proc
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST) 
	public ModelAndView login_proc(MemberVO vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //세션 생성
		
		int result = MemberDAO.getLoginResult(vo);
		
		if (result == 1) {
			mv.setViewName("redirect:/index.do");
			session.setAttribute("session_id", vo.getId());
			
		} else {
			mv.setViewName("redirect:/join.do");
		}
		
		return mv;
	}
	
	

}
