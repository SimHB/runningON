package com.ict.runningON.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.RunGroupsDAO;
import com.ict.runningON.vo.RunGroupsVO;

@Service
public class RunGroupsServiceImpl implements RunGroupsService{
	@Autowired RunGroupsDAO rungroupsDAO;

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
	public int getGroupPostUpdate(RunGroupsVO gvo) {
		return rungroupsDAO.getGroupPostUpdate(gvo);
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
	public int insert_g_post(RunGroupsVO gvo) {
		return rungroupsDAO.insert_g_post(gvo);
	}

	@Override
	public RunGroupsVO getrungroupsselect(String group_idx) {
		return rungroupsDAO.getrungroupsselect(group_idx);
	}

}
