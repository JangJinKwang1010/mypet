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
import com.mypet.dao.PetDAO;
import com.mypet.vo.MemberVO;
import com.mypet.vo.PetVO;

@Controller
public class PetController {

	@Autowired
	private PetDAO petdao;

	@RequestMapping(value = "/pet.do")
	public ModelAndView pet(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(); // 세션 생성
		String id = (String) session.getAttribute("session_id");

		MemberVO vo = petdao.getinfo(id);

		vo.setBirth1(vo.getBirth().substring(0, 4));
		vo.setBirth2(vo.getBirth().substring(4, 6));
		vo.setBirth3(vo.getBirth().substring(6, 8));
		
		int val = petdao.getPetResult(id);
		
		System.out.println(val);

		mv.addObject("vo", vo);
		mv.addObject("val", val);
		mv.setViewName("pet/pet");

		return mv;
	}

	@RequestMapping(value = "/testFile.do")
	public String testFile() {
		return "pet/testFile";
	}

	@RequestMapping(value = "/pet_profile.do")
	public String care_profile() {
		return "pet/pet_profile";
	}

	@ResponseBody
	@RequestMapping(value = "/pet_upload.do", method = RequestMethod.POST)
	public boolean getPetUpload(MultipartHttpServletRequest request, PetVO vo) throws Exception {
		boolean result = false;

		HttpSession session = request.getSession(); // 세션 생성
		// 로그인 회원정보 가져오기
		String id = (String) session.getAttribute("session_id");
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "\\resources\\upload\\";
		System.out.println(root_path+attach_path);

		// rfname 중복방지 처리
		UUID uuid = UUID.randomUUID();

		// DB저장 
		vo.setCfile(vo.getFile1().getOriginalFilename());
		vo.setSfile(uuid + 	"_" + vo.getCfile()); 
		vo.setId(id);
		int val = petdao.getCareUpload(vo);

		String[] category = vo.getCategory().split("@");
		String[] kind = vo.getKind().split("@");
		String[] bulk = vo.getBulk().split("@");
		String[] startdate = vo.getStartdate().split("@");
		String[] pname = vo.getPname().split("@");
		String[] pkg = vo.getPkg().split("@");
		String[] pgender = vo.getPgender().split("@");
		String[] pbirth = vo.getPbirth().split("@");
		String[] pcomment = vo.getPcomment().split("@");

		for (int i = 0; i < category.length;) {
			// rfname 중복방지 처리
			UUID uuid2 = UUID.randomUUID();
			
			if (category[i].equals("undefined") || category[i].equals("선택")) {
				i += 1;
			} else {
				vo.setCategory(category[i]);
				vo.setKind(kind[i]);
				vo.setBulk(bulk[i]);
				vo.setStartdate(startdate[i]); 
				vo.setPname(pname[i]); 
				vo.setPkg(pkg[i]);
				vo.setPgender(pgender[i]); 
				vo.setPbirth(pbirth[i]);
				vo.setPcomment(pcomment[i]);
				vo.setPfile(vo.pfile(i).getOriginalFilename());
				vo.setPsfile(uuid2 + "_" + vo.getPfile());
				
				 int val2 = petdao.getPetUpload(vo);
				 
				 if (val != 0 && val2 != 0) { 
					 result = true; 
					 
					 if (result) {
						 File f = new File(root_path + attach_path + vo.getPsfile()); 
						 vo.pfile(i).transferTo(f); 
					 }
				}
				
				++i;
			}		

		}

		// DB저장 완료 후 폴더에 저장하기 
		if (result) { 
			File f = new File(root_path + attach_path + uuid + "_" + vo.getCfile()); 
			vo.getFile1().transferTo(f); 
		}

		return result;
	}

}
