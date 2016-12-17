<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.test.board.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	SqlSession ss = DBService.getFactory().openSession(true);
	//List list = ss.selectList("select_member");
	//List<String> list = new ArrayList<String>();
	//List list = ss.selectList("select_member");
	//List<Object> list = new ArrayList<Object>();
	List<Map<Object,Object>> list;
	list = ss.selectList("select_all");
	
	for(int i=0; i<list.size(); i++){%>
		<h3>id : <%=list.get(i).get("id") %>, &nbsp;&nbsp;&nbsp; 
			pw : <%=list.get(i).get("pw") %></h3>
			<br>
	<%} 
%>
</body>
</html>