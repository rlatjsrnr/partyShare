<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1{
		position:absolute;
		left:45%;
	}
	#preview{
		width: 150px;
		height: 150px;
	}
	#profileImage{
		position:absolute;
		right:20%;
		border:1px grey solid;
		width: 300px;
		height: 300px;
		text-align: center;
	}
	#profileImage img{
		width: 200px;
		height: 200px;		
	}
	
	#modifyContainer{
		position:absolute;
		left:35%;
		top: 20%;
		width: 1000px;
		height: 300px;
		
	}
	#modifyBox{
		width: 30%;
		float: left;
	}
	#modifyImgBox{
		width : 30%;
		float: left;
	}
	#partyListContanier{
		position: absolute;
		top: 55%;
		left: 35%;
	}
	
	table tr th{
		font-size: 20px;
	}
	#partyImg{
		width: 200px;
		height: 200px;
	}
</style>
</head>
<body>
<a href="home">home으로</a>
<!-- 계정정보객체, 파티목록 필요, 파티 이미지들 -->
	<h1>계정 정보</h1>
	<div id="profileImage">
		<img src="upload/profile/${loginMember.profileImageName}" ><br/>
		Profile Image
	</div>
	
	<form action="modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mNum" value="${loginMember.MNum}"/>
		<div id="modifyContainer">
			<div id="modifyBox">
				<table border="1">
					<tr>
						<th colspan="2">계정 수정</th>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="mId" value="${loginMember.MId}" readonly/></td>
					
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="mPw" value="${loginMember.MPw}" required/></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="passwordChk" value="${loginMember.MPw}" required/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="mName" value="${loginMember.MName}" required/></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="mNick" value="${loginMember.MNick}" required/></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="number" name="mAge" value="${loginMember.MAge}" required/></td>
					</tr>
					<tr>
						<td>email</td>
						<td><input type="email" name="mEmail" value="${loginMember.MEmail}" required/></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="mAddr" value="${loginMember.MAddr}" required/></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="mGender" value="M" required />남자
							<input type="radio" name="mGender" value="F" required />여자
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center">
							<button>수정완료</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="modifyImgBox">
				프로필 이미지 설정 <br/> 
				<img id="preview" /><br/>
				<input type="file" name="image" id="image" onchange="readURL(this);" accept=".gif, .jpg, .jpeg, .png"/> <br/>
			</div>
		</div>
		
	</form>
	<div id="partyListContanier">
		<h2 style="text-align: center;">내가 참여했던 파티 목록</h2>
		<table border="1">
			<tr style="text-align: center;">
				<td colspan="3">참여 횟수 : ${joinCnt}</td>
			</tr>
			<c:choose>
				<c:when test="${!empty joinPartyList}">
					<c:forEach var="list" items="${joinPartyList}">
						<tr>
							<td rowspan="3">
								<img id="partyImg" src="upload/party/${list.partyImage1}" />
							</td>	
							<td>파티이름 : </td>
							<td>${list.PName}</td>	
						</tr>
						<tr>
							<td>파티날짜 : </td>
							<td>${list.formatStartDate} ~ ${list.formatEndDate}</td>
						</tr>
						<tr>
							<td>파티장소 : </td>
							<td>${list.address} ${list.detailAddress}</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="3" style="text-align: center;"><a href="" id="reportBtn">신고하기</a></td>
						</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="3">참여 파티 없음</td>
					</tr>			
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	

		
	

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