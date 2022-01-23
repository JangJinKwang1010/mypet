package com.mypet.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mypet.vo.MemberVO;

@Repository
public class CareDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.care";
	
	public MemberVO getCare(String id) {
		return sqlSession.selectOne(namespace+".care", id);
	}

}
