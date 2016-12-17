<%@page import="java.util.List"%>
<%@page import="com.test.board.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원 수정 페이지 </title>
</head>
<body>
<%
	Map<Object, Object> modifyMap = new HashMap<Object, Object>();
	modifyMap.put("id", request.getParameter("id"));
	modifyMap.put("pw", request.getParameter("pw"));
	
	List<Map<Object, Object>> orignData;
//	Object member = session.getAttribute("result");
	orignData = (List<Map<Object, Object>>)session.getAttribute("result");
//	SqlSession ss = DBService.getFactory().openSession(true);
//	Map<Object, Object> resultMap = ss.selectMap("select_one", "id");
//	resultMap.get("pw");/*  */
//	ss.close();
	
	//int result = ss.update("update_all", memberMap);
	//ss.select
	//if(result>0)%>
		<h1> 업데이트 성공 </h1>
		<h1> <%= session.getAttribute("result") %></h1>
	<%
%>
</body>
</html>