package com.mypet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypet.dao.MemberDAO;
import com.mypet.vo.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO MemberDAO;
	
	public boolean getJoinResult(MemberVO vo) {
		int val = MemberDAO.getJoinResult(vo);
		boolean result = false;
		
		if (val!=0) {
			result = true;
		}
		
		return result;
	}
	
	public boolean getLoginResult(MemberVO vo) {
		int val = MemberDAO.getLoginResult(vo);
		boolean result = false;
		
		if (val == 1) {
			result = true;
		}
		
		return result;
	}
	
	

}
