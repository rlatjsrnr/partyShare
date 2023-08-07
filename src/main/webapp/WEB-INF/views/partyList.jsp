<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.partyContainer{
		border: 1px black solid;
		width: 300px;
		hidght : 400px;
		text-align: center;
		display: inline-block;
	}

	td img{
		width: 200px;
		height: 200px;
	}
</style>
</head>
<!-- partyList 필요 -->
<a href="createParty">파티등록</a><br/>
<hr/>
<body>
	
	<div id="partyContainer">
		<%-- <table>
			<tr>
				<td colspan="2"><img src="partyImage?pNum=${list.PNum}"/></td>
			</tr>
			<tr>
				<td>파티명 : </td>
				<td>${list.PName}</td>
			</tr>
			<tr>
				<td>주소 : </td>
				<td>${list.sido} ${list.sigungu} ${list.address}</td>
			</tr>
			<tr>
				<td>날짜 : </td>
				<td>${list.startDate} ~ ${list.endDate}</td>
			</tr>
		</table> --%>				
	</div>
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
			// printPage(data.pm);
		});
	}
	
	function printList(list){
		// #comments
		let str = "";
		$(list).each(function(){
			// PartyVO == this
			let pName = this.pName;
			let addr = this.sigungu;
			let date = this.startDate +"~"+ this.endDate;		
			let pNum = this.pNum;
			str += "<table>";
			str += "<tr><td colspan='2'><img src='partyImage?pNum='"+pNum+"/></td></tr>";
			str += "<tr><td>파티명 : </td><td>"+pName+"</td></tr>";
			str += "<tr><td>주소 : </td><td>"+addr+"</td></tr>";
			str += "<tr><td>날짜 : </td><td>"+date+"</td></tr>";
			str += "</table>";
		});
		// $("#comments").html(str);
		$("#partyContainer").append(str);
	}
	// 무한 페이징
	$(window).scroll(function(){
		let dh = $(document).height();
		let wh = $(window).height();
		let wt = $(window).scrollTop();
			
		if((wt+wh) >= (dh - 10)){
			if($("#partyContainer table tr").size() <= 1){
				return false;
			}
			page++;
			listPage(page);
		}	
	});
	</script>
</body>
</html>