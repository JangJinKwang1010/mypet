package com.myspring.mypet;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.ChatDAO;
import com.mypet.vo.ChatVO;

@Controller
public class ChatController {
	
	@Autowired
	private ChatDAO ChatDAO;
	
	
	@RequestMapping(value="/chat_list.do", method=RequestMethod.GET)
	public ModelAndView chat(String id) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("from_id", id);
		mv.setViewName("chat/chat_list");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/chat_upload.do", method=RequestMethod.POST)
	public boolean chat_upload(HttpServletRequest request, String from_id, String content) {
		boolean result = false;
		HttpSession session = request.getSession(); //技记 积己
		ChatVO vo = new ChatVO();
		vo.setFrom_id(from_id);
		vo.setTo_id((String)session.getAttribute("session_id"));
		vo.setContent(content);
		
		int val = ChatDAO.getChatUpload(vo);
		if (val!= 0) {
			result = true;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/chat_history.do", method=RequestMethod.POST)
	public ArrayList<ChatVO> chat_history(HttpServletRequest request, String from_id) {
		ArrayList<ChatVO> list = new ArrayList<ChatVO>();
		HttpSession session = request.getSession(); //技记 积己
		ChatVO vo = new ChatVO();
		vo.setFrom_id(from_id);
		vo.setTo_id((String)session.getAttribute("session_id"));
		
		list = ChatDAO.getChatHistory(vo);		
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/chat_info.do", method=RequestMethod.POST)
	public  ArrayList<ChatVO> chat_info(HttpServletRequest request, String from_id) {
		HttpSession session = request.getSession(); //技记 积己
		ArrayList<ChatVO> list = new ArrayList<ChatVO>();
		ChatVO vo = new ChatVO();
		
		vo.setFrom_id(from_id); 
		vo.setTo_id((String)session.getAttribute("session_id"));
		
		if (!from_id.equals("")) {
			int val = ChatDAO.getChatInfoCheck(vo);
			if (val == 0) {
				ChatDAO.getChatInfoUpload(vo);
			}
		}
		
		list = ChatDAO.getChatInfoList(vo);	
		ArrayList<ChatVO> from_list = ChatDAO.getChatFromIdList((String)session.getAttribute("session_id"));
		
		return list; 
		
	}
	
}
