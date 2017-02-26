<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.miracle.member.DBService"%>
<%@page import="com.miracle.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String password = request.getParameter("password");
	String seq = request.getParameter("seq");
	
	BoardVO bvo = new BoardVO();
	bvo.setPassword(password);
	bvo.setSeq(seq);
	
	DBService dbService = DBService.getInstance();
	dbService.setResource("board");
	SqlSession sqlSession = dbService.getFactory().openSession(true);
	int result = sqlSession.delete("deleteOne", bvo);
%>
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
	if(result>0){%>
		<div class="content">
			<h1> delete success</h1>
			<img src="success.jpg"/>
		</div>
	<%}else{%>
		<div class="content">
			<h1> Sorry, Try again. </h1>
			<img src="try_again.jpg"/>
		</div>
	<%}
%>
</body>
</html>