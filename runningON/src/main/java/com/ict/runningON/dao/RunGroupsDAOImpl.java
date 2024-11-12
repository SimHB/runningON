package com.ict.runningON.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.RunGroupsVO;

@Repository
public class RunGroupsDAOImpl implements RunGroupsDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

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
		System.out.println(gvo.getGroup_title());
		System.out.println(gvo.getGroup_img());
		System.out.println(gvo.getGroup_maxCount());
		System.out.println(gvo.getGroup_des());
		return sqlSessionTemplate.insert("rungroups.group_insert", gvo);
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
		return sqlSessionTemplate.update("rungroups.group_post_update", gvo);
	}

	@Override
	public int getGroupsUpdate(RunGroupsVO gvo) {
		return sqlSessionTemplate.update("rungroups.group_update", gvo);
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
		return sqlSessionTemplate.insert("rungroups.post_insert", gvo);
	}

	@Override
	public RunGroupsVO getrungroupsselect(String group_idx) {
		return sqlSessionTemplate.selectOne("rungroups.select_onegroup", group_idx);
	}

}
