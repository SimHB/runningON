package com.ict.runningON.dao;

import java.util.List;

import com.ict.runningON.vo.PostsVO;

public interface SearchDAO {
	/*
	 * List<PostsVO> getList() throws Exception; List<PostsVO> getSearch(PostsVO
	 * PostsVO) throws Exception;
	 */
	// 특정 검색 필드 idx에 제목과 내용 넣을 수 있음
	List<PostsVO> getSearch(String keyword) throws Exception;
}
