<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> write form test </title>

<script type="text/javascript">
	function sendData(){
		for(var i=0; i<document.forms[0].elements.length; i++){
			if(document.forms[0].elements[i].value==""){
				if(i==3) continue;  // i==3일때 첨부파일항목이다.
														// 첨부파일을 올리지 않아도 사용가능해야 하므로 continue;
				alert(document.forms[0].elements[i].name + " 를 입력하십시오.");
				document.forms[0].elements[i].focus();
				return;
			}
		}
		document.forms[0].submit();
	}
</script>
</head>
<body>
	<div id="board-input">
		<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
			<table summary="write post">
				<caption> Write your post </caption>
				<tbody>
					<tr>
						<th>제목: </th>
						<td><input type="text" name="subject" size="45"/></td>
					</tr>
					<tr>
						<th>이름: </th>
						<td><input type="text" name="writer" size="12"/></td>
					</tr>
					<tr>
						<th>내용: </th>
						<td><textarea name="content" cols="50" rows="8"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일: </th>
						<td><input type="file" name="filename"/></td>
					</tr>
					<tr>
						<th>비밀번호: </th>
						<td><input type="password" name="password"/></td> 
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="보내기" onclick="sendData()"/>
							<input type="button" value="reset"/>
							<input type="button" value="글 목록으로.." onclick="javascript:location.href='list.jsp'"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>