package com.ict.runningON.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.LoginDAO;
import com.ict.runningON.vo.UsersVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO loginDAO;

	@Override
	public int LoginJoin(UsersVO uvo) throws Exception {
		return loginDAO.LoginJoin(uvo);
	}
	
	@Override
	public UsersVO LoginChk(String user_id) throws Exception {
		return loginDAO.LoginChk(user_id);
	}

	 @Override
	 public boolean isUserIdAvailable(String userId) {
	        return loginDAO.findByUserId(userId) == null;
	    }
	 
	 @Override
	 public boolean isUserEmailAvailable(String userEmail) {
	        return loginDAO.findByUserEmail(userEmail) == null;
	    }
	
}
