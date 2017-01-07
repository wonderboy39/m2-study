<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.caption-join{
	font-weight:700;
	font-size:20px;
	padding:5px;
	color:#1BA6B2;
	text-align:center;
	margin-bottom:5px;
}
.input{
	margin: 0 auto;
	align:center;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<body>
	<!-- <table border="1px solid 000"> -->
	<table align="center" >
	<caption class="caption-join"> 
		회원 가입 양식  
	</caption>
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
			<td>
				<div class="input">
					<input type="reset" value="reset"/>
				</div>
			</td>
			<td>
				<div class="input">
					<input type="submit" value="ok"/>
				</div>
			</td>
		</tr>
	</form>
	</table>
</body>
</html>