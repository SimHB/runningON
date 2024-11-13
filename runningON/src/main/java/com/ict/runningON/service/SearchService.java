package com.ict.runningON.service;

import java.util.List;

import com.ict.runningON.vo.PostsVO;

// EmpService 참조

public interface SearchService {
	//List<PostsVO> getList() throws Exception;
	//List<PostsVO> getSearch(PostsVO PostsVO) throws Exception;
	
	// 특정 검색 필드 idx에 제목과 내용 넣을 수 있음
	List<PostsVO> getSearch(String keyword) throws Exception;
}
