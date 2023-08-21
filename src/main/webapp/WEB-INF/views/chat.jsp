<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<style>
	#chat_container{
		width : 450px;
		background-color:skyblue;
		font-size: 20px;
		position: relative;
		left:20%;
		top:70px;
		border-radius: 20px;
	}
	
	.chatcontent {
		height: 500px;
		width : 450px;
		overflow-y: scroll;
	}
	
	.chat-fix {
		position: fixed;
		bottom: 0;
		width: 100%;
		text-align: center;
	}
		
	#msgi{	
		width:75%;
		resize: none;
		margin-left:5%;
			
	}
	.send{
		height:50px;
		position: relative;
		bottom: 20px;
		
	}
	
	li{
		list-style-type:none;
	}
	.me{
		text-align : right;
		margin-right : 10px;
		border-radius: 10px;
	}
	.me img{
		width:60px;
		height:60px;
		border-radius: 30px;
	}
	
	.myChat{
		text-align:left;
		background-color : yellow;
		display:inline-block;
		max-width : 250px;  
		border-radius: 10px;
		padding:5px;
		word-wrap:break-word; 
		word-break:break-all;
	}
	
	.otherChat{
		display:inline-block;
		max-width : 250px;
		margin-left: 10px;
		background-color: white;
		color:black;
		border-radius: 10px;
		padding:5px;
		word-wrap:break-word; 
		word-break:break-all;
		
	}
	#otherChat img{
		width:60px;
		height:60px;
		border-radius: 30px;
		
	}
	#otherChat span{
		margin-left: 5px;
		font-size: 25px;
		displsy:flex;
		flex-wrap: wrap;
		height: 30px;
	}
	
	#partyInfoContainer{
		width : 500px;
		background-color:skyblue;
		position: relative;
		left:50%;
		bottom:500px;
		
	}
	#partyInfoContainer img{
		text-align:center;
		width : 350px;
		height : 450px;
	}
	#partyInfoContainer table{
		font-size: 21px;
	}
	#partyInfoContainer table tr td:last-child{
		padding-left: 10px;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
<a href="partyList">List화면으로 이동</a>
<div id="chat_container">
	<div class="chatWrap">
		<div class="content chatcontent">
			<div id="chatList">
				<c:forEach var="chat" items="${firstList}" >
					<!-- 내 채팅일 경우 -->
					<c:if test="${loginMember.MNum eq chat.MNum}">
						<li data-no="${chat.CNum}" class="me">
							<img src="upload/profile${loginMember.profileImageName}"/>
							<div class="me">
								<p class="myChat">${chat.content}</p> 
							</div>
						</li>
					</c:if>
					
					<!-- 다른사람의 채팅일 경우 -->
					<c:if test="${loginMember.MNum ne chat.MNum}">
						<li data-no="${chat.CNum}" id="otherChat">
							<c:forEach var="joinMember" items="${joinMemberList}">
								<c:if test="${chat.MNum eq joinMember.MNum}">
									<img src="upload/profile${joinMember.profileImageName}" /><span>${joinMember.MNick}</span>
								</c:if>
							</c:forEach>
							<div>
								<p class="otherChat">${chat.content}</p>
							</div> 
						</li>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="chat-fixK">
			<div class="fix_btn">
				<textarea name="msg" id="msgi" rows="3" ></textarea>
				<button type="button" id="sendBtn" class="send">보내기</button>
			</div>
		</div>
	</div>
</div>
<div id="partyInfoContainer">
	<table border="1">
		<tr>
			<th colspan="2">
				<img src="printPartyImage?fileName=${fn:replace(party.partyImage1, 's_', '')}"/>
			</th>
		</tr>
		<tr>
			<td>파티이름</td>
			<td>${party.PName}</td>
		</tr>
		<tr>
			<td>파티날짜</td>
			<td>${party.formatStartDate} ~ ${party.formatEndDate}</td>
		</tr>
		<tr>
			<td>파티장소</td>
			<td>${party.address}</td>
		</tr>
		<tr>
			<td>파티소개</td>
			<td>${party.PContext}</td>
		</tr>
	</table>
</div>
</body>
<script type="text/javascript">
	var client;
	function moveDown(){
		$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
	}
	
	$(document).ready(function() {
		//시작할때 스크롤 내리기
		$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
		var isEnd = false;
		var isScrolled = false;
		
		var renderList = function(vo) {
			var html = "";
			
			//내가 보낸 채팅일 경우
			if(vo.mNum =="${loginMember.MNum}"){
			html = 	"<li class='me' data-no='"+vo.cNum+"'>"
					+"<img src='printProfileImage?fileName=${loginMember.profileImageName}'/>"
					+"<div class='me'>"
					+ "<p class='myChat'>"+vo.content+"</p>"
					+"</div>"
					+ "</li>";
			}
			//남이 보낸 채팅일 경우
			else{
				html = "<li id='otherChat' data-no='"+vo.cNum+"'>"
					+ "<img src='printProfileImage?fileName="+vo.path+"'/><span>vo.MNick</span>"
					+"<div>"
					+ "<p class='otherChat'>"+vo.content+"</p>"
					+"</div>"
					+ "</li>";
			}
			return html;
		}
		
		$(function() {
			var messageInput = $('textarea[name="msg"]');
			var sock = new SockJS("echo");
			
			sock.onmessage = onMessage;
			sock.onclose = onClose;
			
			function sendmsg() {
				var message = messageInput.val();
				if (message == "") {
					return false;
				}
				sock.send(JSON.stringify({
					pNum : "${party.PNum}",
					mNum : "${loginMember.MNum}",
					content : message,
					path : "${loginMember.profileImageName}",
					nick : "${loginMember.MNick}"
				}));
						
				messageInput.val('');
			}
			
			function onMessage(msg){
				var chat = JSON.parse(msg.data);
				var html = renderList(chat);
				$("#chatList").append(html);
				moveDown();
			}
				
			$('.send').click(function() {
					sendmsg();
			}); 
			
			function onClose(e) {
				$("#messageArea").append("연결 끊김");
			}
		});
	});
	
	$("#msgi").keydown(function(event) {
	    if (event.which === 13) {
	        event.preventDefault();
	        $("#sendBtn").click();
	    }
	});
	
</script>
</html>















