package com.ict.runningON.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.AdminDAO;
import com.ict.runningON.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public void AdminLoginAction(HttpServletRequest request, HttpServletResponse response) {
		AdminVO adminLoginVO = new AdminVO(); 
		HttpSession session = request.getSession();
		adminLoginVO.setUser_id(request.getParameter("id"));
		adminLoginVO.setUser_pw(request.getParameter("pw"));
		adminLoginVO.setUser_rank("admin");
		
		AdminVO resultAdminLoginVO = adminDAO.AdminLoginAcion(adminLoginVO);
		
		if (resultAdminLoginVO != null) {
			session.setAttribute("adminVO", resultAdminLoginVO);
		}
		
	}

	@Override
	public List<AdminVO> AdminUserListSelect() {
		return adminDAO.adminUserListSelect();
	}

	@Override
	public AdminVO adminUserDetail(AdminVO vo) {
		return adminDAO.adminUserDetail(vo);
	}
	
	@Override
	public List<AdminVO> adminUserDetailGroup(AdminVO vo) {
		return adminDAO.adminUserDetailGroup(vo);
	}

	@Override
	public List<AdminVO> adminUserSearchList(AdminVO vo) {
		return adminDAO.adminUserSearchList(vo);
	}



}
