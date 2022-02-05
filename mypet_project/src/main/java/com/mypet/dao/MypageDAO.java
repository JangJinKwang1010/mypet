package com.mypet.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mypet.vo.MemberVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.mypage";
	
	public MemberVO getMemberInfo(String id) {
		return sqlSession.selectOne(namespace+".member_info", id);
	}
	
	public int getMypageinpass(MemberVO vo) {
		return sqlSession.selectOne(namespace+".Mypage_inpass", vo);
	}

}
