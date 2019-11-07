package org.woo.web.login.service;

import org.woo.web.login.domain.UserVO;

public interface UserService {
	public UserVO login(UserVO vo)throws Exception;
}
