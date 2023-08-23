<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table img{
		width: 50px;
		height: 50px;
	}
</style>
</head>
<body>
<a href="<c:url value='/home'/>">home으로</a>
<c:if test="${!empty message}">
	<script>
		alert('${message}');
	</script>
</c:if>
	<h1>파티원 관리</h1>
	<table border="1">
		<c:if test="${!empty partyJoinMember}">
			<c:forEach var="list" items="${partyJoinMember}">
				<tr>
					<td><img src="<c:url value='/image/printProfileImage?fileName=${list.profileImageName}'/>"/></td>
					<td style="width: 200px;">${list.mname}</td>
					<td><a href="<c:url value='/party/partyMemberBan?mnum=${list.mnum}&pnum=${party.pnum}'/>">강퇴</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div>
		<h1><a href="<c:url value='/party/partyFinish?pnum=${party.pnum}'/>">파티종료</a></h1>
	</div>
</body>
</html>