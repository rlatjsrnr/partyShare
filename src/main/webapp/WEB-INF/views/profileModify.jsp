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
	#pmtr{
		text-align: center;
		font-size: 20px;
	}
	#pmtr a{
		text-decoration: none;
		color:black;
	}
</style>
</head>
<body>
<a href="<c:url value='/home'/>">home으로</a>
<!-- 계정정보객체, 파티목록 필요, 파티 이미지들 -->
	<h1>계정 정보</h1>
	<div id="profileImage">
		<img src="<c:url value='/image/printProfileImage?fileName=${loginMember.profileImageName}'/>" ><br/>
		Profile Image
	</div>
	
	<form action="modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mnum" value="${loginMember.mnum}"/>
		<input type="hidden" name="mbanCnt" value="${loginMember.mbanCnt}"/>
		<input type="hidden" name="mjoinCnt" value="${loginMember.mjoinCnt}"/>
		<input type="hidden" name="mblackYN" value="${loginMember.mblackYN}"/>
		<input type="hidden" name="withdraw" value="${loginMember.withdraw}"/>
		<input type="hidden" name="profileImageName" value="${loginMember.profileImageName}"/>
	
		<div id="modifyContainer">
			<div id="modifyBox">
				<table border="1">
					<tr>
						<th colspan="2">계정 수정</th>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="mid" value="${loginMember.mid}" readonly/></td>
					
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="mpw" value="${loginMember.mpw}" required/></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="passwordChk" value="${loginMember.mpw}" required/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="mname" value="${loginMember.mname}" required/></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="mnick" value="${loginMember.mnick}" readonly/></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="number" name="mage" value="${loginMember.mage}" required/></td>
					</tr>
					<tr>
						<td>email</td>
						<td><input type="email" name="memail" value="${loginMember.memail}" readonly/></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="maddr" value="${loginMember.maddr}" required/></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="mgender" value="M" required />남자
							<input type="radio" name="mgender" value="F" required />여자
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
						<tr onclick="partyDetail(${list.pnum});" style="cursor:pointer;">
							<td rowspan="3">
								<img id="partyImg" src="<c:url value='/image/printPartyImage?fileName=${list.partyImage1}'/>" />
							</td>	
							<td>파티이름 : </td>
							<td>${list.pname}</td>	
						</tr>
						<tr onclick="partyDetail(${list.pnum});" style="cursor:pointer;">
							<td>파티날짜 : </td>
							<td>${list.formatStartDate} ~ ${list.formatEndDate}</td>
						</tr>
						<tr onclick="partyDetail(${list.pnum});" style="cursor:pointer;">
							<td>파티장소 : </td>
							<td>${list.address} ${list.detailAddress}</td>
						</tr>
					</c:forEach>
					<tr id="pmtr">
						<td colspan="3">
							<!-- PageMaker == pm -->
							<c:if test="${pm.prev}">
								<a href="<c:url value='/member/profileModify${pm.mkQueryStr(pm.startPage-1)}'/>">&laquo;</a>
							</c:if>
							
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
								<c:choose>
									<c:when test="${i eq pm.cri.page}">
										<a style="color:red;" href="<c:url value='/member/profileModify${pm.mkQueryStr(i)}'/>">[${i}]</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value='/member/profileModify${pm.mkQueryStr(i)}'/>">[${i}]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${pm.next}">
								<a href="<c:url value='/member/profileModify${pm.mkQueryStr(pm.endPage+1)}'/>">&raquo;</a>
							</c:if>
						</td>
					</tr>
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
	
	var contextPath = '${pageContext.request.contextPath}';
	
	function partyDetail(pnum){
		location.href=''+contextPath+'/party/partyDetail?pnum='+pnum;
	}
</script>
</body>
</html>