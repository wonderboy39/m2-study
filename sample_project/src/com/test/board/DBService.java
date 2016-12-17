package com.test.board;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// mapper에 insert구문 추가하기 
public class DBService {
	private static String resource = "com/test/board/config.xml";
	private static SqlSessionFactory factory = null;
	private DBService(){}
	public static SqlSessionFactory getFactory(){
		if(factory == null){
			try {
				factory = new SqlSessionFactoryBuilder().
						build(Resources.getResourceAsStream(resource));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return factory;
	}
}
