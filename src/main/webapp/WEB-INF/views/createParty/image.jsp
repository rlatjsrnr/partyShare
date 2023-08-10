<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#imgBox{
		display:flex;
		flex-wrap:wrap;
		width:1000px;
		height:300px;
	}
	#imgBox img{
		border:1px solid black;
	}
	#imgBox .preview{
		width:30%;
		height:99%;
	}
</style>
</head>
<body>
	<form action="createParty" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="host" value="${loginMember.MNum}"/>
		<input type="hidden" name="pName" value="${vo.PName}" />
		<input type="hidden" name="startDate" value="${vo.startDate}" />
		<input type="hidden" name="endDate" value="${vo.endDate}" />
		<input type="hidden" name="mainCategory" value="${vo.mainCategory}" />
		<input type="hidden" name="subCategory" value="${vo.subCategory}" />
		<input type="hidden" name="pContext" value="${vo.PContext}" />
		<input type="hidden" name="address" value="${vo.address}"><br/>
		<input type="hidden" name="sido" value="${vo.sido}"><br/>
		<input type="hidden" name="sigungu" value="${vo.sigungu}"><br/>
		<input type="hidden" name="detailAddress" value="${vo.detailAddress}"><br/>
		파티 이미지 등록 <br/>
		<div id="imgBox">
			<img id="preview1" /><br/>
			<img id="preview2" /><br/>
			<img id="preview3" /><br/>
		</div>
		<input type="file" name="image1" id="imgInput1" onchange="readURL(this);" accept=".gif, .jpg, .jpeg, .png"/> <br/>
		<input type="file" name="image2" id="imgInput2" onchange="readURL(this);" accept=".gif, .jpg, .jpeg, .png"/> <br/>
		<input type="file" name="image3" id="imgInput3" onchange="readURL(this);" accept=".gif, .jpg, .jpeg, .png"/> <br/>
		<button>등록</button>
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