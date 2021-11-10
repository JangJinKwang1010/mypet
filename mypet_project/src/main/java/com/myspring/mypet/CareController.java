package com.myspring.mypet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CareController {
	@RequestMapping(value="/care.do")
	public String care() {
		return "care/care";
	}
}
