<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

</script>	

<style>
.monthWorkAll {
	max-width: 92%;
	max-height: 88%;
	margin-left: 30px;
	margin-top: 20px;
}

.monthWorkTableTop {
	margin-bottom: 12px;
}

.monthWorkTimeTableSection td, th {
	border: solid;
	border-width: 1px;
	border-color: #CDCDCD
}

.monthWorkTimeTableSection * {
	text-align: center;
}

.monthWorkTimeTable {
	margin-top: 1px;
	width: 100%;
}

.monthWorkTimeTable td{
	height: 30px;
}

.monthWorkTimeTable td, th {
	width: 12%;
}

.monthWorkTimeHead {
	margin-bottom: 10px;
}
.monthWorkTimeHead th{
	background-color:#696969;
	color:white;
	height:35px;
}
</style>
<div class="monthWorkAll">
	<div>
		<h2>Month Commute Table</h2>
		<p>문제가 있을 경우 <a href="#">sodfj39@naver.com</a> 으로 연락주시기 바랍니다.</p>
	</div>
	<div class="monthWorkTableTop">
		<select class="custom-select" style="width: 20%">
			<option selected>2018</option>
			<option>2017</option>
			<option>2016</option>
			<option>2015</option>
			<option>2014</option>
			<option>2013</option>
			<option>2012</option>
			<option>2011</option>
		</select>
		<button type="button" class="btn btn-outline-primary btn-sm" id = "mtBtn"style="width: 10%">Search</button>
	</div>
	<div class="monthWorkTimeTableSection">
		<table class="monthWorkTimeTable">
			<thead class="monthWorkTimeHead">
				<tr>
					<th>날짜</th>
					<th>업무일수</th>
					<th>근무일수</th>
					<th>정상출근일수</th>
					<th>지각일수</th>
					<th>조퇴일수</th>
					<th>초과근무시간</th>
				</tr>
			</thead>
			<tbody>
				<tr class="monthWorkTimeContents">
					<td>1</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td></td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>2</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td>3</td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>3</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td></td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>4</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td>3</td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>5</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td></td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>6</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td>1</td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>7</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td></td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>8</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td></td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>9</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td>3</td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>10</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td></td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>11</td>
					<td>154/132 (95%)</td>
					<td>113/125 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td>2</td>
				</tr>
				<tr class="monthWorkTimeContents">
					<td>12</td>
					<td>31/31 (95%)</td>
					<td>1/5 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td>1</td>
				</tr>
			</tbody>
			<tfoot class="monthWorkTimeHead">
				<tr>
					<th>총 날짜</th>
					<th>총 출근일수</th>
					<th>총 정상출근일수</th>
					<th>총 지각일수</th>
					<th>총 휴일출근일수</th>
					<th>총 초과근무시간</th>
					<th>총 조퇴일수</th>
				</tr>
				<tr>
					<td>132</td>
					<td>154 (95%)</td>
					<td>113 (91%)</td>
					<td>12</td>
					<td>5</td>
					<td>3</td>
					<td>10</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>