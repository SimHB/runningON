package com.ict.runningON.dao;

import java.util.List;

import com.ict.runningON.vo.AdminVO;

public interface AdminDAO {
	public AdminVO AdminLoginAcion(AdminVO vo);
	public List<AdminVO> adminUserListSelect();
	public AdminVO adminUserDetail(AdminVO vo);
	public List<AdminVO> adminUserDetailGroup(AdminVO vo);
	public List<AdminVO> adminUserSearchList(AdminVO vo);
}
