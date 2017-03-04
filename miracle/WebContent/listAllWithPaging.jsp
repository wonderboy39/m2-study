<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.miracle.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.miracle.member.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1">
<title> 글 목록 보기 </title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<%
	DBService dbService = DBService.getInstance();
	dbService.setResource("board");
	
	SqlSession sqlSession = dbService.getFactory().openSession(true);
	
	int pageCnt = sqlSession.selectOne("pageCnt");
	final int CONTENTS_PER_PAGES = 4;
	final int NUM_PAGES = pageCnt/CONTENTS_PER_PAGES + 1;
	
	int iPageNum = 0;
	int begin = 0;
	session.setAttribute("num_pages", NUM_PAGES);
	
	List<BoardVO> contents = null;
	Map<String, Integer> areaMap = new HashMap<String, Integer>();
	//Map areaMap = new HashMap();
	
	String strPageNum = request.getParameter("pageNum");
	if(strPageNum !=null){
		iPageNum = Integer.parseInt(strPageNum);
		session.setAttribute("pageNo", iPageNum);
	}
	else{
		session.setAttribute("pageNo", 1);
	}
	
	if(iPageNum>0){
		areaMap.put("begin", (iPageNum-1)*CONTENTS_PER_PAGES);
		areaMap.put("end", CONTENTS_PER_PAGES);
		contents = sqlSession.selectList("readPartial", areaMap);
		session.setAttribute("contents", contents);
	}
	else{ //nCurrPage == 0
		areaMap.put("begin", begin);
		areaMap.put("end", CONTENTS_PER_PAGES);
		contents = sqlSession.selectList("readPartial", areaMap);
		session.setAttribute("contents", contents);
	}
	
%>
<div class="container">
	<table class="table table-striped table-bordered table-hover">
		<caption></caption>
		<thead>
			<tr>
				<th>글번호</th>
				<th> 제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty contents}">
				<tr>
					<td> --- </td>
					<td> 현재 등록된 게시물이 없습니다 </td>
					<td> --- </td>
				</tr>
			</c:if>
			<c:if test="${!empty contents}">
				<c:forEach items="${contents}" var="k">
					<tr>
						<td>${k.seq}</td>
						<td><a href="viewContent.jsp?seq=${k.seq}">${k.subject}</a></td>
						<td>${k.writer}</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="3" align="center">
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li>
								<a href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<c:forEach var="i" begin="1" end="${num_pages}" step="1">
								<c:choose>
									<c:when test="${i eq pageNo}">
										<li class="active">
											<a href="listAllWithPaging.jsp?pageNum=${i}">${i}<span class="sr-only">(current)</span></a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="listAllWithPaging.jsp?pageNum=${i}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li>
								<a href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>

