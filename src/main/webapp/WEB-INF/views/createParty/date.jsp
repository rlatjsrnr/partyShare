<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="createDate" method="post">
		<input type="hidden" name="host" value="${loginMember.MNum}"/>
		<input type="hidden" name="pName" value="${vo.PName}" /><br/>
		시작날짜 : <input type="date" name="startDate"/>	~	끝 날짜 : <input type="date" name="endDate"/> <br/>
		<button>다음</button>
	</form>
</body>
</html>