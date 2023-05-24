<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<c:choose>
	<c:when test="${empty name }">
		<c:redirect url="login.jsp" />
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${empty param.page }">
				<c:set var="page" value="1" />
			</c:when>
			<c:otherwise>
				<c:set var="page" value="${param.page }" />
			</c:otherwise>
		</c:choose>

		<!-- 게시글이 아예 없는 경우.. 기본 totalRows를 설정. -->
		<c:if test="${empty totalRows }">
			<c:set var="totalRows" value="1" />
		</c:if>
		<!-- 		<!DOCTYPE html> -->
		<html>
<head>
<meta charset="UTF-8">
<title>getBoardLsit</title>
</head>
<body>
	<h1>게시판 </h1>
	<h2>
		<a href="GetUser?id=${id }">${name }</a>환영합니다. <a href="logout.do">로그아웃</a>
		<br>
	</h2>
	<form action="getBoardList.do?page=1" method="get">
		검색 : <select name="searchCondition">
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
<%-- 		<c:forEach items="${conditionMap }" var="option"> --%>
<%-- 			<option value="${option.value }">${option.key } --%>
<%-- 		</c:forEach> --%>
		</select> &nbsp;검색 : <input type="text" size="20" name="searchKeyword"> 
		<input type="submit" value="검색">
	</form>
	<c:choose>
		<c:when test="${empty boardList }">
			등록된 글이 없습니다.
		</c:when>
		<c:otherwise>
			<form action="deleteBoard.do" method="post">
				<table border="1">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>조회수</th>
						<c:if test="${role=='admin'}">
							<th>삭제</th>
						</c:if>

					</tr>
					<c:forEach items="${boardList }" var="board">
						<tr>
							<td>${board.seq}</td>
							<td><a href="getBoard.do?seq=${board.seq}">${board.title }</a></td>
							<td>${board.writer }</td>
							<td>${board.regdate }</td>
							<td>${board.cnt }</td>
							<c:if test="${role=='admin' }">
								<td><input type="checkbox" name="seq" value="${board.seq }"></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
				<br> <a href="insertBoard.jsp">새 글추가</a>
				<c:if test="${role=='admin'}">
					<input type="submit" value="일괄삭제" />
				</c:if>
			</form>
			<jsp:include page="getBoardListPage.jsp">
		<jsp:param value="${page }" name="pg"/>
		<jsp:param value="${totalRows }" name="totalCount"/>
	</jsp:include>
		</c:otherwise>
	</c:choose>

</body>
		</html>
	</c:otherwise>
</c:choose>