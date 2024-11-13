package com.ict.runningON.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.RunGroupsDAO;
import com.ict.runningON.vo.Group_joinVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.RunGroupsVO;

@Service
public class RunGroupsServiceImpl implements RunGroupsService {
	@Autowired
	RunGroupsDAO rungroupsDAO;

	@Override
	public RunGroupsVO getBoardName(String group_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RunGroupsVO> getGroupsList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getGroupsInsert(RunGroupsVO gvo) {
		return rungroupsDAO.getGroupsInsert(gvo);
	}

	@Override
	public RunGroupsVO getGroupsDetail(String group_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getGroupsDelete(String group_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getGroupPostUpdate(PostsVO pvo) {
		return rungroupsDAO.getGroupPostUpdate(pvo);
	}

	@Override
	public int getGroupsUpdate(RunGroupsVO gvo) {
		return rungroupsDAO.getGroupsUpdate(gvo);
	}

	@Override
	public int getTotalCount(String group_idx) {
		return 0;
	}

	@Override
	public List<RunGroupsVO> getGroupsList(int offset, int limit, String group_idx, String desc) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
    public int getGroup_joinList(Group_joinVO gjvo) {
		return rungroupsDAO.getGroup_joinList(gjvo);
	}
	
	@Override
	public List<PostsVO> getpvo(String group_idx) {
		return rungroupsDAO.getpvo(group_idx);
	}

	@Override
	public List<String> getgmem(String group_idx) {
		return rungroupsDAO.getgmem(group_idx);
	}

	@Override
	public PostsVO noti(String group_idx) {
		return rungroupsDAO.noti(group_idx);
	}

	@Override
	public int getGroupPostInsert(PostsVO pvo) {
		return rungroupsDAO.getGroupPostInsert(pvo);
	}
	
	
	@Override 
	public RunGroupsVO getgvo(String group_idx) { 
		return rungroupsDAO.getgvo(group_idx); }

	@Override
	public int GroupJoinInsert(Group_joinVO gjvo) {
		return rungroupsDAO.GroupJoinInsert(gjvo);
	}
}

	/*
	 * @Override public int getJoinGroupsInsert(Group_joinVO gjvo) { return
	 * rungroupsDAO.getJoinGroupsInsert(gjvo); }
	 */


	/*
	 * @Override public int insert_g_post(PostsVO pvo) { return
	 * rungroupsDAO.insert_g_post(pvo); }
	 */

	/*
	 * @Override public RunGroupsVO getrungroupsselect(int post_idx) { return
	 * rungroupsDAO.getrungroupsselect(post_idx); }
	 */

