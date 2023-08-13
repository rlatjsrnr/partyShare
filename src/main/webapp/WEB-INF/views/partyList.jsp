<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="realPath" value="${pageContext.request.contextPath}/upload/party/"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>Insert title here</title>
<style>
	#partyListContainer{
		width: 90%;
		margin-left: 10%;
	}

	#partys{
		display: flex;
   		flex-wrap: wrap;
	}
	
	#partys li{
		list-style:none;
		padding:10px;
		border:1px solid #ccc;
		width: 350px;
		height:300px;
		margin: 10px;
	}
	
	#partys li .partyImg{
		width: 200px;
		height: 200px;
	}
	#partys li .likeBtn{
		width: 40px;
		height: 40px;
		position: relative;
		left: 290px;
		bottom: 150px;
	}
	
	#pagination li{
		list-style: none;
		float:left;
		padding:3px;
		border:1px solid skyblue;
		margin: 3px;
	}
	#pagination li a{
		text-decoration: none;
		color:black;
	}
	
	#pagination li a.active{
		color:red;
	}
	
	#mapBtn{
		background-color: lightgrey;
		position: absolute;
		bottom: 50px;
		position: fixed;
		left:48%;
		border: 1px black solid;
	}
	#mapBtn a{
		color:black;
		text-decoration: none;
	}
	
</style>
</head>
<body>
<c:if test="${!empty message}">
	<script>
		alert('${message}');
	</script>
</c:if>
<!-- partyList 필요 -->
<a href="createName">파티등록</a><br/>
<a href="home">홈으로</a>
<div id="mapBtn">
	<a href="#">지도보기</a>
</div>
<hr/>


	<div id="partyListContainer">
		
		<ul id="partys">
		
		</ul>
	</div>
	
	
	<ul id="pagination">
	
	</ul>
	<script>
	
	var page = 1;
	
	listPage(page);
	
	function listPage(page){
		let url = "partyList/"+page;
		$.getJSON(url,function(data){
			// data == Map
			// {'list':{}, 'pm' : {}}
			console.log(data);
			printList(data.list);
			//printPage(data.pm);
		});
	}
	
	function printList(list){
		// #comments
		let str = "";
		$(list).each(function(){
			// PartyVO == this
			let pName = this.pname;
			let address = this.address;
			let date = this.formatStartDate +"~"+ this.formatEndDate;		
			let pNum = this.pnum;
			let path = this.partyImage1;
			let detailAddress = this.detailAddress;
			console.log(pName);
			console.log(pNum);
			console.log(path);
			str += "<li>";
			// wishList 받아서 fullHeart.png로 출력
			str += "<img src='resources/img/emptyHeart.png' class='likeBtn'/>"
			str += "<img src='upload/party/"+path+"' class='partyImg'/><br/>";
			str += "파티명 : "+pName+"<br/>";
			str += "주소 : "+address+" "+detailAddress+"<br/>";
			str += "날짜 : "+date;
			str += "</li>";
		});
		$("#partys").append(str);
	}
	// wishList
	$("#partys").on("click", "li .likeBtn", function(){
		let likeImg = $(this).attr("src");
		if(likeImg == 'resources/img/emptyHeart.png'){
			$(this).attr("src", "resources/img/fullHeart.png");
		}else{
			$(this).attr("src", "resources/img/emptyHeart.png");
		}
	});
	
	function printPage(pm){
		let str = "";
		if(pm.prev){
			str += "<li><a href='"+(pm.startPage-1)+"'> << </a></li>";
		}
		
		for(let i = pm.startPage; i<=pm.endPage; i++){
			if(pm.cri.page == i){
				str += "<li><a href='"+i+"' class='active'>"+i+"</a></li>";
			}else{
				str += "<li><a href='"+i+"'>"+i+"</a></li>";
			}
		}
		
		if(pm.next){
			str += "<li><a href='"+(pm.endPage+1)+"'> >> </a></li>";
		}
		
		
		$("#pagination").html(str);
	}
	
	$("#pagination").on("click", "li a",function(e){
		e.preventDefault();
		let commentPage = $(this).attr("href");
		page = commentPage;
		listPage(page);
	});
	
	// 무한 페이징
	$(window).scroll(function(){
		let dh = $(document).height();
		let wh = $(window).height();
		let wt = $(window).scrollTop();
			
		if((wt+wh) >= (dh - 10)){
			if($("#partys li").size() <= 1){
				return false;
			}
			page++;
			listPage(page);
		}	
	});
	</script>
</body>
</html>