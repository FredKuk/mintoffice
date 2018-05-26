<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 12%;
}
.workTableSearch{
width:70%;
}

.workTableSearch>* {
	width: 22%;
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

input[type=date] {
	color: grey;
	font-size: 13px;
}

.workTablePagination {
	float: right;
}

.arriveOk{
	color:deepskyblue;
}
.arriveBad{
	color:orangered;
}
</style>
<div class="workTableAllDiv">
	<div>
		<h2>Day Commute Table</h2>
	</div>
	<div class="workTableHeader">
		<div class="workTableSearch">
			<input type="date">&emsp;~&emsp; <input type="date"
				style="margin-left: 0px;">
			<button type="button" class="btn btn-outline-primary btn-sm">Search</button>
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
					<th>초과시간</th>
					<th>외근시간</th>
					<th>복귀시간</th>
					<th>조퇴시간</th>
				</tr>
			</thead>
			<tbody>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>02:11:22</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveBad"><i class="fas fa-times"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>02:11:22</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>18:08:22</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>-</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>01:11:22</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveBad"><i class="fas fa-times"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td></td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>18:08:22</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>00:11:22</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveBad"><i class="fas fa-times"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td></td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td></td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>
				<tr class="workTimeContents">
					<td>2018-05-15</td>
					<td class="arriveOk"><i class="far fa-circle"></i></td>
					<td>08:55:42</td>
					<td>18:08:22</td>
					<td>05:00:24</td>
					<td>11:02:11</td>
					<td>16:52:22</td>
					<td>-</td>
				</tr>

			</tbody>
		</table>
	</div>
</div>