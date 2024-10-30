package com.ict.runningON.vo;

import org.springframework.web.multipart.MultipartFile;

public class UsersVO {
	private String user_id,
		user_pw,
		user_name,
		user_profileImg,
		user_nickName,
		user_email,
		user_rank,
		user_created_at,
		user_lastLoginDate,
		user_accountStatus;
	
	private MultipartFile file_name ;

	public MultipartFile getFile_name() {
		return file_name;
	}

	public void setFile_name(MultipartFile file_name) {
		this.file_name = file_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_profileImg() {
		return user_profileImg;
	}

	public void setUser_profileImg(String user_profileImg) {
		this.user_profileImg = user_profileImg;
	}

	public String getUser_nickName() {
		return user_nickName;
	}

	public void setUser_nickName(String user_nickName) {
		this.user_nickName = user_nickName;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_rank() {
		return user_rank;
	}

	public void setUser_rank(String user_rank) {
		this.user_rank = user_rank;
	}

	public String getUser_created_at() {
		return user_created_at;
	}

	public void setUser_created_at(String user_created_at) {
		this.user_created_at = user_created_at;
	}

	public String getUser_lastLoginDate() {
		return user_lastLoginDate;
	}

	public void setUser_lastLoginDate(String user_lastLoginDate) {
		this.user_lastLoginDate = user_lastLoginDate;
	}

	public String getUser_accountStatus() {
		return user_accountStatus;
	}

	public void setUser_accountStatus(String user_accountStatus) {
		this.user_accountStatus = user_accountStatus;
	}
	
}