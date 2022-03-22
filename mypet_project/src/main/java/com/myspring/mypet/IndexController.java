package com.myspring.mypet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.MemberDAO;
import com.mypet.vo.MemberVO;

@Controller
public class IndexController {
	
	@Autowired
	private MemberDAO MemberDAO;
	
	@RequestMapping(value="/index.do") 
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession(); //技记 积己
		String id = (String)session.getAttribute("session_id");
		if (id != null) {
			MemberVO vo = MemberDAO.getIndexInfo(id);
			int Dcount = MemberDAO.getDcount(id);
			int Ccount = MemberDAO.getCcount(id);
			vo.setDcount(Dcount);  vo.setCcount(Ccount);
			mv.addObject("vo", vo);
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping (value="/login_check.do")
	public boolean login_check(HttpServletRequest request) {
		
		boolean result = false;
		
		HttpSession session = request.getSession(); //技记 积己
		String id = (String)session.getAttribute("session_id");
		if (id != null) {
			result = true;
		}
		
		return result;
		
	}

}
