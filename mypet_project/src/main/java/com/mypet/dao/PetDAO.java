package com.mypet.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mypet.vo.MemberVO;
import com.mypet.vo.NearVO;
import com.mypet.vo.PetVO;

@Repository
public class PetDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.pet";
	
	public MemberVO getinfo(String id) {
		return sqlSession.selectOne(namespace+".info", id);
	}
	
	public int getCareUpload(PetVO vo) {
		return sqlSession.insert(namespace+".care_upload", vo);
	}
	
	public int getPetUpload(PetVO vo) {
		return sqlSession.insert(namespace+".pet_upload", vo);
	}
	
	public int getPetResult(String id) {
		return sqlSession.selectOne(namespace+".pet_result", id);
	}
	
	public ArrayList<PetVO> getPetList(String id) {
		List<PetVO> list = sqlSession.selectList(namespace+".pet_list", id);		
		return (ArrayList<PetVO>)list;
	}
	
	public PetVO getPetContent(String pid) {
		return sqlSession.selectOne(namespace+".pet_content", pid);
	}
	
	public ArrayList<PetVO> getIndexPet(String id) {
		List<PetVO> list = sqlSession.selectList(namespace+".index_pet", id);		
		return (ArrayList<PetVO>)list;
	}
	
	public PetVO getRpet(String id) {
		return sqlSession.selectOne(namespace+".rpet", id);
	}
	
	public int getRpetUpdate(String pid) {
		return sqlSession.update(namespace+".rpet_update", pid);
	}
	
	public int getRpetAllUpdate(String id) {
		return sqlSession.update(namespace+".rpet_all_update", id);
	}
	
	public ArrayList<PetVO> getManagerPetList() {
		List<PetVO> list = sqlSession.selectList(namespace+".manager_pet_list");		
		return (ArrayList<PetVO>)list;
	}
	
	public PetVO getManagerPetContent(String pid) {
		return sqlSession.selectOne(namespace+".manager_pet_content", pid);
	}

}
