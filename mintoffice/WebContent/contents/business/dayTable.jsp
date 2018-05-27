<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
$(function(){
	$('#cdtForm').submit(function(){
		$.ajax({
			method:'POST',
			url: 'showcdt.do',
			data:$('#cdtForm').serialize(),
			success: function(data){
				$('#dtBody').empty();
				$('#dtBody').append(data);
				console.log('success');
			}
		});
		return false;
	});
});
</script>

<style>
.workTableAllDiv{
	max-width: 92%;
	max-height: 88%;
	width: 100%;
	margin-left: 30px;
	margin-top: 20px;
}

.workTimeTableHeader>th {
	background-color:#696969;
	color:white;
	height:35px;
}

.workTimeTableSection td, th {
	border: solid;
	border-width: 1px;
	border-color: #CDCDCD
}

.workTimeTableSection * {
	text-align: center;
}

.workTimeTable {
	margin-top: 1px;
	width: 100%;
}

.workTimeTable td,th {
	width: 9%;
}
.workTableSearch{
width:70%;
}
.workTableSearch>form{
width:100%;
}
.workTableSearch>form * {
	width: 17%;
	height: 30px;
	margin-bottom: 2px;
	text-align: center;
}

.workTableHeader {
	margin-bottom: 7px;
}

.workTableHeader * {
	display: inline-block;
}

#cdtForm>input[type=date] {
	color: grey;
	font-size: 13px;
}

.workTablePagination {
	float: right;
}

.arriveOk{
	color:#3333FF;
}
.arriveBad{
	color:orangered;
}

.dtYes{
	color:#FF6666;
}
.dtNo{
	color:#0080FF;
}
</style>
<div class="workTableAllDiv">
	<div>
		<h2>Day Commute Table</h2>
	</div>
	<div class="workTableHeader">
		<div class="workTableSearch">
			<form id='cdtForm'>
				<input type="date" name='ldDate' required>&emsp;~&emsp; <input type="date" name='rdDate'style="margin-left: 0px;" required>
				<input type="submit" class="btn btn-outline-primary btn-sm" value="Submit">
			</form>
		</div>
		<div class="workTablePagination">
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
		</div>
	</div>
	<div class="workTimeTableSection">
		<table class="workTimeTable">
			<thead>
				<tr class="workTimeTableHeader">
					<th>날짜</th>
					<th>정상출근</th>
					<th>출근시간</th>
					<th>퇴근시간</th>
					<th>야근시간</th>
					<th>외근시간</th>
					<th>복귀시간</th>
					<th>병가여부</th>
					<th>조퇴여부</th>
				</tr>
			</thead>
			<tbody id='dtBody'>
			</tbody>
		</table>
	</div>
</div>