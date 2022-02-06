package com.myspring.mypet;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.dao.CareDAO;
import com.mypet.vo.CareVO;
import com.mypet.vo.MemberVO;

@Controller
public class CareController {
	
	@Autowired
	private CareDAO CareDAO;
	
	@RequestMapping(value="/care.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView care(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); //세션 생성
		String id = (String)session.getAttribute("session_id");
		
		if (!id.equals("")) {
			MemberVO vo = CareDAO.getCare(id);
			
			vo.setBirth1(vo.getBirth().substring(0, 4));
			vo.setBirth2(vo.getBirth().substring(4, 6));
			vo.setBirth3(vo.getBirth().substring(6, 8));
			
			int val = CareDAO.getCareResult(id);
			
			mv.addObject("vo", vo);
			mv.addObject("val", val);
			mv.setViewName("care/care");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/care_profile.do")
	public String care_profile() {
		return "care/care_profile";
	}
	
	@ResponseBody
	@RequestMapping(value = "/care_upload.do", method=RequestMethod.POST)
	public boolean getCareUpload(MultipartHttpServletRequest request, CareVO vo) throws Exception {
		boolean result = false;
		
		HttpSession session = request.getSession(); //세션 생성
		// 로그인 회원정보 가져오기
		String id = (String) session.getAttribute("session_id");
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "\\resources\\upload\\";
		
		
		System.out.print(request.getFile("file").getOriginalFilename());
		
		//rfname 중복방지 처리			
		UUID uuid = UUID.randomUUID();
		
		//DB저장
		vo.setCfile(vo.getFile().getOriginalFilename());
		vo.setSfile(uuid+ "_"+vo.getCfile());
		vo.setId(id);
		if (vo.getEnddate() == null) {
			vo.setEnddate("9999-12-31");
		}
		
		int val = CareDAO.getCareUpload(vo);
		int val2 = CareDAO.getCareerUpload(vo);
		if (val!=0 && val2 !=0) {
			result = true;
		}		
		//DB저장 완료 후 폴더에 저장하기
		if (result) {
			System.out.println(root_path + attach_path + uuid +"_"+vo.getCfile());

			File f = new File(root_path + attach_path + uuid
					+"_"+vo.getCfile()); 
			vo.getFile().transferTo(f);
		}
		
		return result;
	}
	
}
