package com.ict.runningON.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.PostsVO;

@Repository
public class PostsDAOImpl implements PostsDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public int getPostsInsert(PostsVO pvo) {
		return sqlSessionTemplate.insert("posts.insert", pvo);
	}
}
