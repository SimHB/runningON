package com.ict.runningON.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.PostsVO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 전체보기
	/*
	 * @Override public List<PostsVO> getList() throws Exception { return
	 * sqlSessionTemplate.selectList("search"); }
	 * 
	 * 
	 * @Override public List<PostsVO> getSearch(PostsVO PostsVO) throws Exception {
	 * return sqlSessionTemplate.selectList("posts.dynamic", PostsVO); }
	 */

	@Override
	public List<PostsVO> getSearch(String keyword) throws Exception {
		return sqlSessionTemplate.selectList("posts.dynamic", keyword);
	}

}
