<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.partyContainer{
		border: 1px black solid;
		width: 300px;
		hidght : 400px;
		text-align: center;
		display: inline-block;
	}

	td img{
		width: 200px;
		height: 200px;
	}
</style>
</head>
<!-- partyList 필요 -->
<a href="createParty">파티등록</a><br/>
<hr/>
<body>
	<c:choose>
		<c:when test="${!empty partyList}">
			<c:forEach var="list" items="${partyList}">
				<div class="partyContainer">
					<table>
						<tr>
							<td colspan="2"><img src="partyImage?pNum=${list.PNum}"/></td>
						</tr>
						<tr>
							<td>파티명 : </td>
							<td>${list.PName}</td>
						</tr>
						<tr>
							<td>주소 : </td>
							<td>${list.sido} ${list.sigungu} ${list.address}</td>
						</tr>
						<tr>
							<td>날짜 : </td>
							<td>${list.startDate} ~ ${list.endDate}</td>
						</tr>
					</table>				
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
</body>
</html>