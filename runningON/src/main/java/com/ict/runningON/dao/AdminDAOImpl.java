package com.ict.runningON.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.AdminVO;

// DB 와 연결이되는 클래스라고 알려주는 것
@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public AdminVO AdminLoginAcion(AdminVO vo) {
		System.out.println(vo.getUser_id() + "이거 DAO vo임");
		AdminVO adminLoginVo = sqlSessionTemplate.selectOne("admin.AdminLoginAcion", vo);
		return adminLoginVo;
	}

	@Override
	public List<AdminVO> adminUserListSelect() {
		List<AdminVO> userList = sqlSessionTemplate.selectList("admin.adminUserListSelect");
		return userList;
	}

	@Override
	public AdminVO adminUserDetail(AdminVO vo) {
		return sqlSessionTemplate.selectOne("admin.adminUserDetail", vo);
	}
	@Override
	public List<AdminVO> adminUserDetailGroup(AdminVO vo) {
		return sqlSessionTemplate.selectList("admin.adminUserDetailGroup", vo);
	}

	@Override
	public List<AdminVO> adminUserSearchList(AdminVO vo) {
		return sqlSessionTemplate.selectList("admin.adminUserSearchList", vo);
	}

	@Override
	public List<AdminVO> adminBoardList(AdminVO vo) {
		return sqlSessionTemplate.selectList("admin.adminBoardList", vo);
	}

	@Override
	public int adminBoardHide(AdminVO vo) {
		return sqlSessionTemplate.update("admin.adminBoardHide", vo);
	}

	@Override
	public int adminBoardShow(AdminVO vo) {
		return sqlSessionTemplate.update("admin.adminBoardShow", vo);
	}

	@Override
	public List<AdminVO> announcement() {
		return sqlSessionTemplate.selectList("admin.announcement");
	}


		

}
