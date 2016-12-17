<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.test.board.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> DB에 양식제출 </title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	Map<String, String> memberMap = new HashMap<String, String>();
	memberMap.put("id", id);
	memberMap.put("pw", pw);
	
	
	SqlSession sqlSession = DBService.getFactory().openSession(true);
	int result = sqlSession.insert("insert_member", memberMap);
	sqlSession.close();
	if(result>0){%>
		<h1> 회원가입 성공 </h1>
	<%}else{%>
		<h1> 회원가입 실패 </h1>
	<%}
%>
</body>
</html>