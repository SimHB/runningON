package com.ict.runningON.dao;

import java.util.List;

import com.ict.runningON.vo.PostsVO;

public interface PostsDAO {
	public List<PostsVO> getPostList();
	public PostsVO getPostDetail(String post_idx);
	public int getPostInsert(PostsVO pvo);
	public int getPostDelete(String post_idx);
	public int getPostUpdate(PostsVO pvo);
}