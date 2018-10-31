package com.ict.erp;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ict.erp.vo.LevelInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //("/root-context.xml") 
public class DataSourceTest {
	
	@Autowired
	@Qualifier("dataSourceProxy") 
	private DataSource ds;
	// Qualifier로 쓰던지 private Log4jdbcProxyDataSource lpds; 로 하면됨.
	// 이유는 hikariDataSource,dataSourceProxy 두개모두 DataSource를 implements 받고 있어서 어떤것을 부를지 구분해줘야함.
	
	@Autowired
	private SqlSessionFactory ssf;
	
	@Autowired
	private SqlSession ss;
	
	@Test
	public void test() {
		try {
			Connection con=ds.getConnection();
			System.out.println("DB접속 테스트 완료");
		} catch (SQLException e) {
			fail(e.getMessage());
		}
	}
	
	@Test
	public void ssfTest() {
		try(SqlSession ss= ssf.openSession()) {
			System.out.println("Sql Session 테스트 완료");
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	/*@Test
	public void ssTest() {
		assertNotNull(ss);
		List<LevelInfo> liList= ss.selectList("SQL.LEVELINFO.selectLevelInfoList");
		assertEquals(liList.size(),6);
	}*/
	/*
	@Test
	public void insertTest() {
		LevelInfo li=new LevelInfo();
		li.setLilevel(6);
		li.setLiname("테스트6");
		li.setLidesc("테스트데이터");
		assertEquals(ss.insert("SQL.LEVELINFO.insertLevelInfo",li), 1);
	}
	
	@Test
	public void updateTest() {
		LevelInfo li=new LevelInfo();
		li.setLinum(65);
		li.setLilevel(10);
		li.setLiname("updateTest1");
		li.setLidesc("updateTest Data");
		assertEquals(ss.update("SQL.LEVELINFO.updateLevelInfo",li),1);
	}
	
	@Test
	public void deleteTest() {
		LevelInfo li=new LevelInfo();
		li.setLinum(70);		
		assertEquals(ss.delete("SQL.LEVELINFO.deleteLevelInfo",li),1);
	}*/
	
	
	/*@Test
	public void ssstest() {
		LevelInfo li=new LevelInfo();
		li.setLilevel(11);
		li.setLiname("test사용자");
		li.setLidesc("테스트Data");
		List<LevelInfo> liList = ss.selectList("SQL.LEVELINFO.selectLevelInfo",li);
		
		for(LevelInfo li2 : liList) {
			System.out.println(li2);
		}
	}	*/
	
}
