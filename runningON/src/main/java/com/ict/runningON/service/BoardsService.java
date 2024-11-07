package com.ict.runningON.service;

import java.util.List;

import com.ict.runningON.vo.BoardsVO;
import com.ict.runningON.vo.PostsVO;

public interface BoardsService {
	// 게시판 이름 불러오기
	public BoardsVO getBoardInfo(String board_idx);
	
	// 리스트 : 게시판에 불러올 게시글들을 담은 리스트
    public List<PostsVO> getPostsList();
    
    // 페이징 처리 - 전체 게시글의 수
    public int getTotalCount(String board_idx);
    
    // 페이징 처리을 위한 리스트
    public List<PostsVO> getPostsList(int offset, int limit, String board_idx, String desc);
}