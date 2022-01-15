package com.myspring.mypet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
	
	@RequestMapping(value="/index.do") 
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@RequestMapping (value="/login_check.do")
	public boolean login_check(HttpServletRequest request) {
		
		boolean result = false;
		
		HttpSession session = request.getSession(); //技记 积己
		System.out.print(session.getAttribute("session_id"));
		if (session.getAttribute("seesion_id") != null) {
			result = true;
		}
		
		System.out.print(result);
		
		return result;
		
	}

}
