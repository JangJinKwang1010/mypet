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
import com.mypet.vo.MemberVO;

@Controller
public class MemberController {	
	
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
		 
		 int result = MemberDAO.getJoinResult(vo);
		 
		 if (result != 0) {			 
			 mv.setViewName("redirect:/success.do"); 
		} else {
			mv.setViewName("redirect:/join.do");
		}
		
		 return mv; 
	}
	
	//성공페이지
	@RequestMapping(value="/success.do")
	public String success() {
		return "member/success";
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
			String name = MemberDAO.getName(vo.getId());
			session.setAttribute("session_name", name);
			
		} else {
			mv.setViewName("redirect:/join.do");
		}
		
		return mv;
	}
	
	//로그아웃 proc
	@RequestMapping(value = "/logout.do", method=RequestMethod.GET)
	 public ModelAndView logout(HttpServletRequest request) {
		 ModelAndView mv = new ModelAndView();
		 HttpSession session = request.getSession();
	     session.invalidate();
	     
	     mv.setViewName("redirect:/index.do");

	     return mv;

	 }
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value="/id_check.do", method=RequestMethod.POST)
	public boolean id_check(HttpServletRequest request) {
		boolean result = false;
		
		int value = MemberDAO.getIdCheck(request.getParameter("id"));
		if (value == 0) {
			result = true;
		}
		
		return result;
	}
	//아이디/비밀번호찾기
	@RequestMapping(value="/find.do")
	public String find() {
		return "member/find";
	}
	//아이디/비밀번호찾기 실패창
	@RequestMapping(value="/find_fail.do")
	public String find_fail() {
		return "member/find_fail";
	}
	//아이디찾기 성공
	@RequestMapping(value="/success_id.do")
	public String success_id() {
		return "member/success_id";
	}
	//비밀번호찾기 성공
	@RequestMapping(value="/success_pass.do")
	public String success_pass() {
		return "member/success_pass";
	}
	

}
