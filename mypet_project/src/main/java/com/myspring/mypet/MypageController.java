package com.myspring.mypet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping(value="/mypage.do") 
	public String mypage() {
		return "mypage/mypage";
	}

	@RequestMapping(value="/mypage_update.do") 
	public String mypage_update() {
		return "mypage/mypage_update";
	}
	@RequestMapping(value="/pass_change.do") 
	public String pass_change() {
		return "mypage/pass_change";
	}
	@RequestMapping(value="/membership_withdrawal.do") 
	public String membership_withdrawal() {
		return "mypage/membership_withdrawal";
	}
}
