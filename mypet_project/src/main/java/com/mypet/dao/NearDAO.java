package com.mypet.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NearDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.near";
	
	public String getaddr_select(String id) {
		return sqlSession.selectOne(namespace+".addr_select", id);
	}

}
