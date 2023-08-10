<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<body>
<a href="profileModify">modify</a>
<a href="partyList">partyList</a>
<a href="address">address</a>
<form action="login" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mId"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mPw" /></td>
		</tr>
		<tr>
			<td colspan="2"><button>로그인</button></td>
		</tr>
	</table>
</form>
</body>
</html>