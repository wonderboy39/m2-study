<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1px solid 000">
	<form action="join_ok.jsp" method="post">
		<tr>
			<td> 이름 : &nbsp;&nbsp; </td>
			<td> <input type="text" name="id"/></td>
		</tr>
		<tr>
			<td> 비밀번호 : &nbsp;&nbsp; </td>
			<td> <input type="password" name="pw"/></td>
		</tr>
		<tr>
			<td> name : &nbsp;&nbsp; </td>
			<td> <input type="text" name="name"/></td>
		</tr>
		<tr>
			<td> email : &nbsp;&nbsp; </td>
			<td> <input type="text" name="email"/></td>
		</tr>
		<tr>
			<td><input type="submit"/></td>
			<td><input type="reset"/></td>
		</tr>
	</form>
	</table>
</body>
</html>