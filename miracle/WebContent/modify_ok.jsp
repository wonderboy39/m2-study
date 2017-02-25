<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.miracle.board.BoardVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.miracle.member.DBService"%>
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
	request.setCharacterEncoding("utf-8");
	DBService dbService = DBService.getInstance();
	dbService.setResource("board");
	
	SqlSession sqlSession = dbService.getFactory().openSession(true);
	BoardVO bvo = (BoardVO)session.getAttribute("bvo");
	
	MultipartRequest mr = new MultipartRequest(
			request,
			getServletContext().getRealPath("/upload"),
			500*1024*1024,
			"utf-8",
			new DefaultFileRenamePolicy()
			);
	
	bvo.setContent(mr.getParameter("content"));
	bvo.setFilename(mr.getParameter("filename"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setPassword(mr.getParameter("password"));
	bvo.setSubject(mr.getParameter("subject"));
	
	session.setAttribute("bvo", bvo);
	
	int result = sqlSession.update("updateContent", bvo);
	System.out.println("result : " + String.valueOf(result));
	pageContext.forward("listAll.jsp");
	
%>
</body>
</html>