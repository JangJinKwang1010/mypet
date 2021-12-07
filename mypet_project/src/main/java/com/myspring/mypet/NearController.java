package com.myspring.mypet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.vo.NearVO;

@Controller
public class NearController {
	
	@RequestMapping(value="/near.do")
	public ModelAndView near() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("near/near");
		return mv;
	}

}
