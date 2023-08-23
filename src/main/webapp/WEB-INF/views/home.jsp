<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<body>
<a href="<c:url value='/member/profileModify?page=1'/>">modify</a>
<a href="<c:url value='/party/partyList'/>">partyList</a>
<a href="<c:url value='/party/partyHost?pnum=496'/>">partyMemberList</a>
<form action="member/login" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mid"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" /></td>
		</tr>
		<tr>
			<td colspan="2"><button>로그인</button></td>
		</tr>
	</table>
</form>
</body>
</html>