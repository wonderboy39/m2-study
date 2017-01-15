<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Bootstrap Write Form </title>
<link rel="styleshhet" content="css/bootstrap.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
<div class="container"> <!-- class="container" :: 좌우 여백을 맞춰주는 역할 -->
<!-- <table class="table table-striped"> -->
<table class="table table-bordered">
	<thead>
	 <caption> 게시글 입력 </caption>
	</thead>
	<tbody>
		<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
			<tr>
				<th>제목 : </th> <!-- 제목, 이름, 내용, 첨부파일, 비밀번호 -->
				<td><input type="text" name="subject" placeholder="제목을 입력하세요. " class="form-control"/></td>
			</tr>
			<tr>
				<th>이름 : </th>
				<td><input type="text" name="name" placeholder="이름을 입력하세요. " class="form-control"></td>
			</tr>
			<tr>
				<th>내용 : </th>
				<td><textarea name="content" rows="8" placeholder="내용을 입력하세요. " class="form-control"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일 : </th>
				<td><input type="file" name="filename" class="form-control"/></td>
			</tr>
			<tr>
				<th>비밀번호 : </th>
				<td><input type="password" name="password" placeholder="비밀번호를 입력하세요. " class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="등록" onclick="sendData()" class="pull-right"/>
					<input type="button" value="reset" class="pull-left"/>
					<input type="button" value="글 목록으로.." class="pull-right" onclick="javascript:location.href='list.jsp'"/>
				</td>
			</tr>
		</form>
	</tbody>
</table>
</div>

</body>
</html>