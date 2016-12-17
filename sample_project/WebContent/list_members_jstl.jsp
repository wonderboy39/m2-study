<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.test.board.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> jstl 이용한 출력 </title>
</head>
<body>
<h1>Test</h1>
<%
	SqlSession ss = DBService.getFactory().openSession(true);
	List<Map<Object, Object>> result;
	result = ss.selectList("select_all");
	ss.close();
	pageContext.setAttribute("result", result);
	if(result.size()>0){%>
		<h1> <%=result%></h1>
	<%}
%>
<h1>--- jstl---</h1>
<c:forEach items="${result}" var="member_list">
	<c:forEach items="${member_list}" var="member_map">
		<c:if test="${member_map.key eq 'id'}"> ${member_map.value}<br/></c:if>
	</c:forEach>
</c:forEach>

<h1>using table</h1> <br/>

<table border="2">
	<caption> 회원목록 </caption>
	<thead>
		<tr>
			<th>id</th>
			<th>pw</th>
		</tr>
	</thead>
	<tbody>
		
			<c:forEach items="${result}" var="list">
				<tr>
					<c:forEach items="${list}" var="map">
						<c:if test="${map.key eq 'id'}">
							<td>${map.value}</td>
						</c:if>
					</c:forEach>
					<c:forEach items="${list}" var="map">
						<c:if test="${map.key eq 'pw'}">
							<td>${map.value}</td>
						</c:if>
					</c:forEach>
				</tr>
				
			</c:forEach>
		
	</tbody>
</table>
<%-- <table>
	<thead>
	</thead>
	<tbody>
		<tr>
			<td>
				<c:forEach items="${result}" var="list">
					<c:forEach items="${list}" var="map">
						${map}
					</c:forEach>
				</c:forEach>
			</td>
		</tr>
		
	</tbody>
</table> --%>

</body>
</html>