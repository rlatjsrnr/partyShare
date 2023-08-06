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
	<h1>다음 중 당신의 파티를 가장 잘 설명하는 것은 무엇인가요?</h1>
	
	<div >
		기상천외한 파티
	</div>
	<div >
		초소형 주택
	</div>
	<div >
		캠핑장
	</div>
	<div >
		해변바로앞
	</div>
	<div >
		농촌
	</div>
	<div >
		속세를 벗어남
	</div>
	<div >
		럭셔리
	</div>
	<div >
		대저택
	</div>
	<div >
		그외
	</div>
	
<script>
	const divs = document.querySelectorAll("div");
	divs.forEach((target) => target.addEventListener("click", handleConcept));
	//div.addEventListener("click", handleConcept);
	function handleConcept(e){		
		const value = e.target.innerText;
		console.log(value);
		location.href="concept2.jsp?concept1="+value;
	}
</script>
</body>
</html>