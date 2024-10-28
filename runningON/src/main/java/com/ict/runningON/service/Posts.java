package com.ict.runningON.service;

public class Posts {
	private int post_idx;
	private int board_idx;
	private String user_id;
	private String post_title;
	private String post_content;
	private int post_views;
	private String post_created_at;
	private String post_updated_at;
	private boolean post_is_public;
	
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
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
	public int getPost_views() {
		return post_views;
	}
	public void setPost_views(int post_views) {
		this.post_views = post_views;
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
	public boolean isPost_is_public() {
		return post_is_public;
	}
	public void setPost_is_public(boolean post_is_public) {
		this.post_is_public = post_is_public;
	}
	
}