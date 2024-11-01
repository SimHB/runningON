package com.ict.runningON.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.BoardsDAO;
import com.ict.runningON.vo.BoardsVO;
import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.PostsVO;

@Service
public class BoardsServiceImpl implements BoardsService{
	@Autowired
	private BoardsDAO postsDAO; 
	
	@Override
	public BoardsVO getBoardName(String board_idx) {
		return postsDAO.getBoardName(board_idx);
	}
	
	@Override
	public List<PostsVO> getPostsList() {
		return postsDAO.getPostsList();
	}

	@Override
	public int getPostsInsert(PostsVO pvo) {
		return postsDAO.getPostsInsert(pvo);
	}

	@Override
	public PostsVO getPostsDetail(String posts_idx) {
		return postsDAO.getPostsDetail(posts_idx);
	}

	@Override
	public int getPostsDelete(String posts_idx) {
		return postsDAO.getPostsDelete(posts_idx);
	}

	@Override
	public int getPostsUpdate(PostsVO pvo) {
		return postsDAO.getPostsUpdate(pvo);
	}

	@Override
	public int getHitUpdate(String posts_idx) {
		return postsDAO.getHitUpdate(posts_idx);
	}

	@Override
	public int getTotalCount(String board_idx) {
		return postsDAO.getTotalCount(board_idx);
	}

//	@Override
//	public List<PostsVO> getPostsList(int offset, int limit) {
//		return postsDAO.getPostsList(offset, limit);
//	}
	@Override
	public List<PostsVO> getPostsList(int offset, int limit, String board_idx, String desc) {
		return postsDAO.getPostsList(offset, limit, board_idx, desc);
	}

	@Override
	public List<CommentsVO> getCommList(String posts_idx) {
		return postsDAO.getCommList(posts_idx);
	}

	@Override
	public int getCommInsert(CommentsVO cvo) {
		return postsDAO.getCommInsert(cvo);
	}

	@Override
	public int getCommDelete(String comment_idx) {
		return postsDAO.getCommDelete(comment_idx);
	}
}