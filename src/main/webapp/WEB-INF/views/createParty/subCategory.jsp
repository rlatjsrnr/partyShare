<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="createSubCategory" method="post"> 
		<input type="hidden" name="host" value="${loginMember.MNum}"/>
		<input type="hidden" name="pName" value="${vo.PName}" />
		<input type="hidden" name="startDate" value="${vo.startDate}" />
		<input type="hidden" name="endDate" value="${vo.endDate}" />
		<input type="hidden" name="pContext" value="${vo.PContext}" />
		<input type="hidden" name="mainCategory" value="${vo.mainCategory}" />
		분위기는? : <input type="text" name="subCategory" /><br/>
		<button>다음</button>
	</form>
</body>
</html>