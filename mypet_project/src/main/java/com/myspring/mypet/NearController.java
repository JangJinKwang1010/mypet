package com.myspring.mypet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NearController {
	
	@RequestMapping(value="/near.do")
	public String near() {
		return "near/near";
	}

}
