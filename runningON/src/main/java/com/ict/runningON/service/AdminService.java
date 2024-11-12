package com.ict.runningON.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.runningON.vo.AdminVO;

public interface AdminService {
	
	public void AdminLoginAction(HttpServletRequest request, HttpServletResponse response);
	public List<AdminVO> AdminUserListSelect();
	public AdminVO adminUserDetail(AdminVO vo);
	public List<AdminVO> adminUserDetailGroup(AdminVO vo);
	public List<AdminVO> adminUserSearchList(AdminVO vo);
}
