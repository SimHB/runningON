package com.ict.runningON.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.MypageDAO;
import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.MessagesVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.RunGroupsVO;
import com.ict.runningON.vo.ScrapsVO;
import com.ict.runningON.vo.UsersVO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public List<MessagesVO> getSendMsgList(String user_id) {
		return mypageDAO.getSendMsgList(user_id);
	}
	
	@Override
	public List<MessagesVO> getReceiveMsgList(String user_id) {
		return mypageDAO.getReceiveMsgList(user_id);
	}

	@Override
	public int getSendMsg(MessagesVO mvo) {
		return mypageDAO.getSendMsg(mvo);
	}

	@Override
	public MessagesVO getOneMsg(String msg_idx) {
		return mypageDAO.getOneMsg(msg_idx);
	}

	@Override
	public UsersVO getMyInfo(String user_id) {
		return mypageDAO.getMyInfo(user_id);
	}

	@Override
	public int updateInfo(UsersVO uvo) {
		return mypageDAO.updateInfo(uvo);
	}

	@Override
	public List<PostsVO> getPostList(String user_id) {
		return mypageDAO.getPostList(user_id);
	}

	@Override
	public List<CommentsVO> getMyComments(String user_id) {
		return mypageDAO.getMyComments(user_id);
	}

	@Override
	public List<PostsVO> getPostList(List<Integer> post_idx) {
		return mypageDAO.getPostList(post_idx);
	}

	@Override
	public List<ScrapsVO> getMyScraps(String user_id) {
		return mypageDAO.getMyScraps(user_id);
	}

	@Override
	public List<RunGroupsVO> getCreateGroup(String user_id) {
		return mypageDAO.getCreateGroup(user_id);
	}

	@Override
	public List<Integer> getJoinGroups(String user_id) {
		return null;
	}

	@Override
	public int deletePost(List<Integer> post_idx) {
		return mypageDAO.deletePost(post_idx);
	}

	@Override
	public int deleteComment(List<Integer> comment_idx) {
		return mypageDAO.deleteComment(comment_idx);
	}

	@Override
	public int deleteScrap(String user_id, List<Integer> post_idx) {
		return mypageDAO.deleteScrap(user_id, post_idx);
	}

	@Override
	public List<RunGroupsVO> getGroups(List<Integer> group_idx) {
		return mypageDAO.getGroups(group_idx);
	}

	@Override
	public List<Integer> getScrapGroups(String user_id) {
		return mypageDAO.getScrapGroups(user_id);
	}

	@Override
	public void readMsg(String msg_idx) {
		mypageDAO.readMsg(msg_idx);
	}

	@Override
	public int getMsgNum(String user_id) {
		return mypageDAO.getMsgNum(user_id);
	}

}
