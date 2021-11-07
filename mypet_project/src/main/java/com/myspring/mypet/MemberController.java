package com.myspring.mypet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MemberController {
	
	
	//회원가입
	@RequestMapping(value="/join.do")
	public String join() {
		return "join/join";
	}
	
	//회원가입_proc
	/*
	 * @RequestMapping(value="/join_proc.do", method=RequestMethod.POST) public
	 * ModelAndView join_proc(MemberVO vo) { ModelAndView mv = new ModelAndView();
	 * 
	 * String security_pass = pwdEncoder.encode(vo.getPass());
	 * vo.setPass(security_pass);
	 * 
	 * boolean result = MemberService.getJoinResult(vo);
	 * 
	 * if (result) { //신규가입 쿠폰 발행 CouponService.getNewCoupon(vo.getId());
	 * 
	 * mv.setViewName("member/success"); } else { mv.setViewName("member/fail"); }
	 * 
	 * return mv; }
	 */
	
	

}
