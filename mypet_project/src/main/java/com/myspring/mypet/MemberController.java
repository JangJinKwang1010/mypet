package com.myspring.mypet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.service.MemberService;
import com.mypet.vo.MemberVO;
@Controller
public class MemberController {
	
	@Autowired
	private MemberService MemberService;
	
	//회원가입
	@RequestMapping(value="/join.do")
	public String join() {
		return "member/join";
	}
	
	//회원가입_proc

	@ResponseBody
	 @RequestMapping(value="/join_proc.do", method=RequestMethod.POST) public
	 ModelAndView join_proc(MemberVO vo) { 
		 ModelAndView mv = new ModelAndView();		 
		 
		 boolean result = MemberService.getJoinResult(vo);
		 
		 if (result) {			 
			 mv.setViewName("index"); 
		} else {
			mv.setViewName("member/join");
		}
		
		 return mv; 
	}
	 
	
	

}
