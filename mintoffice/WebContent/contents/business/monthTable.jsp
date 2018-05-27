<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(document).ready(function() {
	var workDaySum=0;
	var goodDaySum=0;
	var lateDaySum=0;
	var earlyDaySum=0;
	var sickDaySum=0;
	var overWorkSum=0;
	
	var month=0;
	var workDay=0;
	var goodDay=0;
	var lateDay=0;
	var earlyDay=0;
	var sickDay=0;
	var overWork=0;
	
	/* init */
	showmtYear();

	/* searching */
	$('#mtBtn').click(function(){
		showmtYear();
	});
	
	/* searching logic */
	function showmtYear(){
		$.ajax({
			url : 'showmtyear.do',
			data: {year:$('#mtSelect').val()},
			method : 'post',
			success : function(data) {
				$('#mtTbody').empty();
				$('#mtTfoot').empty();
				workDaySum=0;
				goodDaySum=0;
				lateDaySum=0;
				earlyDaySum=0;
				sickDaySum=0;
				overWorkSum=0;
				
				var jsonArrObj = JSON.parse(data);
				$(jsonArrObj).each(function(index, jsonObj) {
					month=jsonObj.month;
					workDay=jsonObj.workDay;
					goodDay=jsonObj.goodDay;
					lateDay=jsonObj.lateDay;
					earlyDay=jsonObj.earlyDay;
					sickDay=jsonObj.sickDay;
					overWork=jsonObj.overWork;
					
					workDaySum+=workDay;
					goodDaySum+=goodDay;
					lateDaySum+=lateDay;
					earlyDaySum+=earlyDay;
					sickDaySum+=sickDay;
					overWorkSum+=overWork;
					
					var gw=goodDay/workDay*100;
					var color="";
					if(gw>90){
						color="#6495ED";
					}else if(gw>75){
						color="#808000";
					}else{
						color="#FF4500";
					}
					
					$('#mtTbody').append('<tr class="monthWorkTimeContents">');
					$('#mtTbody').append('<td>'+month+'월</td>');
					$('#mtTbody').append('<td>'+workDay+'</td>');
					$('#mtTbody').append('<td>'+goodDay+'/'+workDay+'&nbsp;<span style="color:'+color+'">('+gw.toFixed(1)+'%)</span></td>');
					$('#mtTbody').append('<td>'+lateDay+'</td>');
					$('#mtTbody').append('<td>'+earlyDay+'</td>');
					$('#mtTbody').append('<td>'+sickDay+'</td>');
					$('#mtTbody').append('<td>'+overWork+'</td>');
					$('#mtTbody').append('</tr>');
				});
				var gwS=goodDaySum/workDaySum*100;
				var colorS="";
				if(gwS>90){
					colorS="#6495ED";
				}else if(gwS>75){
					colorS="#808000";
				}else{
					colorS="#FF4500";
				}
				$('#mtTfoot').append('<td> 1~12월 </td>');
				$('#mtTfoot').append('<td>'+workDaySum+'</td>');
				$('#mtTfoot').append('<td>'+goodDaySum+'/'+workDaySum+'&nbsp;<span style="color:'+colorS+'">('+gwS.toFixed(1)+'%)</td>');
				$('#mtTfoot').append('<td>'+lateDaySum+'</td>');
				$('#mtTfoot').append('<td>'+earlyDaySum+'</td>');
				$('#mtTfoot').append('<td>'+sickDaySum+'</td>');
				$('#mtTfoot').append('<td>'+overWorkSum+'</td>');
			}
		});
	}
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