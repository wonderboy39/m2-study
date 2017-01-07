<%@page import="com.miracle.member.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content{
	width:300px;
	heiht:300px;
	margin: 0 auto;
}
img{
	width:300px;
	height:300px;
}
</style>
</head>
<body>
<% 
  request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String mail = request.getParameter("email");
	String name = request.getParameter("name");
	
	SqlSession sql_session = DBService.getInstance().getFactory().openSession(true);
	Map<String, String> member_info = new HashMap<String, String>();
	member_info.put("id", id);
	member_info.put("pw", pw);
	member_info.put("email", mail);
	member_info.put("name", name);
	int result = sql_session.insert("insert_member", member_info); 
	/* result = -1; */
	sql_session.close();
	if(result>0){%>
	<div class="content">
		<h1> You're Registered Successfully. </h1>
		<img src="success.jpg"/>
	</div>
<%}else{%>
	<div class="content">
		<h1> Sorry, Try again.</h1>
		<img src="try_again.jpg"/>
	</div>
<%}
%>
</body>
</html>