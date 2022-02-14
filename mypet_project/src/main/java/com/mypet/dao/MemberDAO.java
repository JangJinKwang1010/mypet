package com.mypet.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mypet.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.member";
	
	public int getJoinResult(MemberVO vo) {
		return sqlSession.insert(namespace+".join", vo);
	}
	
	public int getLoginResult(MemberVO vo) {
		return sqlSession.selectOne(namespace+".login", vo);
	}
	
	public int getIdCheck(String id) {
		return sqlSession.selectOne(namespace+".id_check", id);
	}
	
	public String getName(String id) {
		return sqlSession.selectOne(namespace+".name", id);
	}
	
	public MemberVO getIndexInfo(String id) {
		return sqlSession.selectOne(namespace+".index_info", id);
	}
	
	public int getIdfindCheck(MemberVO vo) {
		return sqlSession.selectOne(namespace+".id_find_check", vo);
	}
	
	public String getIdfindInfo(MemberVO vo) {
		return sqlSession.selectOne(namespace+".id_find_info", vo);
	}
	
	public int getPassfindCheck(MemberVO vo) {
		return sqlSession.selectOne(namespace+".pass_find_check", vo);
	}
	
	public int getPassChange(MemberVO vo) {
		return sqlSession.update(namespace+".pass_change", vo);
	}
	
	

}
