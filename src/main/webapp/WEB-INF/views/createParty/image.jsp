<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#imgBox{
		display:flex;
		flex-wrap:wrap;
		width:1000px;
		height:300px;
		margin-left:25%;
		margin-top:10%;
	}
	#imgBox img{
		border:1px solid black;
	}
	#imgBox .preview{
		width:300px;
		height:300px;
	}
	h1{
		margin-left:25%;
		margin-top:10%;
	}
	
	.profile_img_wrap{
		position: relative;
		margin:5px auto;
		width: 300px;
	}
	
	.profile_img_wrap .img_cover{
		width: 300px;
		height: 300px;
		border-radius:20px;
		box-sizing:border-box;
		position: absolute;
		text-align: center;
	}
	
	.profile_img_wrap .img_cover > label{
		display:inline-block;
		background-image:url('${path}/resources/img/plus_icon.png');
		background-size:150px;
		background-repeat:no-repeat;
		width: 150px;
		height: 150px;
		margin-top:25%;	
	}
	
	.profile_img_wrap .img_cover .img_file{
		display: none;
	}
	#submitBtn{
		position: absolute;
		bottom: 0;
		width: 100px;
		height: 50px;
		right:0;
	}
	
</style>
</head>
<body>
	<h1>대표 사진 업로드</h1>
	<form action="createImage" method="POST" enctype="multipart/form-data">
    	<input type="hidden" name="host" value="${loginMember.mnum}"/>
		<input type="hidden" name="description" value="${vo.description}" />
		<input type="hidden" name="category" value="${vo.category}" />
		<input type="hidden" name="address" value="${vo.address}">
		<input type="hidden" name="sido" value="${vo.sido}">
		<input type="hidden" name="sigungu" value="${vo.sigungu}">
		<input type="hidden" name="detailAddress" value="${vo.detailAddress}">
		<input type="hidden" id="lat" name="lat" value="${mapVO.lat}">
    	<input type="hidden" id="lng" name="lng" value="${mapVO.lng}">
    	<input type="hidden" name="startDate" value="${vo.startDate}" />
		<input type="hidden" name="endDate" value="${vo.endDate}" />
		<input type="hidden" name="pname" value="${vo.pname}" />
		<input type="hidden" name="pcontext" value="${vo.pcontext}" />

		<div id="imgBox">
			<div class="profile_img_wrap">
				<div class="img_cover">
					<label for="imgInput1"></label>
					<input type="file" class="img_file" id="imgInput1" name="image1" onchange="readURL(this)" accept=".gif, .jpg, .jpeg, .png" />
				</div>
				<img class="preview" />
			</div>
			<div class="profile_img_wrap">
				<div class="img_cover">
					<label for="imgInput2"></label>
					<input type="file" class="img_file" id="imgInput2" name="image2" onchange="readURL(this)" accept=".gif, .jpg, .jpeg, .png" />
					
				</div>
				<img class="preview" />
			</div>
			<div class="profile_img_wrap">
				<div class="img_cover">
					<label for="imgInput3"></label>
					<input type="file" class="img_file" id="imgInput3" name="image3" onchange="readURL(this)" accept=".gif, .jpg, .jpeg, .png" />
				</div>
				<img class="preview" />
			</div>
		</div>
	</form>
	<script>
	function readURL(input) {
		let previews = document.querySelectorAll(".preview");
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      if(input.id == 'imgInput1'){
		    	  previews[0].src = e.target.result;
		    	  $("#imgInput1").closest("div").children("label").css('background-image','url()');
		      }else if(input.id == 'imgInput2'){
		    	  previews[1].src = e.target.result;
		    	  $("#imgInput2").closest("div").children("label").css('background-image','url()');
		      }else{
		    	  previews[2].src = e.target.result;
		    	  $("#imgInput3").closest("div").children("label").css('background-image','url()');
		      }
		      
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
			  if(input.id == 'imgInput1'){
		    	  previews[0].src = "";	  
		    	  $("#imgInput1").closest("div").children("label").css('background-image','url(${path}/resources/img/plus_icon.png)');
		      }else if(input.id == 'imgInput2'){
		    	  previews[1].src = "";
		    	  $("#imgInput1").closest("div").children("label").css('background-image','url(${path}/resources/img/plus_icon.png)');
		      }else{
		    	  previews[2].src = "";
		    	  $("#imgInput1").closest("div").children("label").css('background-image','url(${path}/resources/img/plus_icon.png)');
		      }
		  }
		}
	
</script>
<%@ include file="partyCreateFooter.jsp" %>
</body>
</html>