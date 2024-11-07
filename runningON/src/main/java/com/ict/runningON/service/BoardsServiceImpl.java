package com.ict.runningON.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.BoardsDAO;
import com.ict.runningON.vo.BoardsVO;
import com.ict.runningON.vo.PostsVO;

@Service
public class BoardsServiceImpl implements BoardsService{
	@Autowired
	private BoardsDAO postsDAO; 
	// 게시판 이름 불러오기
	@Override
	public BoardsVO getBoardInfo(String board_idx) {
		return postsDAO.getBoardInfo(board_idx);
	}
	// 리스트 : 게시판에 불러올 게시글들을 담은 리스트
	@Override
	public List<PostsVO> getPostsList() {
		return postsDAO.getPostsList();
	}
	// 페이징 처리 - 전체 게시글의 수
	@Override
	public int getTotalCount(String board_idx) {
		return postsDAO.getTotalCount(board_idx);
	}
	// 페이징 처리을 위한 리스트
	@Override
	public List<PostsVO> getPostsList(int offset, int limit, String board_idx, String desc) {
		return postsDAO.getPostsList(offset, limit, board_idx, desc);
	}
}