package com.myspring.mypet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.NearDAO;

@Controller
public class NearController {
	
	@Autowired
	private NearDAO nearDAO;
	
	@RequestMapping(value="/near.do")
	public ModelAndView near(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		if (session.getAttribute("session_id") != null) {
			String addr = nearDAO.getaddr_select((String)session.getAttribute("session_id"));
			mv.addObject("addr", addr);
		}
		
		mv.setViewName("near/near");
		return mv;
	}

}
