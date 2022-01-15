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
	@RequestMapping(value="/mypage_pass.do") 
	public String mypage_pass() {
		return "mypage/mypage_pass";
	}
	@RequestMapping(value="/mypage_delete.do") 
	public String mypage_delete() {
		return "mypage/mypage_delete";
	}
}
