package org.woo.web.login.persistence;

import org.woo.web.login.domain.UserVO;

public interface UserDAO {
	public UserVO login(UserVO vo)throws Exception;
	public void loginCreate(UserVO vo)throws Exception;
	public int checkId(UserVO vo)throws Exception;

}
