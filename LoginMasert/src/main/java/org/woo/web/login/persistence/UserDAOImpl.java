package org.woo.web.login.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.woo.web.login.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	SqlSession session;

	
	@Override
	public UserVO login(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("user.login",vo);
	}

	
}
