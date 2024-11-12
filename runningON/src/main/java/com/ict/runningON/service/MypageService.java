package com.ict.runningON.service;

import java.util.List;

import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.MessagesVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.RunGroupsVO;
import com.ict.runningON.vo.ScrapsVO;
import com.ict.runningON.vo.UsersVO;

public interface MypageService {
	
	public UsersVO getMyInfo(String user_id);
	public List<PostsVO> getPostList(String user_id);
	public List<PostsVO> getPostList(List<Integer> post_idx);
	public List<MessagesVO> getSendMsgList(String user_id);
	public List<MessagesVO> getReceiveMsgList(String user_id);
	public int getSendMsg(MessagesVO mvo);
	public MessagesVO getOneMsg(String msg_idx);
	public int updateInfo(UsersVO uvo);
	public List<CommentsVO> getMyComments(String user_id);
	public List<ScrapsVO> getMyScraps(String user_id);
	public List<RunGroupsVO> getCreateGroup(String user_id);
	public List<Integer> getJoinGroups(String user_id);
	public int deletePost(List<Integer> post_idx);
	public int deleteComment(List<Integer> comment_idx);
	public int deleteScrap(String user_id,List<Integer> post_idx);
	public List<RunGroupsVO> getGroups(List<Integer> group_idx);
	public List<Integer> getScrapGroups(String user_id);
	public void readMsg(String msg_idx);
	public int getMsgNum(String user_id);
}
