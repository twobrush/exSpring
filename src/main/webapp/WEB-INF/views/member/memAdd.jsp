<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
	<h1>회원가입</h1>
<!-- 	<c:url /> 주소만들어주는 jstl 태크 -->
	<form action="${pageContext.request.contextPath}/member/add.do" method="post">
	id : <input type="text" name="memId" /><br />
	pass : <input type="text" name="memPass" /><br />
	Name : <input type="text" name="memName" /><br />
	Point : <input type="text" name="memPoint"  /><br />
	 <input type="submit" />
</form>
</body>
</html>