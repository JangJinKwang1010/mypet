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

import com.mypet.dao.CareDAO;
import com.mypet.dao.MemberDAO;
import com.mypet.dao.PetDAO;
import com.mypet.vo.CareVO;
import com.mypet.vo.MemberVO;
import com.mypet.vo.PetVO;

@Controller
public class IndexController {
	
	@Autowired
	private MemberDAO MemberDAO;
	
	@Autowired
	private PetDAO PetDAO;
	
	@Autowired
	private CareDAO CareDAO;
	
	@RequestMapping(value="/index.do") 
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession(); //技记 积己
		String id = (String)session.getAttribute("session_id");
		if (id != null) {
			MemberVO vo = MemberDAO.getIndexInfo(id);
			int Dcount = MemberDAO.getDcount(id);
			int Ccount = MemberDAO.getCcount(id);
			PetVO pvo = PetDAO.getRpet(id);
			
			if (pvo == null) {
				mv.addObject("rpet", "0");
			} else {
				mv.addObject("rpet", "1");
			}
			
			vo.setDcount(Dcount);  vo.setCcount(Ccount);
			
			mv.addObject("pvo", pvo);
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
	
	@RequestMapping(value="/mainpet.do") 
	public ModelAndView mainpet(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession(); //技记 积己
		String id = (String)session.getAttribute("session_id");
		
		ArrayList<PetVO> list = PetDAO.getIndexPet(id);
		
		mv.setViewName("mainpet");
		mv.addObject("list", list);
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/rpet_update.do", method=RequestMethod.POST)
	public boolean rpet_update(HttpServletRequest request, String pid) {
		boolean result = false;
		
		HttpSession session = request.getSession(); //技记 积己
		String id = (String)session.getAttribute("session_id");
		
		PetDAO.getRpetAllUpdate(id);
		int val = PetDAO.getRpetUpdate(pid);
		
		if (val!=0) {
			result = true;
		}
		
		return result;
	}
	
	@RequestMapping(value="/info.do", method=RequestMethod.GET)
	public ModelAndView getInfo(String id) {
		ModelAndView mv = new ModelAndView();
		
		CareVO vo = CareDAO.getInfoCare(id);
		ArrayList<CareVO> list = CareDAO.getInfoCareer(id);
		
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		mv.setViewName("info");
		
		return mv;
	}

}
