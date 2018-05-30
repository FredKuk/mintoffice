<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(document).ready(function() {
	workDaySum=0;
	goodDaySum=0;
	lateDaySum=0;
	earlyDaySum=0;
	sickDaySum=0;
	overWorkSum=0;
	month=0;
	workDay=0;
	goodDay=0;
	lateDay=0;
	earlyDay=0;
	sickDay=0;
	overWork=0;
});
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

.monthWorkTimeTable td {
	height: 30px;
}

.monthWorkTimeTable td, th {
	width: 12%;
}

.monthWorkTimeHead {
	margin-bottom: 10px;
}

.monthWorkTimeHead th {
	background-color: #696969;
	color: white;
	height: 35px;
}
</style>
<div class="monthWorkAll">
	<div>
		<h2>Month Commute Table</h2>
		<p>
			문제가 있을 경우 <a href="#">sodfj39@naver.com</a> 으로 연락주시기 바랍니다.
		</p>
	</div>
	<div class="monthWorkTableTop">
		<select class="custom-select" id='mtSelect' style="width: 20%">
			<option selected>2018</option>
			<option>2017</option>
			<option>2016</option>
			<option>2015</option>
			<option>2014</option>
			<option>2013</option>
			<option>2012</option>
			<option>2011</option>
		</select>
		<button type="button" class="btn btn-outline-primary btn-sm" id="mtBtn" style="width: 10%">Search</button>
	</div>
	<div class="monthWorkTimeTableSection">
		<table class="monthWorkTimeTable">
			<thead class="monthWorkTimeHead">
				<tr>
					<th>날짜</th>
					<th>근무일수</th>
					<th>정상근무일수</th>
					<th>지각일수</th>
					<th>조퇴일수</th>
					<th>병가일수</th>
					<th>야근시간</th>
				</tr>
			</thead>
			<tbody id='mtTbody'>
			</tbody>
			<tfoot class="monthWorkTimeHead">
				<tr>
					<th>합계</th>
					<th>근무일수</th>
					<th>정상근무일수</th>
					<th>지각일수</th>
					<th>조퇴일수</th>
					<th>병가일수</th>
					<th>야근시간</th>
				</tr>
				<tr id='mtTfoot'>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<script>