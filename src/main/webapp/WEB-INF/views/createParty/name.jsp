<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="createName" method="post">
		<input type="hidden" name="host" value="${loginMember.MNum}"/>
		파티이름 : <input type="text" name="pName" required/><br/>
		<button>다음</button>
	</form>
</body>
</html>