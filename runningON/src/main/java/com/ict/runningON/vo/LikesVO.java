package com.ict.runningON.vo;

public class LikesVO {
	private String like_idx,
		user_id,
		post_idx,
		like_created_at;

	public String getLike_idx() {
		return like_idx;
	}

	public void setLike_idx(String like_idx) {
		this.like_idx = like_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPost_idx() {
		return post_idx;
	}

	public void setPost_idx(String post_idx) {
		this.post_idx = post_idx;
	}

	public String getLike_created_at() {
		return like_created_at;
	}

	public void setLike_created_at(String like_created_at) {
		this.like_created_at = like_created_at;
	}
	
}