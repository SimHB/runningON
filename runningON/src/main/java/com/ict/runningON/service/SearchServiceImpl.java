package com.ict.runningON.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.SearchDAO;
import com.ict.runningON.vo.PostsVO;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO searchDAO;
	
	/*
	 * @Override public List<PostsVO> getList() throws Exception { return
	 * searchDAO.getList(); }
	 * 
	 * @Override public List<PostsVO> getSearch(PostsVO PostsVO) throws Exception {
	 * return searchDAO.getSearch(PostsVO); }
	 */

	@Override
	public List<PostsVO> getSearch(String keyword) throws Exception {
		return searchDAO.getSearch(keyword);
	}

}
