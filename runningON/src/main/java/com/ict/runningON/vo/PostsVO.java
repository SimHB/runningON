package com.ict.runningON.vo;

public class PostsVO {
	private String post_idx,
		board_idx,
		user_id,
		post_title,
		post_content,
		post_views,
		post_likes,
		post_created_at,
		post_updated_at,
		post_is_public;

	private String user_name;
	
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPost_idx() {
		return post_idx;
	}

	public void setPost_idx(String post_idx) {
		this.post_idx = post_idx;
	}

	public String getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public String getPost_views() {
		return post_views;
	}

	public void setPost_views(String post_views) {
		this.post_views = post_views;
	}
	
	public String getPost_likes() {
		return post_likes;
	}

	public void setPost_likes(String post_likes) {
		this.post_likes = post_likes;
	}

	public String getPost_created_at() {
		return post_created_at;
	}

	public void setPost_created_at(String post_created_at) {
		this.post_created_at = post_created_at;
	}

	public String getPost_updated_at() {
		return post_updated_at;
	}

	public void setPost_updated_at(String post_updated_at) {
		this.post_updated_at = post_updated_at;
	}

	public String getPost_is_public() {
		return post_is_public;
	}

	public void setPost_is_public(String post_is_public) {
		this.post_is_public = post_is_public;
	}
}