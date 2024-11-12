package com.ict.runningON.vo;

public class AdminVO {
	
	//users table 변수
	private String user_id
	, user_pw
	, user_rank
	, user_name
	, user_profileImg
	, user_nickName
	, user_email
	, user_created_at
	, user_lastLoginDate
	, user_accountStatus;
	
	private String comment_idx
	, post_idx
	, comment_content
	, comment_created_at
	, comment_updated_at;
	
	private String board_idx, board_name
	, board_des, board_created_at;
	
	private String dislike_idx
	, dislike_created_at;
	
	private String gJoin_idx
	, gJoin_joined_at;
	
	private String like_idx
	, like_created_at;
	
	private String msg_idx
	, msg_sender_id
	, msg_receiver_id
	, msg_content
	, msg_sent_at
	, msg_is_read;
	
	private String group_idx
	, group_title
	, group_image
	, group_des
	, group_maxCount
	, group_currentCount
	, group_created_at;
	
	//검색 값 받는 변수
	private String userSearch;

	public AdminVO() {}

	public AdminVO(String user_id, String user_pw, String user_rank, String user_name, String user_profileImg,
			String user_nickName, String user_email, String user_created_at, String user_lastLoginDate,
			String user_accountStatus, String comment_idx, String post_idx, String comment_content,
			String comment_created_at, String comment_updated_at, String board_idx, String board_name, String board_des,
			String board_created_at, String dislike_idx, String dislike_created_at, String gJoin_idx,
			String gJoin_joined_at, String like_idx, String like_created_at, String msg_idx, String msg_sender_id,
			String msg_receiver_id, String msg_content, String msg_sent_at, String msg_is_read, String group_idx,
			String group_title, String group_image, String group_des, String group_maxCount, String group_currentCount,
			String group_created_at, String userSearch) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_rank = user_rank;
		this.user_name = user_name;
		this.user_profileImg = user_profileImg;
		this.user_nickName = user_nickName;
		this.user_email = user_email;
		this.user_created_at = user_created_at;
		this.user_lastLoginDate = user_lastLoginDate;
		this.user_accountStatus = user_accountStatus;
		this.comment_idx = comment_idx;
		this.post_idx = post_idx;
		this.comment_content = comment_content;
		this.comment_created_at = comment_created_at;
		this.comment_updated_at = comment_updated_at;
		this.board_idx = board_idx;
		this.board_name = board_name;
		this.board_des = board_des;
		this.board_created_at = board_created_at;
		this.dislike_idx = dislike_idx;
		this.dislike_created_at = dislike_created_at;
		this.gJoin_idx = gJoin_idx;
		this.gJoin_joined_at = gJoin_joined_at;
		this.like_idx = like_idx;
		this.like_created_at = like_created_at;
		this.msg_idx = msg_idx;
		this.msg_sender_id = msg_sender_id;
		this.msg_receiver_id = msg_receiver_id;
		this.msg_content = msg_content;
		this.msg_sent_at = msg_sent_at;
		this.msg_is_read = msg_is_read;
		this.group_idx = group_idx;
		this.group_title = group_title;
		this.group_image = group_image;
		this.group_des = group_des;
		this.group_maxCount = group_maxCount;
		this.group_currentCount = group_currentCount;
		this.group_created_at = group_created_at;
		this.userSearch = userSearch;
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

	public String getUser_rank() {
		return user_rank;
	}

	public void setUser_rank(String user_rank) {
		this.user_rank = user_rank;
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

	public String getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(String comment_idx) {
		this.comment_idx = comment_idx;
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

	public String getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public String getBoard_des() {
		return board_des;
	}

	public void setBoard_des(String board_des) {
		this.board_des = board_des;
	}

	public String getBoard_created_at() {
		return board_created_at;
	}

	public void setBoard_created_at(String board_created_at) {
		this.board_created_at = board_created_at;
	}

	public String getDislike_idx() {
		return dislike_idx;
	}

	public void setDislike_idx(String dislike_idx) {
		this.dislike_idx = dislike_idx;
	}

	public String getDislike_created_at() {
		return dislike_created_at;
	}

	public void setDislike_created_at(String dislike_created_at) {
		this.dislike_created_at = dislike_created_at;
	}

	public String getgJoin_idx() {
		return gJoin_idx;
	}

	public void setgJoin_idx(String gJoin_idx) {
		this.gJoin_idx = gJoin_idx;
	}

	public String getgJoin_joined_at() {
		return gJoin_joined_at;
	}

	public void setgJoin_joined_at(String gJoin_joined_at) {
		this.gJoin_joined_at = gJoin_joined_at;
	}

	public String getLike_idx() {
		return like_idx;
	}

	public void setLike_idx(String like_idx) {
		this.like_idx = like_idx;
	}

	public String getLike_created_at() {
		return like_created_at;
	}

	public void setLike_created_at(String like_created_at) {
		this.like_created_at = like_created_at;
	}

	public String getMsg_idx() {
		return msg_idx;
	}

	public void setMsg_idx(String msg_idx) {
		this.msg_idx = msg_idx;
	}

	public String getMsg_sender_id() {
		return msg_sender_id;
	}

	public void setMsg_sender_id(String msg_sender_id) {
		this.msg_sender_id = msg_sender_id;
	}

	public String getMsg_receiver_id() {
		return msg_receiver_id;
	}

	public void setMsg_receiver_id(String msg_receiver_id) {
		this.msg_receiver_id = msg_receiver_id;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public String getMsg_sent_at() {
		return msg_sent_at;
	}

	public void setMsg_sent_at(String msg_sent_at) {
		this.msg_sent_at = msg_sent_at;
	}

	public String getMsg_is_read() {
		return msg_is_read;
	}

	public void setMsg_is_read(String msg_is_read) {
		this.msg_is_read = msg_is_read;
	}

	public String getGroup_idx() {
		return group_idx;
	}

	public void setGroup_idx(String group_idx) {
		this.group_idx = group_idx;
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

	public String getUserSearch() {
		return userSearch;
	}

	public void setUserSearch(String userSearch) {
		this.userSearch = userSearch;
	}
	
}
