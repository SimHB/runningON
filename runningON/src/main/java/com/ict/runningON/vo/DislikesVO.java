package com.ict.runningON.vo;

public class DislikesVO {
	private String dislike_idx,
		user_id,
		post_idx,
		dislike_created_at;

	public String getDislike_idx() {
		return dislike_idx;
	}

	public void setDislike_idx(String dislike_idx) {
		this.dislike_idx = dislike_idx;
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

	public String getDislike_created_at() {
		return dislike_created_at;
	}

	public void setDislike_created_at(String dislike_created_at) {
		this.dislike_created_at = dislike_created_at;
	}
	
}