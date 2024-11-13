package com.ict.runningON.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.Group_joinVO;
import com.ict.runningON.vo.PostsVO;
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
	public int getGroupPostUpdate(PostsVO pvo) {
		return sqlSessionTemplate.update("rungroups.group_post_update", pvo);
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
    public int getGroup_joinList(Group_joinVO gjvo) {
		return sqlSessionTemplate.selectOne("rungroups.group_join_list",gjvo);
	}

	@Override
	public RunGroupsVO getgvo(String group_idx) {
		return sqlSessionTemplate.selectOne("rungroups.group_idx", group_idx);
	}

	@Override
	public List<PostsVO> getpvo(String group_idx) {
		return sqlSessionTemplate.selectList("rungroups.group_post", group_idx);
	}

	@Override
	public List<String> getgmem(String group_idx) {
		return sqlSessionTemplate.selectList("rungroups.group_mem", group_idx);
	}

	@Override
	public PostsVO noti(String group_idx) {
		return sqlSessionTemplate.selectOne("rungroups.noti", group_idx);
	}

	@Override
	public int getGroupPostInsert(PostsVO pvo) {
		return sqlSessionTemplate.insert("rungroups.group_post_insert", pvo);
	}

	@Override
	public int GroupJoinInsert(Group_joinVO gjvo) {
		return sqlSessionTemplate.insert("rungroups.group_join_insert", gjvo);
	}


	/*
	 * @Override public int insert_g_post(PostsVO pvo) { return
	 * sqlSessionTemplate.insert("rungroups.post_insert", pvo); }
	 * 
	 * @Override public RunGroupsVO getrungroupsselect(int post_idx) { return
	 * sqlSessionTemplate.selectOne("rungroup.select_onegroup", post_idx); }
	 */

}
