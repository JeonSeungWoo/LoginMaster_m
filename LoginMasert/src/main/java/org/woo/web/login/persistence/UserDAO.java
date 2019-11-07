package org.woo.web.login.persistence;

import org.woo.web.login.domain.UserVO;

public interface UserDAO {
	public UserVO login(UserVO vo)throws Exception;

}
