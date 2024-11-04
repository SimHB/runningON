package com.ict.runningON.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.PostsDAO;
import com.ict.runningON.vo.PostsVO;

@Service
public class PostsServiceImpl implements PostsService{
	@Autowired
	public PostsDAO postsDAO;
	
	@Override
	public int getPostsInsert(PostsVO pvo) {
		return postsDAO.getPostsInsert(pvo);
	}
	
}
