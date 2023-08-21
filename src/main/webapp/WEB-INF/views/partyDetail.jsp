<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	const message = '${message}';
	if(message != ''){
		alert(message);
	}
</script>
<body>
	<h1>partyDetail</h1>
	<h3>party : ${party}</h3>
	<a href="chat?pNum=${party.PNum}">채팅창</a>
</body>
</html>
