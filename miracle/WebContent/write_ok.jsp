<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.miracle.member.DBService"%>
<%@page import="com.miracle.board.BoardVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result of posting</title>
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
	String path = getServletContext().getRealPath("/upload");
	DBService dbService = DBService.getInstance();
	System.out.println("path == " + path);
	MultipartRequest mr = new MultipartRequest(
			request,
			path,
			500*1024*1024,
			"utf-8",
			new DefaultFileRenamePolicy()
			); 
	BoardVO bvo = new BoardVO();
	bvo.setContent(mr.getParameter("content"));
	bvo.setSubject(mr.getParameter("subject"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setPassword(mr.getParameter("password"));
	
	if(mr.getFile("filename") != null){
		bvo.setFilename(mr.getFilesystemName("filename"));
	}else{
		bvo.setFilename("");
	}
	System.out.println("bvo == " + bvo.getFilename());
	dbService.setResource("board");
	SqlSession sql_session = dbService.getFactory().openSession(true);
	System.out.println("1");
	int result = sql_session.insert("insert_post",bvo);
	if(result>0){%>
		<div class="content">
		<h1> Your post is registered successfully. </h1>
		<img src="success.jpg"/>
	</div>
	<%}
	else{%>
		<div class="content">
		<h1> Sorry, Try again.</h1>
		<img src="try_again.jpg"/>
	</div>
	<%}
%>
</body>
</html>