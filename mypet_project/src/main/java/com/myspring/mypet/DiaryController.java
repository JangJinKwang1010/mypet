package com.myspring.mypet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryController {
	@RequestMapping(value="/diary.do")
	public String diary() {
		return "diary/diary";
	}
	
}
