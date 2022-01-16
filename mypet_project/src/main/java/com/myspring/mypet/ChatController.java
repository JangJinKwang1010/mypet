package com.myspring.mypet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping(value="/chat_list.do") 
	public String chat_list() {
		return "chat/chat_list";
	}

}
