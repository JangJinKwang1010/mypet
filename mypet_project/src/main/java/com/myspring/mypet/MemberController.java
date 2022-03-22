package com.myspring.mypet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.MemberDAO;
import com.mypet.service.SendEmailService;
import com.mypet.vo.MemberVO;

@Controller
public class MemberController {	
	
	@Autowired
	private MemberDAO MemberDAO;
	
	@Autowired
	private SendEmailService SendEmailService;
	
	//ȸ������
	@RequestMapping(value="/join.do")
	public String join() {
		return "member/join";
	}
	
	//ȸ������ proc
	@ResponseBody
	 @RequestMapping(value="/join_proc.do", method=RequestMethod.POST) 
	public ModelAndView join_proc(MemberVO vo) { 
		 ModelAndView mv = new ModelAndView();		 
		 
		 int result = MemberDAO.getJoinResult(vo);
		 
		 if (result != 0) {			 
			 mv.setViewName("redirect:/success.do"); 
		} else {
			mv.setViewName("redirect:/join.do");
		}
		
		 return mv; 
	}
	
	//����������
	@RequestMapping(value="/success.do")
	public String success() {
		return "member/success";
	}
	
	//�α��� proc
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST) 
	public ModelAndView login_proc(MemberVO vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //���� ����
		
		int result = MemberDAO.getLoginResult(vo);
		
		if (result == 1) {
			mv.setViewName("redirect:/index.do");
			session.setAttribute("session_id", vo.getId());
			String name = MemberDAO.getName(vo.getId());
			session.setAttribute("session_name", name);
			MemberDAO.getMcount(vo);
			
		} else {
			mv.setViewName("redirect:/join.do");
		}
		
		return mv;
	}
	
	//�α׾ƿ� proc
	@RequestMapping(value = "/logout.do", method=RequestMethod.GET)
	 public ModelAndView logout(HttpServletRequest request) {
		 ModelAndView mv = new ModelAndView();
		 HttpSession session = request.getSession();
	     session.invalidate();
	     
	     mv.setViewName("redirect:/index.do");

	     return mv;

	 }
	
	//���̵� �ߺ�Ȯ��
	@ResponseBody
	@RequestMapping(value="/id_check.do", method=RequestMethod.POST)
	public boolean id_check(HttpServletRequest request) {
		boolean result = false;
		
		int value = MemberDAO.getIdCheck(request.getParameter("id"));
		if (value == 0) {
			result = true;
		}
		
		return result;
	}
	//���̵�/��й�ȣã��
	@RequestMapping(value="/find.do")
	public String find() {
		return "member/find";
	}
	
	//���̵�/��й�ȣã�� ����â
	@RequestMapping(value="/find_fail.do")
	public String find_fail() {
		return "member/find_fail";
	}
	//���̵�ã�� ����
	@RequestMapping(value="/success_id.do")
	public String success_id() {
		return "member/success_id";
	}
	//��й�ȣã�� ����
	@RequestMapping(value="/success_pass.do")
	public String success_pass() {
		return "member/success_pass";
	}
	
	//���̵�ã�� ������ġ����Ȯ��
	@ResponseBody
	@RequestMapping(value="/id_find_check.do", method=RequestMethod.POST)
	public boolean id_find_check(HttpServletRequest request) {
		boolean result = false;
		
		MemberVO vo = new MemberVO();
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		
		int val = MemberDAO.getIdfindCheck(vo);
		if (val == 1) {
			result = true;
		}
		
		return result;
	}
	
	//�̸�������
	@ResponseBody
    @RequestMapping(value = "/sendEmail.do", method = RequestMethod.POST)
     public void sendEmail(HttpServletRequest request) throws Exception {
		//���� �̸��ϰ� ������ȣ�� Service�� ����
		SendEmailService.sendEmail(request.getParameter("email"), request.getParameter("text"));
	}
	
	//���̵� ã��
	@RequestMapping(value="/id_find_proc.do", method=RequestMethod.POST) 
	public ModelAndView id_find_proc(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("id", MemberDAO.getIdfindInfo(vo));
		mv.setViewName("member/success_id");
		
		return mv;
	}
	
	//��й�ȣã�� ������ġ����Ȯ��
	@ResponseBody
	@RequestMapping(value="/pass_find_check.do", method=RequestMethod.POST)
	public boolean pass_find_check(HttpServletRequest request) {
		boolean result = false;
		
		MemberVO vo = new MemberVO();
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		vo.setId(request.getParameter("id"));
		
		int val = MemberDAO.getPassfindCheck(vo);
		if (val == 1) {
			result = true;
		}
		
		return result;
	}
	
	//�н����� ã��
	@RequestMapping(value="/pass_find_proc.do", method=RequestMethod.POST) 
	public ModelAndView pass_find_proc(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);
		mv.setViewName("member/success_pass");
		
		return mv;
	}
	
	//�н����� ����
	@ResponseBody
	@RequestMapping(value="/pass_change_proc.do", method=RequestMethod.POST)
	public boolean pass_change_proc(HttpServletRequest request) {
		boolean result = false;
		
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id")); 
		vo.setPass(request.getParameter("pass"));
		
		int val = MemberDAO.getPassChange(vo);
		
		if (val!=0) {
			result = true;
		}
		
		return result;
	}


}
