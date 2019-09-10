package org.spring.woo;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.woo.test.dao.TestDAO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class SqlTest {

	
	@Inject
	private TestDAO dao;
	
	
	@Test
  public void sqlTest()throws Exception{
		System.out.println(dao.time());
	}
	
	
}
