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
}
