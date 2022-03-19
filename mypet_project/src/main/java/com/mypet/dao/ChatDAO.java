package com.mypet.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mypet.vo.ChatVO;
import com.mypet.vo.NearVO;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.chat";
	
	public int getChatUpload(ChatVO vo) {
		return sqlSession.insert(namespace+".chat_upload", vo);
	}
	
	public ArrayList<ChatVO> getChatHistory(ChatVO vo) {
		List<ChatVO> list = sqlSession.selectList(namespace+".chat_history", vo);		
		return (ArrayList<ChatVO>)list;
	}
	
	public int getChatInfoCheck(ChatVO vo) {
		return sqlSession.selectOne(namespace+".chat_info_check", vo);
	}
	
	public int getChatInfoUpload(ChatVO vo) {
		return sqlSession.insert(namespace+".chat_info_upload", vo);
	}
	
	public ArrayList<ChatVO> getChatInfoList(ChatVO vo) {
		List<ChatVO> list = sqlSession.selectList(namespace+".chat_info_list", vo);		
		return (ArrayList<ChatVO>)list;
	}
	
	public ArrayList<ChatVO> getChatFromIdList(String to_id) {
		List<ChatVO> list = sqlSession.selectList(namespace+".chat_from_id_list", to_id);		
		return (ArrayList<ChatVO>)list;
	}

}
