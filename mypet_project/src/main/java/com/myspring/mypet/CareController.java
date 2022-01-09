package com.myspring.mypet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.CareDAO;
import com.mypet.vo.CareVO;

@Controller
public class CareController {
	
	@Autowired
	private CareDAO CareDAO;
	
	@RequestMapping(value="/care.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView care(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //技记 积己
		String id = (String)session.getAttribute("session_id");
		
		if (!id.equals("")) {
			CareVO vo = CareDAO.getCare(id);
			
			vo.setBirth1(vo.getBirth().substring(0, 4));
			vo.setBirth2(vo.getBirth().substring(4, 6));
			vo.setBirth3(vo.getBirth().substring(6, 8));
			
			mv.addObject("vo", vo);
			mv.setViewName("care/care");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/care_profile.do")
	public String care_profile() {
		return "care/care_profile";
	}
}
