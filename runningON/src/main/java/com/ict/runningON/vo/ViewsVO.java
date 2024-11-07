package com.ict.runningON.vo;

public class ViewsVO {
	private String view_idx,
		view_count,
		user_id,
		post_idx,
		viewed_at,
		view_updated_at;

	public String getView_idx() {
		return view_idx;
	}

	public void setView_idx(String view_idx) {
		this.view_idx = view_idx;
	}

	public String getView_count() {
		return view_count;
	}

	public void setView_count(String view_count) {
		this.view_count = view_count;
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

	public String getViewed_at() {
		return viewed_at;
	}

	public void setViewed_at(String viewed_at) {
		this.viewed_at = viewed_at;
	}

	public String getView_updated_at() {
		return view_updated_at;
	}

	public void setView_updated_at(String view_updated_at) {
		this.view_updated_at = view_updated_at;
	}
	
}