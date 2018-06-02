<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.mintboard_header{
}

.mintBoard input{
	display:inline-block;
	line-height: 13px;
}


.mintBoard{
	padding:1%;
	width:100%;
	text-align:center;
}

.mintBoard tr{
	height:30px;
}

tr>th:nth-child(1){
	width:2%;
	background-color:lightblue;
}

tr>th:nth-child(2){
	width:5%;
	background-color:lightgreen;
}

tr>th:nth-child(3){
	width:61%;
	background-color:yellow;
}

tr>th:nth-child(4){
	width:10%;
	background-color:lightblue;
}

tr>th:nth-child(5){
	width:10%;
	background-color:pink;
}

tr>th:nth-child(6){
	background-color:lightgrey;
	width:5%;
}

</style>

<div class="mintBoard">
	<div class="form-group mintboard_header" style="white-space: nowrap;">
		<input type="text" class="form-control" placeholder="제목을 입력하세요" style="width:30%;float:left;margin-right:7px;">
		<input type="submit" class="btn btn-info" value="Search" style="float:left">	
		<input type="button" class="btn btn-outline-secondary pull-right" value="삭제" id = "noticeD"style="margin-left:7px;float:right;">
		<input type="button" class="btn btn-outline-primary pull-right" value="등록" id = "noticeW" style="float:right;">
	</div>
<br>
<br>
	<table class="table-striped table-hover tbclass mintboard" style="margin-left: auto; margin-right: auto; width: 100%; height: 75%; overflow: auto;">
		<thead style="height: 15%">
			<tr>
				<th><input type="checkbox" name="_selected_all_"></th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" name="_selected_"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
				<td>[1]</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="_selected_"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
				<td>[1]</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="_selected_"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
				<td>[1]</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="_selected_"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
				<td>[1]</td>
			</tr>
		</tbody>
	</table>
	<table style="width: 100%">
		<tr>
			<td></td>
			<td><div
					style="display: inline-block; width: 250px; padding: 10px; margin-left: auto; margin-right: auto; text-align: center;">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
						</li>
						<li class="page-item active"><a class="page-link" href="#">1</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">&raquo;</a>
						</li>
					</ul>
				</div></td>
			<td></td>
		</tr>
	</table>
</div>