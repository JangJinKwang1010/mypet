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
	
	public int getFreeCommentUpload(DiaryVO vo) {
		return sqlSession.insert(namespace+".free_comment_upload", vo);
	}
	
	public ArrayList<DiaryVO> getFreeCommentList(String fid) {
		List<DiaryVO> list = sqlSession.selectList(namespace+".free_comment_list", fid);		
		return (ArrayList<DiaryVO>)list;
	}
	
	public int getFreeCommentDelete(String cid) {
		return sqlSession.delete(namespace+".free_comment_delete", cid);
	}
	
	public int getFreeCommentCount(String fid) {
		return sqlSession.selectOne(namespace+".free_comment_count", fid);
	}
	
	public int getFreeDelete(String fid) {
		return sqlSession.delete(namespace+".free_delete", fid);
	}
	
	public int getFreeUpdate(DiaryVO vo) {
		return sqlSession.update(namespace+".free_update", vo);
	}
	
	public int getFreeCommentUpdate(DiaryVO vo) {
		return sqlSession.update(namespace+".free_comment_update", vo);
	}
	
	public int getPicturesUpload(DiaryVO vo) {
		return sqlSession.insert(namespace+".pictures_upload", vo);
	}
	
	public ArrayList<DiaryVO> getPicturesList(int startnum, int endnum) {
		Map<String,String> se = new HashMap<String,String>();
		se.put("start", String.valueOf(startnum));
		se.put("end", String.valueOf(endnum));
		
		List<DiaryVO> list = sqlSession.selectList(namespace+".pictures_list", se);		
		return (ArrayList<DiaryVO>)list;
	}
	
	public int getPicturesUpList(String pid) {
		return sqlSession.selectOne(namespace+".pictures_up_list", pid);
	}
	
	public int getPicturesCommentCount(String pid) {
		return sqlSession.selectOne(namespace+".pictures_comment_count", pid);
	}
	
	public int ptargetPage(int pageNumber) {
		return sqlSession.selectOne(namespace+".ptarget", pageNumber);
	}
	
	public DiaryVO getPicturesContents(String pid) {
		return sqlSession.selectOne(namespace+".pictures_contents", pid);
	}
	
	public int getPicturesHit(String pid) {
		return sqlSession.update(namespace+".pictures_hit", pid);
	}
	
	public ArrayList<DiaryVO> getPicturesCommentList(String pid) {
		List<DiaryVO> list = sqlSession.selectList(namespace+".pictures_comment_list", pid);		
		return (ArrayList<DiaryVO>)list;
	}
	
	public int getPicturesUpHeart(DiaryVO vo) {
		return sqlSession.insert(namespace+".pictures_up_heart", vo);
	}
	
	public int getPicturesUpInfo(DiaryVO vo) {
		return sqlSession.selectOne(namespace+".pictures_up_info", vo);
	}
	
	public int getPicturesUpUpdate(String pid) {
		return sqlSession.update(namespace+".pictures_up_update", pid);
	}
	
	public int getPicturesDownHeart(DiaryVO vo) {
		return sqlSession.delete(namespace+".pictures_down_heart", vo);
	}
	
	public int getPicturesDownUpdate(String pid) {
		return sqlSession.update(namespace+".pictures_down_update", pid);
	}
	
	public int getPicturesUpNheart(DiaryVO vo) {
		return sqlSession.insert(namespace+".pictures_up_nheart", vo);
	}
	
	public int getPicturesDownInfo(DiaryVO vo) {
		return sqlSession.selectOne(namespace+".pictures_down_info", vo);
	}
	
	public int getPicturesNupUpdate(String pid) {
		return sqlSession.update(namespace+".pictures_nup_update", pid);
	}
	
	public int getPicturesDownNheart(DiaryVO vo) {
		return sqlSession.delete(namespace+".pictures_down_nheart", vo);
	}
	
	public int getPicturesNdownUpdate(String pid) {
		return sqlSession.update(namespace+".pictures_ndown_update", pid);
	}
	
	public int getPicturesCommentUpload(DiaryVO vo) {
		return sqlSession.insert(namespace+".pictures_comment_upload", vo);
	}
	
	public int getPicturesDelete(String fid) {
		return sqlSession.delete(namespace+".pictures_delete", fid);
	}
	
	public ArrayList<DiaryVO> getManagerFreeList() {
		List<DiaryVO> list = sqlSession.selectList(namespace+".manager_free_list");		
		return (ArrayList<DiaryVO>)list;
	}
	
	public ArrayList<DiaryVO> getManagerPicturesList() {
		List<DiaryVO> list = sqlSession.selectList(namespace+".manager_pictures_list");		
		return (ArrayList<DiaryVO>)list;
	}

}
