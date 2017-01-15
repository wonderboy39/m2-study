<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write something else you want</title>
</head>
<body>
<table class="table">
	<thead>
		<caption> 글쓰기 </caption>
	</thead>
	<tbody>
		<form action="write_ok.jsp" method="post" encType="multiplart/form-data">
			<tr>
				<th>제목: </th>
				<td><input type="text" placeholder="제목을 입력하세요. " name="subject"/></td>
			</tr>
			<tr>
				<th>내용: </th>
				<td><textarea cols="10" placeholder="내용을 입력하세요. " name="content"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일: </th>
				<td><input type="text" placeholder="파일을 선택하세요. " name="filename"/></td>
			</tr>
			<tr>
				<th>비밀번호: </th>
				<td><input type="password" placeholder="비밀번호를 입력하세요"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="등록" onclick="sendData()"/>
					<input type="button" value="reset"/>
					<input type="button" value="글 목록으로... " onclick="javascript:location.href='list.jsp'"/>
				</td>
			</tr>
		</form>
	</tbody>
</table>
</body>
</html>