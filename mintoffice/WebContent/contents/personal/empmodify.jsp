<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#empModify .table1 {
	border-collapse: collapse;
	vertical-align: middle;
	padding: 10px;
	width: 100%;
}

#empModify table>tbody>tr:hover {
	background: #CEF6E3;
}

#empModify div {
	display: inline-block;
	width: 100%;
	padding: 5px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

#empModify #total {
	margin: 30px;
}
</style>
</head>
<div id='empModify'>
	<div class="form-group" style="width: 250px; white-space: nowrap;">
		<label class="col-form-label" for="inputDefault">이름</label> <input
			type="text" class="form-control" placeholder="이름을 입력하세요"
			id="inputDefault">
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="form-group" style="width: 250px; white-space: nowrap;">
		<label class="col-form-label" for="inputDefault">아이디</label> <input
			type="text" class="form-control" placeholder="아이디를 입력하세요"
			id="inputDefault">
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="form-group" style="width: 150px; white-space: nowrap;">
		<label for="exampleSelect1">직급</label> <select class="form-control"
			id="exampleSelect1">
			<option>사원</option>
			<option>대리</option>
			<option>과장</option>
		</select>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="form-group" style="width: 150px; white-space: nowrap;">
		<label for="exampleSelect1">부서명</label> <select class="form-control"
			id="exampleSelect1">
			<option>개발부</option>
			<option>영업부</option>
			<option>회계부</option>
		</select>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="form-group" style="width: 200px; white-space: nowrap;">
		<fieldset>
			<label class="control-label" for="readOnlyInput">입사일</label> <input
				class="form-control" id="readOnlyInput" type="text"
				placeholder="날짜를 선택하세요" readonly="">
		</fieldset>
	</div>
	<button type="button" class="btn btn-info disabled"
		style="white-space: nowrap;">달력</button>
	<label class="menu" style="margin: 10px"> ~ </label>
	<div class="form-group" style="width: 200px; white-space: nowrap;">
		<fieldset>
			<label class="control-label" for="readOnlyInput">퇴사일</label> <input
				class="form-control" id="readOnlyInput" type="text"
				placeholder="날짜를 선택하세요" readonly="">
		</fieldset>
	</div>
	<button type="button" class="btn btn-info disabled"
		style="white-space: nowrap;">달력</button>
	<button type="button" class="btn btn-info" id="total">검색</button>


	<table id="emptb"
		style="margin-left: auto; margin-right: auto; width: 100%; height: 60%; overflow: auto">
		<thead style="height: 15%">
			<tr>
				<th>사번</th>

				<th>직급</th>
				<th>핸드폰번호</th>
				<th>성명</th>
				<th>Email</th>
				<th>부서</th>
				<th>입사일</th>
				<th>퇴사일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>사원</td>
				<td>01020263831</td>
				<th scope="row">이다은</th>
				<td>lde3831@gmail.com</td>
				<td>영업부</td>
				<td>2018-05-01</td>
				<td>2018-05-01</td>
			</tr>
			<tr>
				<td>1</td>
				<td>사원</td>
				<td>01020263831</td>
				<th scope="row">이다은</th>
				<td>lde3831@gmail.com</td>
				<td>영업부</td>
				<td>2018-05-01</td>
				<td>2018-05-01</td>
			</tr>
			<tr class="trclass">
				<td>1</td>
				<td>사원</td>
				<td>01020263831</td>
				<th scope="row">이다은</th>
				<td>lde3831@gmail.com</td>
				<td>영업부</td>
				<td>2018-05-01</td>
				<td>2018-05-01</td>
			</tr>
			<tr>
				<td>1</td>
				<td>사원</td>
				<td>01020263831</td>
				<th scope="row">이다은</th>
				<td>lde3831@gmail.com</td>
				<td>영업부</td>
				<td>2018-05-01</td>
				<td>2018-05-01</td>
			</tr>
			<tr class="trclass">
				<td>1</td>
				<td>사원</td>
				<td>01020263831</td>
				<th scope="row">이다은</th>
				<td>lde3831@gmail.com</td>
				<td>영업부</td>
				<td>2018-05-01</td>
				<td>2018-05-01</td>
			</tr>
			<tr>
				<td>1</td>
				<td>사원</td>
				<td>01020263831</td>
				<th scope="row">이다은</th>
				<td>lde3831@gmail.com</td>
				<td>영업부</td>
				<td>2018-05-01</td>
				<td>2018-05-01</td>
			</tr>
			<tr>
				<td>1</td>
				<td>사원</td>
				<td>01020263831</td>
				<th scope="row">이다은</th>
				<td>lde3831@gmail.com</td>
				<td>영업부</td>
				<td>2018-05-01</td>
				<td>2018-05-01</td>
			</tr>
			<tr>
				<td>1</td>
				<td>사원</td>
				<td>01020263831</td>
				<th scope="row">이다은</th>
				<td>lde3831@gmail.com</td>
				<td>영업부</td>
				<td>2018-05-01</td>
				<td>2018-05-01</td>
			</tr>

		</tbody>
	</table>
	<br>
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