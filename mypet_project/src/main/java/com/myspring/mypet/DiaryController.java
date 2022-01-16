package com.myspring.mypet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryController {
	@RequestMapping(value="/diary.do")
	public String diary() {
		return "diary/diary";
	}
	@RequestMapping(value="/diary_writing.do")
	public String diary_writing() {
		return "diary/diary_writing";
	}
	@RequestMapping(value="/diary_reading_contents.do")
	public String diary_reading_contents() {
		return "diary/diary_reading_contents";
	}
	@RequestMapping(value="/diary_reading_pictures.do")
	public String diary_reading_pictures() {
		return "diary/diary_reading_pictures";
	}
}
