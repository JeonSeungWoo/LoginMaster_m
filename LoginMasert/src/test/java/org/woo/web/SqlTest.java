package org.woo.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.woo.web.login.domain.UserVO;
import org.woo.web.login.persistence.UserDAO;
import org.woo.web.login.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class SqlTest {
	
	@Inject
	UserDAO dao;
	
	@Inject
	UserService service;
	
	
	@Test
	public void daoTest() throws Exception {
		UserVO vo = new UserVO();
		vo.setUserid("id");
		vo.setUserpw("pw");
		System.out.println(vo);
		System.out.println( dao.login(vo));
	}
	
	
	@Test
	public void serviceTest() throws Exception {
		UserVO vo = new UserVO();
		vo.setUserid("id");
		vo.setUserpw("pw");
		System.out.println(vo);
		System.out.println( service.login(vo));
	}
	
	
	
}
