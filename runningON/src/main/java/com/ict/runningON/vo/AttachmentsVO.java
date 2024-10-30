package com.ict.runningON.vo;

import org.springframework.web.multipart.MultipartFile;

public class AttachmentsVO {
	private String attachment_idx,
		post_idx,
		comment_idx,
		attachment_file_path,
		attachment_created_at;
	
	private MultipartFile file_name ;
	
	public MultipartFile getFile_name() {
		return file_name;
	}

	public void setFile_name(MultipartFile file_name) {
		this.file_name = file_name;
	}

	public String getAttachment_idx() {
		return attachment_idx;
	}

	public void setAttachment_idx(String attachment_idx) {
		this.attachment_idx = attachment_idx;
	}

	public String getPost_idx() {
		return post_idx;
	}

	public void setPost_idx(String post_idx) {
		this.post_idx = post_idx;
	}

	public String getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(String comment_idx) {
		this.comment_idx = comment_idx;
	}

	public String getAttachment_file_path() {
		return attachment_file_path;
	}

	public void setAttachment_file_path(String attachment_file_path) {
		this.attachment_file_path = attachment_file_path;
	}

	public String getAttachment_created_at() {
		return attachment_created_at;
	}

	public void setAttachment_created_at(String attachment_created_at) {
		this.attachment_created_at = attachment_created_at;
	}
	
}