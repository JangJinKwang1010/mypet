package com.mypet.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mypet.vo.CareVO;
import com.mypet.vo.MemberVO;

@Repository
public class CareDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.care";
	
	public MemberVO getCare(String id) {
		return sqlSession.selectOne(namespace+".care", id);
	}
	
	public int getCareUpload(CareVO vo) {
		return sqlSession.insert(namespace+".care_upload", vo);
	}
	
	public int getCareerUpload(CareVO vo) {
		return sqlSession.insert(namespace+".career_upload", vo);
	}
	
	public int getCareResult(String id) {
		return sqlSession.selectOne(namespace+".care_result", id);
	}

}
