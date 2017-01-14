package com.miracle.member;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {
	public static SqlSessionFactory factory = null;
//	private static String resource = "com/miracle/member/config-member.xml";
	private static String resource = "";
//	private static String 
	private DBService(){}
	public SqlSessionFactory getFactory(){
		if(factory == null){
			try {
				factory = new SqlSessionFactoryBuilder().build(
						Resources.getResourceAsStream(resource));
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
	
	public void setResource(String operation){
		if(operation.equalsIgnoreCase("members")){
			this.resource = "com/miracle/member/config-member.xml";
		}
		else if(operation.equalsIgnoreCase("board")){
			this.resource = "com/miracle/board/config-board.xml";
		}
	}
	private static class InnerDBService{
		private static final DBService INSTANCE = new DBService();
	}
}
