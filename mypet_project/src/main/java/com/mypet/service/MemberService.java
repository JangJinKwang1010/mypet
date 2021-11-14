package com.mypet.service;

import com.mypet.vo.MemberVO;

public interface MemberService {
	
	boolean getJoinResult(MemberVO vo);
	boolean getLoginResult(MemberVO vo);

}
