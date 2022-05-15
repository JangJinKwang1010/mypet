package com.mypet.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mypet.vo.DiaryVO;
import com.mypet.vo.MemberVO;
import com.mypet.vo.NearVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.mypage";
	
	public MemberVO getMemberInfo(String id) {
		return sqlSession.selectOne(namespace+".member_info", id);
	}
	
	public int getMypageinpass(MemberVO vo) {
		return sqlSession.selectOne(namespace+".mypage_inpass", vo);
	}
	
	public int getMypageUpdate(MemberVO vo) {
		return sqlSession.update(namespace+".mypage_update", vo);
	}
	
	public int getMypageUpdateCare(MemberVO vo) {
		return sqlSession.update(namespace+".mypage_update_care", vo);
	}
	
	public int getMypageUpdateMap(MemberVO vo) {
		return sqlSession.update(namespace+".mypage_update_map", vo);
	}
	
	public int getMypagePass(MemberVO vo) {
		return sqlSession.update(namespace+".mypage_pass", vo);
	}
	
	public int getMypageDelete(String id) {
		return sqlSession.delete(namespace+".mypage_delete", id);
	}
	
	public ArrayList<DiaryVO> getMypageFidList(String id) {
		List<DiaryVO> list = sqlSession.selectList(namespace+".mypage_fid_list", id);		
		return (ArrayList<DiaryVO>)list;
	}
	
	public ArrayList<NearVO> getMypageNidList(String id) {
		List<NearVO> list = sqlSession.selectList(namespace+".mypage_nid_list", id);		
		return (ArrayList<NearVO>)list;
	}
	
	public int getMypageFidDelete(String fid) {
		return sqlSession.delete(namespace+".mypage_fid_delete", fid);
	}
	
	public int getMypageNidDelete(String nid) {
		return sqlSession.delete(namespace+".mypage_nid_delete", nid);
	}
	
	public ArrayList<NearVO> getMypageNear(String id) {
		List<NearVO> list = sqlSession.selectList(namespace+".mypage_near", id);		
		return (ArrayList<NearVO>)list;
	}
	
	public ArrayList<DiaryVO> getMypagePost(DiaryVO vo) {		
		List<DiaryVO> list = sqlSession.selectList(namespace+".mypage_post", vo);		
		return (ArrayList<DiaryVO>)list;
	}
	
	public int getMypagePostTarget(DiaryVO vo) {
		return sqlSession.selectOne(namespace+".post_target", vo);
	}
	
	public ArrayList<DiaryVO> getMypageComment(DiaryVO vo) {		
		List<DiaryVO> list = sqlSession.selectList(namespace+".mypage_comment", vo);		
		return (ArrayList<DiaryVO>)list;
	}
	
	public int getMypageCommentTarget(DiaryVO vo) {
		return sqlSession.selectOne(namespace+".comment_target", vo);
	}
	
	public String getFtitleSelect(String seq_id) {
		return sqlSession.selectOne(namespace+".ftitle_select", seq_id);
	}
	
	public String getPtitleSelect(String seq_id) {
		return sqlSession.selectOne(namespace+".ptitle_select", seq_id);
	}
	
	public int getMypagePetDelete(String pid) {
		return sqlSession.delete(namespace+".mypage_pet_delete", pid);
	}
	
	public int getMypageCareerDelete(String cid) {
		return sqlSession.delete(namespace+".mypage_career_delete", cid);
	}
	
	public ArrayList<NearVO> getMypageHeart(String id) {
		List<NearVO> list = sqlSession.selectList(namespace+".mypage_heart", id);		
		return (ArrayList<NearVO>)list;
	}

}
