<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 삭제 페이지 </title>
</head>
<body>
	<script type="text/javascript">
		function go_delete(f){
			if(f.password.value==""){
				alert("비밀번호를 입력하세요. ");
				f.password.focus();
				return;
			}
			f.submit();
		}
	</script>
	<table class="table table-bordered">
		<thead>
			<caption> 게시글 수정 </caption>
		</thead>
		<tbody>
			<form action="delete_ok.jsp" method="post" enctype="multipart/form-data">
				<tr>
					<td>비밀번호 입력 </td>
					<td>
						<input type="password" name="password" value="" placeholder="비밀번호를 입력하세요" class="form-control" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" value="삭제" onclick="go_delete(this.form)" class="pull-right"/>
						<input type="hidden" name="seq" value="<%=seq%>"/>
					</td>
				</tr>
			</form>
		</tbody>
	</table>
</body>
</html>