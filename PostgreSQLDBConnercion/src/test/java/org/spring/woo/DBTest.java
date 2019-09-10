package org.spring.woo;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class DBTest {

	
	@Test
	public void DBConnectionTest() throws Exception {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:mysql://192.168.1.76:3306/makemoney2?useSSL=false&serverTimezone=Asia/Seoul",
	"makemoney2",
	"makemoney2");
	System.out.println(con);
	con.close();
	}

}
