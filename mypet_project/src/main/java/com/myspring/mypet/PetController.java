package com.myspring.mypet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PetController {
	@RequestMapping(value="/pet.do")
	public String pet() {
		return "pet/pet";
	}
	
}
