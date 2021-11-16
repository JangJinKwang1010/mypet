package com.myspring.mypet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.vo.NearVO;

@Controller
public class NearController {
	
	@RequestMapping(value="/near.do", method=RequestMethod.POST)
	public ModelAndView near(NearVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);		
		mv.setViewName("near/near");
		return mv;
	}
	
	@RequestMapping(value="/near_intro.do")
	public String near_intro() {
		return "near/near_intro";
	}

}
