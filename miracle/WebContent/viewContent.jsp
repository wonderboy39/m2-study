<%@page import="com.miracle.board.BoardVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.miracle.member.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 작성 글 보기 </title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript">
 function go_modify(f){
	 f.action = "modify.jsp";
	 f.submit();
 }
 function go_delete(f){
	 f.action = "delete.jsp";
	 f.submit();
 }
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	DBService dbService = DBService.getInstance();
	dbService.setResource("board");
	SqlSession sqlSession = dbService.getFactory().openSession(true);
	
	String seq = request.getParameter("seq");
	BoardVO resultVo = sqlSession.selectOne("readOne", seq);
	session.setAttribute("bvo", resultVo);
%>
<div class="container">
<form method="post">
	<table class="table table-striped">
		<thead>
			<th colspan="2"> 
			<p align="center">${bvo.subject} </p>
			</th>
		</thead>
		<tbody>
			<tr>
				<td> 작성자 : ${bvo.writer} </td>
				<td> 글 번호 : ${bvo.seq} </td>
			</tr>
			<tr>
				<td colspan="2"> 
					<p>${bvo.content} </p>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button class="pull-left">목록</button>
					<button class="pull-right" onclick="go_delete(this.form)">삭제</button>
					<button class="pull-right" onclick="go_modify(this.form)">수정</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>
</div>
</body>
</html>






