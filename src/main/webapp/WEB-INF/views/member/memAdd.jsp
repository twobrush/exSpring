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
	<%@include file="/WEB-INF/views/comm/menu.jsp" %>
<!-- 	<c:url /> 주소만들어주는 jstl 태크 -->
	<form action="${pageContext.request.contextPath}/member/add.do" method="post">
	id : <input type="text" name="memId" /><br />
	pass : <input type="password" name="memPass" /><br />
	Name : <input type="text" name="memName" /><br />
	Point : <input type="text" name="memPoint"  /><br />
	 <input type="submit" />
	 <hr />
	 <a href="${pageContext.request.contextPath}/member/list.do">목록으로 이동</a>
</form> 
</body>
</html>