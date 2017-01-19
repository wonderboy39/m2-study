<%@page import="com.miracle.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.miracle.member.DBService"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1">
<title> View All Posts ... </title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<%
	DBService dbService = DBService.getInstance();
	dbService.setResource("board");
	SqlSession sqlSession = dbService.getFactory().openSession(true);
//	System.out.println("opened session successfully");
//	List<BoardVO> resultList = sqlSession.selectList("view_all_post_normal");
	List<BoardVO> resultList = sqlSession.selectList("readAll");
//	System.out.println("Selected results of SQL");
	sqlSession.close();
	session.setAttribute("results", resultList);
	/* for(BoardVO result : resultList){
		System.out.println("Author == "+result.getWriter() +", "+ "content == " + result.getContent());
	} */
%>
	<table class="table table-striped table-bordered table-hover">
		<caption>
		</caption>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목 </th>
				<th>작성자 </th>
				<!-- <th>내용</th> -->
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty results}">
				<tr>
					<td>---</td>
					<td>현재 등록된 게시글이 없습니다. </td>
					<td>---</td>
				</tr>
			</c:if>
			<c:if test="${!empty results}">
				<c:forEach items="${results}" var="k">
					<tr>
						<td>${k.seq}</td>
						<td>${k.subject}</td>
						<td>${k.writer}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
</body>
</html>