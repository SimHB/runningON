package com.ict.runningON.vo;

public class MessagesVO {
	private String msg_idx,
		msg_sender_id,
		msg_receiver_id,
		msg_subject,
		msg_content,
		msg_sent_at,
		msg_is_read;

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

	public String getMsg_subject() {
		return msg_subject;
	}

	public void setMsg_subject(String msg_subject) {
		this.msg_subject = msg_subject;
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
	
}