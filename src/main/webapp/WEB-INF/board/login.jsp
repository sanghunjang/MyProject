<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
   <h1>로그인 페이지</h1>

   <form action="login.do" method="post">
      ID : <input type="text" name="id" value="hong"> <br> 
      PW : <input type="text" name="password" value="123"><br> 
      <input type="submit" value="로그인"><input type="reset" value="다시입력">
   </form>
</body>
</html>