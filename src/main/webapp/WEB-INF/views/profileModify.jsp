<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>Insert title here</title>
<style type="text/css">
	#title{
		margin-left: 41%;
	}
	
	#modifyContainer{
		margin-left: 35%;
	}
	#modifyBox{
		width: 40%;
	}
	
	.profile_img_wrap{
		position: relative;
		right: 90px;
		margin: 20px auto;
		width: 250px;
	}
	
	.profile_img_wrap .profile_img{
		width:250px;
		height:250px;
		border-radious:125px;
	}
	
	.profile_img_wrap .trash_cover{
		width: 40px;
		height: 40px;
		position:absolute;
		bottom: 5px;
		border:1px solid white;
		background-color: #aaaaaa99;
		border-radius:20px;
		padding: 4px;
		box-sizing:border-box;
	}
	
	.profile_img_wrap .trash_cover > label{
		display:block;
		background-image:url('${path}/resources/img/trash.png');
		background-size:30px;
		background-repeat:no-repeat;
		width: 30px;
		height: 30px;
		margin:0;
	}
	
	.profile_img_wrap .img_cover{
		width: 40px;
		height: 40px;
		position:absolute;
		bottom: 5px;
		right:5px;
		border:1px solid white;
		background-color: #aaaaaa99;
		border-radius:20px;
		padding: 4px;
		box-sizing:border-box;
	}
	
	.profile_img_wrap .img_cover > label{
		display:inline-block;
		background-image:url('${path}/resources/img/camera.png');
		background-size:30px;
		background-repeat:no-repeat;
		width: 30px;
		height: 30px;
		margin:0;	
	}
	
	.profile_img_wrap .img_cover .img_file, #delete_img{
		display: none;
	}
	
	#partyListContanier{
		margin-left: 25%;
		margin-top: 3%;
		width: 50%;
	}
	#title2{
		margin-top:3%;
	}
	
	table tr th{
		font-size: 30px;
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
	table input{
		border:none;
		outline: none;
	}
</style>
</head>
<body>
<a href="<c:url value='/home'/>">home으로</a>
	<h1 id="title">계정 정보</h1>
	<div class="profile_img_wrap">
		<img id="profile_img" class="profile_img" src="<c:url value='/image/printProfileImage?fileName=${loginMember.profileImageName}'/>"/>
		<div class="trash_cover" id="delete_img">
			<label></label>
		</div>
		<div class="img_cover">
			<label for="img_file"></label>
			<input type="file" class="img_file" id="img_file" accept=".gif, .jpg, .jpeg, .png" />
			<input type="hidden" id="uImage" />
		</div>
	</div>
	
	<form action="modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mnum" value="${loginMember.mnum}"/>
		<input type="hidden" name="mbanCnt" value="${loginMember.mbanCnt}"/>
		<input type="hidden" name="mjoinCnt" value="${loginMember.mjoinCnt}"/>
		<input type="hidden" name="mblackYN" value="${loginMember.mblackYN}"/>
		<input type="hidden" name="withdraw" value="${loginMember.withdraw}"/>
		<input type="hidden" name="profileImageName" id="profileImageName" value="${loginMember.profileImageName}"/>
	
		<div id="modifyContainer">
			<div id="modifyBox">
				<table class="table">
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
							<button class="btn btn-dark">수정완료</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<div id="partyListContanier">
		<h2 id="title2">내가 참여했던 파티 목록</h2>
		<table class="table table-bordered border-black">
			<tr style="text-align: center;">
				<td colspan="3">참여 횟수 : ${joinCnt}</td>
			</tr>
			<c:choose>
				<c:when test="${!empty joinPartyList}">
					<c:forEach var="list" items="${joinPartyList}">
						<tr onclick="partyDetail(${list.pnum});" style="cursor:pointer;">
							<td rowspan="3" style="text-align: center;">
								<img id="partyImg" src="<c:url value='/image/printPartyImage?fileName=${list.partyImage1}'/>" />
							</td>	
							<td>파티이름  </td>
							<td>${list.pname}</td>	
						</tr>
						<tr onclick="partyDetail(${list.pnum});" style="cursor:pointer;">
							<td>파티날짜  </td>
							<td>${list.formatStartDate} ~ ${list.formatEndDate}</td>
						</tr>
						<tr onclick="partyDetail(${list.pnum});" style="cursor:pointer;">
							<td>파티장소  </td>
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
	var contextPath = '${pageContext.request.contextPath}';
	// 프사 이미지 경로를 저장할 변수
	var profile = "";
	var oldProfileImageName = "";
	$("#img_file").on("change", function(){
		let files = this.files;
		let isImages = false;
		let formData = new FormData();
		formData.append("file", files[0]);
		
		let imgs = ['jpg','jpeg','png','gif'];
		for(let i = 0; i < imgs.length; i++){
			if(files[0].name.toLowerCase().endsWith(imgs[i])){
				isImages = true;		
			}
		}
		
		if(isImages){
			$.ajax({
				type:"POST",
				url: contextPath+"/image/uploadAjax",
				data:formData,
				processData:false,
				contentType:false,
				dataType:"text",
				success:function(result){
					alert('프로필 이미지 변경 완료');
					// result : /2023/10/10/kdlsafghdlkzfgkl_sdlkfj.jpg
					$("#profileImageName").val(result);
					oldProfileImageName = '${loginMember.profileImageName}';
					profile = $("#profile_img").attr("src");
					$("#profile_img").attr("src", "<c:url value='/image/printProfileImage?fileName="+result+"'/>");
					// 업로드된 이미지를 삭제할 때 이미지 이름을 읽어올 입력태그
					$("#uImage").val(result);
					$("#delete_img").fadeIn("fast");
				}
			});
		}
	});
	
	$("#delete_img").click(function(){
		let fileName = $("#uImage").val();
		$.ajax({
			type:"DELETE",
			url: contextPath+"/image/deleteFile",
			data : fileName,
			dataType:"text",
			success:function(result){
				alert('프로필 이미지 변경 취소');
				// 기본 프로필 이미지로 다시 변경
				$("#profile_img").attr("src", profile);
				$("#profileImageName").val(oldProfileImageName);
				// 쓰레기통 아이콘 삭제
				$("#delete_img").fadeOut("fast");
			}
		});
	});
	
	var contextPath = '${pageContext.request.contextPath}';
	
	function partyDetail(pnum){
		location.href=''+contextPath+'/party/partyDetail?pnum='+pnum;
	}
</script>
</body>
</html>