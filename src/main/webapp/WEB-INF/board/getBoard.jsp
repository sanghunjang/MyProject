<%@page import="java.util.ArrayList"%>
<%@page import="com.company.biz.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoard</title>
</head>
<body>
	<h1>${board.seq} 번 글 상세보기
	</h1>
	<form action="updateBoard.do" method="post">
		<input type="hidden" name="seq" value="${board.seq }">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" value="${board.title }" name="title"></td>
			</tr>

			<tr>
				<td>작성자</td>
				<td>${board.writer }</td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="40" name="content">${board.content }</textarea>
				</td>
			</tr>

			<tr>
				<td>등록일</td>
				<td>${board.regdate }</td>
			</tr>

			<tr>
				<td>조회수</td>
				<td>${board.cnt }</td>
			</tr>

			<tr>
				<c:if test="${name==board.writer || role=='admin' }">
				<td colspan="2"> <input type="submit" value="글 수정"></td>
				</c:if>
			</tr>
		</table>
	</form>
	<a href="getBoardList.do">글목록</a> &nbsp;
	
	<c:if test="${name==board.writer || role=='admin' }">
				<td colspan="2"> <a href="deleteBoard.do?seq=${board.seq}">글삭제</a></td>
				</c:if>
	
	<br> <br>
	<form action="InsertReplyBoard" method="post">
		<input type="hidden" name="seq" value="${board.seq}">
		<textarea rows="5" cols="40" name="content"></textarea> <input type="submit" value="댓글 남기기">
	</form>
	
	<hr>
	
<!-- 	<h3>댓글 리스트</h3> -->
	
<%-- 	<c:if test="${empty replyBoardList }"> --%>
<!-- 		등록된 댓글이 없습니다. -->
<%-- 	</c:if> --%>
	
<%-- 	<c:forEach items="${replyBoardList }" var="reply"> --%>
<%-- 	${reply.masking_nickname } : ${reply.content } 남긴 날짜 : ${reply.regdate } --%>
<%-- 	<c:if test="${id==reply.userid || id=='hong' }"> --%>
<%-- 		<a href="GetReplyBoard?rseq=${reply.rseq }">수정</a> <a href="DeleteReplyBoard?rseq=${reply.rseq }">삭제</a> <br> <br> --%>
<%-- 	</c:if> --%>
<%-- 	</c:forEach> --%>
	
</body>
</html>