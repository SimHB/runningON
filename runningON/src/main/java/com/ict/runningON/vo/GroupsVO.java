package com.ict.runningON.vo;

import org.springframework.web.multipart.MultipartFile;

public class GroupsVO {
	private String group_idx,
		user_id,
		group_title,
		group_image,
		group_des,
		group_maxCount,
		group_currentCount,
		group_created_at;
	
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGroup_title() {
		return group_title;
	}

	public void setGroup_title(String group_title) {
		this.group_title = group_title;
	}

	public String getGroup_image() {
		return group_image;
	}

	public void setGroup_image(String group_image) {
		this.group_image = group_image;
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

	public String getGroup_created_at() {
		return group_created_at;
	}

	public void setGroup_created_at(String group_created_at) {
		this.group_created_at = group_created_at;
	}
	
}