package com.myspring.mypet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MemberController {
	
	
	//ȸ������
	@RequestMapping(value="/join.do")
	public String join() {
		return "join/join";
	}
	
	//ȸ������_proc
	/*
	 * @RequestMapping(value="/join_proc.do", method=RequestMethod.POST) public
	 * ModelAndView join_proc(MemberVO vo) { ModelAndView mv = new ModelAndView();
	 * 
	 * String security_pass = pwdEncoder.encode(vo.getPass());
	 * vo.setPass(security_pass);
	 * 
	 * boolean result = MemberService.getJoinResult(vo);
	 * 
	 * if (result) { //�ű԰��� ���� ���� CouponService.getNewCoupon(vo.getId());
	 * 
	 * mv.setViewName("member/success"); } else { mv.setViewName("member/fail"); }
	 * 
	 * return mv; }
	 */
	
	

}
