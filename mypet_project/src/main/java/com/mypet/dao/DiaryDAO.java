package com.mypet.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mypet.vo.DiaryVO;
import com.mypet.vo.NearVO;

@Repository
public class DiaryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.diary";
	
	public int getFreeUpload(DiaryVO vo) {
		return sqlSession.insert(namespace+".free_upload", vo);
	}
	
	public ArrayList<DiaryVO> getFreeList(int startnum, int endnum) {
		Map<String,String> se = new HashMap<String,String>();
		se.put("start", String.valueOf(startnum));
		se.put("end", String.valueOf(endnum));
		
		List<DiaryVO> list = sqlSession.selectList(namespace+".free_list", se);		
		return (ArrayList<DiaryVO>)list;
	}
	
	public int targetPage(int pageNumber) {
		return sqlSession.selectOne(namespace+".target", pageNumber);
	}
	
	public DiaryVO getFreeContents(String fid) {
		return sqlSession.selectOne(namespace+".free_contents", fid);
	}
	
	public int getFreeHit(String fid) {
		return sqlSession.update(namespace+".free_hit", fid);
	}
	
	public int getFreeUpHeart(DiaryVO vo) {
		return sqlSession.insert(namespace+".free_up_heart", vo);
	}
	
	public int getFreeUpList(String fid) {
		return sqlSession.selectOne(namespace+".free_up_list", fid);
	}
	
	public int getFreeUpUpdate(String fid) {
		return sqlSession.update(namespace+".free_up_update", fid);
	}
	
	public int getFreeUpInfo(DiaryVO vo) {
		return sqlSession.selectOne(namespace+".free_up_info", vo);
	}
	
	public int getFreeDownHeart(DiaryVO vo) {
		return sqlSession.delete(namespace+".free_down_heart", vo);
	}
	
	public int getFreeDownUpdate(String fid) {
		return sqlSession.update(namespace+".free_down_update", fid);
	}
	
	public int getFreeUpNheart(DiaryVO vo) {
		return sqlSession.insert(namespace+".free_up_nheart", vo);
	}
	
	public int getFreeDownInfo(DiaryVO vo) {
		return sqlSession.selectOne(namespace+".free_down_info", vo);
	}
	
	public int getFreeNupUpdate(String fid) {
		return sqlSession.update(namespace+".free_nup_update", fid);
	}
	
	public int getFreeDownNheart(DiaryVO vo) {
		return sqlSession.delete(namespace+".free_down_nheart", vo);
	}
	
	public int getFreeNdownUpdate(String fid) {
		return sqlSession.update(namespace+".free_ndown_update", fid);
	}

}
