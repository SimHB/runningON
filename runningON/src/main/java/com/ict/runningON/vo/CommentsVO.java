package com.ict.runningON.vo;

public class CommentsVO {
	private String comment_idx,
		user_id,
		post_idx,
		comment_content,
		comment_likes,
		comment_dislikes,
		comment_report,
		comment_created_at,
		comment_updated_at;
	
	private int likeCount;
	
	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(String comment_idx) {
		this.comment_idx = comment_idx;
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

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_likes() {
		return comment_likes;
	}

	public void setComment_likes(String comment_likes) {
		this.comment_likes = comment_likes;
	}

	public String getComment_dislikes() {
		return comment_dislikes;
	}

	public void setComment_dislikes(String comment_dislikes) {
		this.comment_dislikes = comment_dislikes;
	}

	public String getComment_report() {
		return comment_report;
	}

	public void setComment_report(String comment_report) {
		this.comment_report = comment_report;
	}

	public String getComment_created_at() {
		return comment_created_at;
	}

	public void setComment_created_at(String comment_created_at) {
		this.comment_created_at = comment_created_at;
	}

	public String getComment_updated_at() {
		return comment_updated_at;
	}

	public void setComment_updated_at(String comment_updated_at) {
		this.comment_updated_at = comment_updated_at;
	}
	
}