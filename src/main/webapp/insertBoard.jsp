<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty name }">
	 <c:redirect url="login.jsp" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 등록</title>
</head>
<body>
	<h1>새 글 등록</h1>
	<hr>
	<form action="insertBoard.do" method="post">
		<table border="1">
			<tr>
				<td>제목</td>
				<td> <input type="text" name="title"> </td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td> <input type="text" name="writer" value="${name }" readonly="readonly"> </td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td> <textarea name="content" rows="10" cols="40"></textarea> </td>
			</tr>
			<tr>
				<td>업로드</td>
				<td> <input type="file" name="uploadFile"> </td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="새글 등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>