<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#categoryContainer div{
		border:1px black solid;
		width: 100px;
		height: 50px;
		padding :20px;
	}
	
	#categoryContainer{
		display:flex;
		flex-wrap: wrap;
		width: 1000px;
		hight:50px;
		padding:20px;
		text-align: center;
	}
	
	form button{
		width: 100px;
		height: 50px;
	}
</style>
</head>
<body>
	
	<h1>다음 중 당신의 파티를 가장 잘 설명하는 것은 무엇인가요?</h1>
	<c:if test="${!empty category}">
		<div id="categoryContainer">
			<c:forEach var="list" items="${category}">
				<div>
					${list}
				</div>
			</c:forEach>
		</div>
	</c:if>
	
	
	<form action="createCategory" method="post"> 
		<input type="hidden" name="host" value="${loginMember.MNum}"/>
		<input type="hidden" name="pName" value="${vo.PName}" />
		<input type="hidden" name="startDate" value="${vo.startDate}" />
		<input type="hidden" name="endDate" value="${vo.endDate}" />
		<input type="hidden" name="pContext" value='${vo.PContext}' />
		<input type="hidden" name="description" value="${vo.description}" />
		<input type="text" id="category" name="category" required/><br/>
		<button id="submit">다음</button>
	</form>
	
<script>
const divs = document.querySelectorAll("div");
divs.forEach((target) => target.addEventListener("click", handleConcept));
function handleConcept(e){	
	for(let i=0; i<divs.length; i++){
		divs[i].style.backgroundColor = "white";
	}
	let value = e.target.innerText;
	document.querySelector("#category").value = value;
	e.target.style.backgroundColor = "blue";
}
	
</script>
</html>