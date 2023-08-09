<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div id="categoryContainer">
		<div >
			농구
		</div>
		<div >
			축구
		</div>
		<div >
			등산
		</div>
		<div >
			서핑
		</div>
		<div >
			게임
		</div>
		<div >
			수영
		</div>
		<div >
			음주가무
		</div>
		<div >
			광란의 파티
		</div>
		<div >
			그외
		</div>
	</div>
	<form action="createSubCategory" method="post"> 
		<input type="hidden" name="host" value="${loginMember.MNum}"/>
		<input type="hidden" name="pName" value="${vo.PName}" />
		<input type="hidden" name="startDate" value="${vo.startDate}" />
		<input type="hidden" name="endDate" value="${vo.endDate}" />
		<input type="hidden" name="pContext" value="${vo.PContext}" />
		<input type="hidden" name="mainCategory" value="${vo.mainCategory}" />
		<input type="hidden" id="sub" name="subCategory" /><br/>
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
	document.querySelector("#sub").value = value;
	e.target.style.backgroundColor = "blue";
}
	
</script>
</html>