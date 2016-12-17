<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.test.board.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.test.board.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리 페이지 </title>
<script type="text/javascript">
	function delete_member(form){
		<%
			
		%>
		form.action="delete_member.jsp"
		form.submit();
	}
	
	function modify_member(form){
		form.action="modify_member.jsp";
		form.submit();
	}
</script>
</head>
<body>
<%
	SqlSession ss = DBService.getFactory().openSession(true);
	List<Map<Object, Object>> result;
	result = ss.selectList("select_all");
	ss.close();
//	pageContext.setAttribute("resut", result);
	pageContext.setAttribute("result", result);
	/* List<MemberVO> memberList = new ArrayList<MemberVO>();
	for(Map<Object, Object> map : result){
		meber
	} */
	
	session.setAttribute("orgData", result);
%>
	<form method="post">
	<table align="center" width="500">
		<caption style="font-weight:700; font-size:20px; padding:5px; color:#1BA6B2; text-align:left; margin-bottom:5px;"> 회원 목록 </caption>
		<thead style="background:#ABC668; color:#fff; text-align:center; border-right:1px solid #fff">
			<tr>
				<td style="width:33%;">id</td>
				<td style="width:33%;">pw</td>
				<td style="width:33%;">관리</td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${result}" var="list">
				<tr>
					<c:forEach items="${list}" var="map">
						<c:if test="${map.key eq 'id'}"> <td style="color:orange;"><input type="text" name="id" value="${map.value}" readonly="readonly"/></td> </c:if>
					</c:forEach>
					<c:forEach items="${list}" var="map">
						<!-- 여기에 setProperty등을....넣긔 -->
						<c:if test="${map.key eq 'pw'}"> <td><input type="password" name="pw" value="${map.value}"></td></c:if>
					</c:forEach>
					<td>
						<input type="button" value="삭제" onclick="delete_member(this.form)"/>
						<input type="button" value="수정" onclick="modify_member(this.form)"/>
					</td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td></td>
				<td></td>
				<td>
					<input type="button" value="새로고침" onclick="members(this,form)"/>
				</td> 
			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>
