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
		width:1500px;
		height:500px;
	}
	#imgBox img{
		border:1px solid black;
	}
	#imgBox #preview1{
		width:30%;
		height:99%;
	}
	#imgBox #preview2{
		width:30%;
		height:99%;
	}
	#imgBox #preview3{
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
		파티 이미지 등록 <br/>
		<div id="imgBox">
			<img id="preview1" /><br/>
			<img id="preview2" /><br/>
			<img id="preview3" /><br/>
		</div>
		<input type="file" name="image1" onchange="readURL1(this);" /> <br/>
		<input type="file" name="image2" onchange="readURL2(this);" /> <br/>
		<input type="file" name="image3" onchange="readURL3(this);" /> <br/>
		<button>등록</button>
	</form>
	
	<script>
	function readURL1(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview1').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview1').src = "";
	  }
	}
	function readURL2(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview2').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview2').src = "";
		  }
		}
	function readURL3(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview3').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview3').src = "";
		  }
		}
</script>
</body>
</html>