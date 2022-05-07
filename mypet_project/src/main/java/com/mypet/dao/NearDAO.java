package com.mypet.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mypet.vo.NearVO;

@Repository
public class NearDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.near";
	
	public String getaddr_select(String id) {
		return sqlSession.selectOne(namespace+".addr_select", id);
	}
	
	public int getNearUpload(NearVO vo) {
		return sqlSession.insert(namespace+".near_upload", vo);
	}
	
	public String getNidSelect() {
		return sqlSession.selectOne(namespace+".nid_select");
	}
	
	public int getMapUpload(NearVO vo) {
		return sqlSession.insert(namespace+".map_upload", vo);
	}
	
	public ArrayList<NearVO> getNearList() {
		List<NearVO> list = sqlSession.selectList(namespace+".near_list");		
		return (ArrayList<NearVO>)list;
	}
	
	public ArrayList<NearVO> getMapList() {
		List<NearVO> list = sqlSession.selectList(namespace+".map_list");		
		return (ArrayList<NearVO>)list;
	}
	
	public NearVO getNearContent(String nid) {
		return sqlSession.selectOne(namespace+".near_content", nid);
	}
	
	public int getHit(String nid) {
		return sqlSession.update(namespace+".hit", nid);
	}
	
	public int getNearDelete(String nid) {
		return sqlSession.delete(namespace+".near_delete", nid);
	}
	
	public int getMapDelete(String nid) {
		return sqlSession.delete(namespace+".map_delete", nid);
	}
	
	public int getNearHeartUpload(NearVO vo) {
		return sqlSession.insert(namespace+".near_heart_upload", vo);
	}
	
	public int getNearHeartResult(NearVO vo) {
		return sqlSession.selectOne(namespace+".near_heart_result", vo);
	}
	
	public int getNearHeartDelete(NearVO vo) {
		return sqlSession.delete(namespace+".near_heart_delete", vo);
	}
	
	public int getNearHeartCount(String nid) {
		return sqlSession.selectOne(namespace+".near_heart_count", nid);
	}
	
	public int getNearUpdateUpload(NearVO vo) {
		return sqlSession.update(namespace+".near_update_upload", vo);
	}
	
	public int getMapUpdateUpload(NearVO vo) {
		return sqlSession.update(namespace+".map_update_upload", vo);
	}
	
	public String getNearPet(String pid) {
		return sqlSession.selectOne(namespace+".near_pet", pid);
	}
	
	public int getNearEnd(String nid) {
		return sqlSession.update(namespace+".near_end", nid);
	}


}
