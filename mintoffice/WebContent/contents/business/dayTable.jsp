<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.workTableAllDiv {
	max-width: 92%;
	max-height: 88%;
	width: 100%;
	margin-left: 30px;
	margin-top: 20px;
}

.workTimeTableHeader>th {
	background-color: #696969;
	color: white;
	height: 35px;
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

.workTimeTable td, th {
	width: 9%;
}

.workTableSearch {
	width: 70%;
}

.workTableSearch>form {
	width: 100%;
}

.workTableSearch>form * {
	width: 25%;
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

.arriveOk {
	color: #3333FF;
}

.arriveBad {
	color: orangered;
}

.dtYes {
	color: #FF6666;
}

.dtNo {
	color: #0080FF;
}
</style>
<div class="workTableAllDiv">
	<div>
		<h2>Day Commute Table</h2>
	</div>
	<div class="workTableHeader">
		<div class="workTableSearch">
			<form id='cdtForm'>
				<input type="date" name='ldDate' required>&emsp;~&emsp; <input
					type="date" name='rdDate' style="margin-left: 0px;" required>
				<input type="submit" class="btn btn-outline-primary btn-sm" style="margin-left:10px"	value="Submit">
			</form>
		</div>
	</div>
	<div class="workTimeTableSection" id='dtBody'></div>
</div>