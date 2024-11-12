package com.ict.runningON.vo;

import org.springframework.web.multipart.MultipartFile;

public class RunGroupsVO {
	private String group_idx,
		board_idx,
		user_id,
		group_img,
		group_title,
		group_des,
		group_maxCount,
		group_currentCount,
		group_views,
		group_likes,
		group_dislikes,
		group_report,
		group_created_at,
		group_updated_at,
		group_is_public,
		group_is_hot;
	
	private String user_name;
	
	private MultipartFile file_name ;

	public MultipartFile getFile_name() {
		return file_name;
	}

	public void setFile_name(MultipartFile file_name) {
		this.file_name = file_name;
	}

	public String getGroup_idx() {
		return group_idx;
	}

	public void setGroup_idx(String group_idx) {
		this.group_idx = group_idx;
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

	public String getGroup_img() {
		return group_img;
	}

	public void setGroup_img(String group_img) {
		this.group_img = group_img;
	}

	public String getGroup_title() {
		return group_title;
	}

	public void setGroup_title(String group_title) {
		this.group_title = group_title;
	}

	public String getGroup_des() {
		return group_des;
	}

	public void setGroup_des(String group_des) {
		this.group_des = group_des;
	}

	public String getGroup_maxCount() {
		return group_maxCount;
	}

	public void setGroup_maxCount(String group_maxCount) {
		this.group_maxCount = group_maxCount;
	}

	public String getGroup_currentCount() {
		return group_currentCount;
	}

	public void setGroup_currentCount(String group_currentCount) {
		this.group_currentCount = group_currentCount;
	}

	public String getGroup_views() {
		return group_views;
	}

	public void setGroup_views(String group_views) {
		this.group_views = group_views;
	}

	public String getGroup_likes() {
		return group_likes;
	}

	public void setGroup_likes(String group_likes) {
		this.group_likes = group_likes;
	}

	public String getGroup_dislikes() {
		return group_dislikes;
	}

	public void setGroup_dislikes(String group_dislikes) {
		this.group_dislikes = group_dislikes;
	}

	public String getGroup_report() {
		return group_report;
	}

	public void setGroup_report(String group_report) {
		this.group_report = group_report;
	}

	public String getGroup_created_at() {
		return group_created_at;
	}

	public void setGroup_created_at(String group_created_at) {
		this.group_created_at = group_created_at;
	}

	public String getGroup_updated_at() {
		return group_updated_at;
	}

	public void setGroup_updated_at(String group_updated_at) {
		this.group_updated_at = group_updated_at;
	}

	public String getGroup_is_public() {
		return group_is_public;
	}

	public void setGroup_is_public(String group_is_public) {
		this.group_is_public = group_is_public;
	}

	public String getGroup_is_hot() {
		return group_is_hot;
	}

	public void setGroup_is_hot(String group_is_hot) {
		this.group_is_hot = group_is_hot;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
}