package org.woo.web.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.woo.web.login.domain.UserVO;
import org.woo.web.login.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	UserDAO dao;
	
	@Override
	public UserVO login(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	@Override
	public void loginCreate(UserVO vo) throws Exception {
		
		dao.loginCreate(vo);
		
	}

	@Override
	public int checkId(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkId(vo);
	}

	
	
}
