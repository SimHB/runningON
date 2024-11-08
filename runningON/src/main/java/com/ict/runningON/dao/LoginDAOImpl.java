package com.ict.runningON.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.UsersVO;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public UsersVO findByUserId(String userId) {
	      return sqlSessionTemplate.selectOne("homepage.findByUserId", userId);
	}
	
	@Override
	public UsersVO findByUserEmail(String userEmail) {
	      return sqlSessionTemplate.selectOne("homepage.findByUserEmail", userEmail);
	}
	

	@Override
	public int LoginJoin(UsersVO uvo) throws Exception {
		return sqlSessionTemplate.insert("homepage.join", uvo);
	}
	
	@Override
	public UsersVO LoginChk(String user_id) throws Exception {
		System.out.println(user_id);
		return sqlSessionTemplate.selectOne("homepage.loginchk", user_id);
	}
	

}
