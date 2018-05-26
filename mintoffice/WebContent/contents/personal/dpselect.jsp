<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#dpSelect .table1 {
	border-collapse: collapse;
	vertical-align: middle;
	padding: 10px;
	width: 100%;
}

#dpSelect table>tbody>tr:hover {
	background: #CEF6E3;
}

#dpSelect div {
	display: inline-block;
	width: 100%;
	padding: 5px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

#total {
	margin: 30px;
}
</style>
<div id="dpSelect">
	<div class="form-group" style="width: 150px; white-space: nowrap;">
		<label for="exampleSelect1">구분</label> <select class="form-control"
			id="exampleSelect1">
			<option>결재중</option>
			<option>완료</option>
			<option>반송</option>
		</select>
	</div>
	<div class="form-group" style="width: 150px; white-space: nowrap;">
		<label for="exampleSelect1">문서종류</label> <select class="form-control"
			id="exampleSelect1">
			<option>결재중</option>
			<option>완료</option>
			<option>반송</option>
		</select>
	</div>
	<div class="form-group" style="width: 150px; white-space: nowrap;">
		<label for="exampleSelect1">부서명</label> <select class="form-control"
			id="exampleSelect1">
			<option>1</option>
			<option>2</option>
			<option>3</option>
		</select>
	</div>
	<div class="form-group" style="width: 250px; white-space: nowrap;">
		<label class="col-form-label" for="inputDefault">제목</label> <input
			type="text" class="form-control" placeholder="제목을 입력하세요"
			id="inputDefault">
	</div>
	<div class="form-group" style="width: 250px; white-space: nowrap;">
		<label class="col-form-label" for="inputDefault">문서번호</label> <input
			type="text" class="form-control" placeholder="문서번호를 입력하세요"
			id="inputDefault">
	</div>

	<div class="form-group" style="width: 250px; white-space: nowrap;">
		<label class="col-form-label" for="inputDefault">기안자</label> <input
			type="text" class="form-control" placeholder="기안자를 입력하세요"
			id="inputDefault">
	</div>
	<div class="form-group" style="width: 200px; white-space: nowrap;">
		<fieldset>
			<label class="control-label" for="readOnlyInput">결재완료일</label> <input
				class="form-control" id="readOnlyInput" type="text"
				placeholder="날짜를 선택하세요" readonly="">
		</fieldset>
	</div>
	<button type="button" class="btn btn-info disabled"
		style="white-space: nowrap;">달력</button>
	<label class="menu" style="margin: 10px"> ~ </label>
	<div class="form-group" style="width: 200px; white-space: nowrap;">
		<fieldset>
			<label class="control-label" for="readOnlyInput">결재완료일</label> <input
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
				<th>문서번호</th>
				<th>제목</th>
				<th>상태</th>
				<th>기안자</th>
				<th>결재완료일</th>
				<th>종류</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>77</th>
				<td>근태계</td>
				<td>결재중</td>
				<td>이다은</td>
				<td>2018-05-01</td>
				<td>기타</td>
			</tr>
			<tr>
				<th scope="row">77</th>
				<td>근태계</td>
				<td>결재중</td>
				<td>이다은</td>
				<td>2018-05-01</td>
				<td>기타</td>
			</tr>
			<tr class="trclass">
				<th>77</th>
				<td>근태계</td>
				<td>결재중</td>
				<td>이다은</td>
				<td>2018-05-01</td>
				<td>기타</td>
			</tr>
			<tr>
				<th scope="row">77</th>
				<td>근태계</td>
				<td>결재중</td>
				<td>이다은</td>
				<td>2018-05-01</td>
				<td>기타</td>
			</tr>
			<tr class="trclass">
				<th>77</th>
				<td>근태계</td>
				<td>결재중</td>
				<td>이다은</td>
				<td>2018-05-01</td>
				<td>기타</td>
			</tr>
			<tr>
				<th>77</th>
				<td>근태계</td>
				<td>결재중</td>
				<td>이다은</td>
				<td>2018-05-01</td>
				<td>기타</td>
			</tr>
			<tr>
				<th>77</th>
				<td>근태계</td>
				<td>결재중</td>
				<td>이다은</td>
				<td>2018-05-01</td>
				<td>기타</td>
			</tr>
			<tr>
				<th>77</th>
				<td>근태계</td>
				<td>결재중</td>
				<td>이다은</td>
				<td>2018-05-01</td>
				<td>기타</td>
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