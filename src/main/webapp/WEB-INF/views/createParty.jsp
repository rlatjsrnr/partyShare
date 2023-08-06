<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="createParty" method="post" enctype="multipart/form-data">
		<input type="hidden" name="host" value="${loginMember.MNum}" />
		<table>
			<tr>
				<th colspan="2">파티 등록</th>
			</tr>
			<tr>
				<td>파티 이름 : </td>
				<td><input type="text" name="pName" /></td>
			</tr>
			<tr>
				<td>시/도 : </td>
				<td><input type="text" name="sido" /></td>
			</tr>
			<tr>
				<td>시/군/구 : </td>
				<td><input type="text" name="sigungu" /></td>
			</tr>
			<tr>
				<td>상세주소: </td>
				<td><input type="text" name="address" /></td>
			</tr>
			<!--  <tr>
				<td>시작 날짜 : </td>
				<td><input type="date" name="startDate" /></td>
			</tr>
			<tr>
				<td>끝 날짜 : </td>
				<td><input type="date" name="endDate" /></td>
			</tr>
			-->
			<tr>
				<td>파티 소개: </td>
				<td><input type="text" name="pContext" /></td>
			</tr>
			<tr>
				<td>대분류 : </td>
				<td><input type="text" name="mainCategory" /></td>
			</tr>
			<tr>
				<td>소분류 : </td>
				<td><input type="text" name="subCategory" /></td>
			</tr>
			<tr>
				<td>파티 이미지 : </td>
				<td>
					<img id="preview" /><br/>
					<input type="file" name="image" onchange="readURL(this);" /> <br/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button>파티등록</button></td>
			</tr>
		</table>
		
	</form>
	
<script>
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
</script>
</body>
</html>