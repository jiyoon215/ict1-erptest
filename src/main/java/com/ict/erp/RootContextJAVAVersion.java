package com.ict.erp;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;

import com.zaxxer.hikari.HikariDataSource;

public class RootContextJAVAVersion {
	public static void main(String[] args) {
		HikariDataSource hds=new HikariDataSource();
		hds.setDriverClassName("oracle.jdbc.OracleDriver");
		hds.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		hds.setUsername("ictu");
		hds.setPassword("12345678");
		hds.setAutoCommit(false);
		hds.setMinimumIdle(5);
		hds.setMaximumPoolSize(10);
		
		SqlSessionFactoryBean ssfb=new SqlSessionFactoryBean();
		ssfb.setDataSource(hds);
		
		try {
			SqlSessionFactory ssf=ssfb.getObject();
			System.out.println(ssf);
			SqlSessionTemplate sst=new SqlSessionTemplate(ssf);
			System.out.println(sst);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
