<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.mintboard_header{
}

.mintBoard input{
	display:inline-block;
	line-height: 14px;
}


.mintBoard{
	padding:1%;
	width:100%;
	text-align:center;
}

.mintBoard tr{
	height:30px;
}
#noticeBody tr>th{
	background-color:#6CDAB2;
	color:white;
}

#noticeBody tr>td{
	color:black;
}

#noticeBody tr>th:nth-child(1){
	width:2%;
	/* background-color:lightblue; */
}

#noticeBody tr>th:nth-child(2){
	width:5%;
	/* background-color:lightgreen; */
}

#noticeBody tr>th:nth-child(3){
	width:61%;
	/* background-color:yellow; */
}

#noticeBody tr>th:nth-child(4){
	width:10%;
	/* background-color:lightblue; */
}

#noticeBody tr>th:nth-child(5){
	width:10%;
	/* background-color:pink; */
}

#noticeBody tr>th:nth-child(6){
	/* background-color:lightgrey; */
	width:5%;
}

</style>
<div style="margin-left: 30px;margin-top: 20px;">
	<h2>Notice</h2>
</div>
<div id='boardSection'>
</div>
<div class="mintBoard">
	<div class="form-group mintboard_header" style="white-space: nowrap;">
		<input type="text" class="form-control" placeholder="제목을 입력하세요" value="" id='nsearchText' style="width:30%;float:left;margin-right:7px;">
		<input type="button" class="btn btn-outline-success" id="nsearchBtn" value="Search" style="float:left">	
		<input type="button" class="btn btn-outline-secondary" value="삭제" id = "noticeD"style="margin-left:7px;float:right;">
		<input type="button" class="btn btn-outline-info" value="등록" id = "noticeW" style="float:right;">
	</div>
	<br>
	<br>
	<div id='noticeBody'>
	</div>
</div>