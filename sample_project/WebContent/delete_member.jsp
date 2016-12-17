<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.test.board.DBService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원 삭제 페이지 </title>
</head>
<body>
<%
/* 	String id = request.getParameter("id");
	String password = request.getParameter("pw"); */
//	pageContext.setAttribute("id", request.getParameter("id"));
//	pageContext.setAttribute("password", request.getParameter("pw"));
	Map<String, String> memberMap = new HashMap<String, String>();
	memberMap.put("id", request.getParameter("id"));
	memberMap.put("pw", request.getParameter("pw"));
	SqlSession ss = DBService.getFactory().openSession(true);
	int result = ss.delete("delete_one", memberMap);
	if(result>0)%>
		<h1>삭제 성공 </h1>
	<%
%>
</body>
</html>