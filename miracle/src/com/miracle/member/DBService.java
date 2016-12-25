package com.miracle.member;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {
	public static SqlSessionFactory factory = null;
	private static String resource = "com/miracle/member/config-member.xml";
	private DBService(){}
	public SqlSessionFactory getFactory(){
		if(factory == null){
			try {
				factory = new SqlSessionFactoryBuilder().build(
						Resources.getResourceAsStream("com/miracle/member/config-member.xml"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return factory;
	}
	public static DBService getInstance(){
		return InnerDBService.INSTANCE;
	}
	private static class InnerDBService{
		private static final DBService INSTANCE = new DBService();
	}
}
