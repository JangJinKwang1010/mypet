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
import com.mypet.service.SendEmailService;
import com.mypet.vo.MemberVO;

@Controller
public class MemberController {	
	
	@Autowired
	private MemberDAO MemberDAO;
	
	@Autowired
	private SendEmailService SendEmailService;
	
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
			MemberDAO.getMcount(vo);
			
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
	
	//아이디찾기 정보일치여부확인
	@ResponseBody
	@RequestMapping(value="/id_find_check.do", method=RequestMethod.POST)
	public boolean id_find_check(HttpServletRequest request) {
		boolean result = false;
		
		MemberVO vo = new MemberVO();
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		
		int val = MemberDAO.getIdfindCheck(vo);
		if (val == 1) {
			result = true;
		}
		
		return result;
	}
	
	//이메일인증
	@ResponseBody
    @RequestMapping(value = "/sendEmail.do", method = RequestMethod.POST)
     public void sendEmail(HttpServletRequest request) throws Exception {
		//보낼 이메일과 인증번호를 Service로 전달
		SendEmailService.sendEmail(request.getParameter("email"), request.getParameter("text"));
	}
	
	//아이디 찾기
	@RequestMapping(value="/id_find_proc.do", method=RequestMethod.POST) 
	public ModelAndView id_find_proc(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("id", MemberDAO.getIdfindInfo(vo));
		mv.setViewName("member/success_id");
		
		return mv;
	}
	
	//비밀번호찾기 정보일치여부확인
	@ResponseBody
	@RequestMapping(value="/pass_find_check.do", method=RequestMethod.POST)
	public boolean pass_find_check(HttpServletRequest request) {
		boolean result = false;
		
		MemberVO vo = new MemberVO();
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		vo.setId(request.getParameter("id"));
		
		int val = MemberDAO.getPassfindCheck(vo);
		if (val == 1) {
			result = true;
		}
		
		return result;
	}
	
	//패스워드 찾기
	@RequestMapping(value="/pass_find_proc.do", method=RequestMethod.POST) 
	public ModelAndView pass_find_proc(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);
		mv.setViewName("member/success_pass");
		
		return mv;
	}
	
	//패스워드 변경
	@ResponseBody
	@RequestMapping(value="/pass_change_proc.do", method=RequestMethod.POST)
	public boolean pass_change_proc(HttpServletRequest request) {
		boolean result = false;
		
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id")); 
		vo.setPass(request.getParameter("pass"));
		
		int val = MemberDAO.getPassChange(vo);
		
		if (val!=0) {
			result = true;
		}
		
		return result;
	}


}
