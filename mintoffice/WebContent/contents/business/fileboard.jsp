<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('input[name=_selected_all_]').on('change', function() {
			$('input[name=_selected_]').prop('checked', this.checked);
		});

		$('#write').click(
				function() {
					window.open('contents/business/writeboard.jsp', 'winzip',
							'width=580px height=580px');
				});
	});
</script>

<style>
#fileBoardDiv .table1 {
	border-collapse: collapse;
	vertical-align: middle;
	padding: 10px;
	width: 100%;
}

#fileBoardDiv>#fileBoardBodyTable>tbody>tr:hover {
	background: #CEF6E3;
}

#fileBoardDiv div {
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
<div id="fileBoardDiv">
	<br>
	<div class="form-group" style="width: 250px; white-space: nowrap;">
		<label class="col-form-label" for="inputDefault">제목</label> <input
			type="text" class="form-control" placeholder="제목을 입력하세요"
			id="inputDefault">
	</div>
	<div class="form-group" style="width: 200px; white-space: nowrap;">
		<fieldset>
			<label class="control-label" for="readOnlyInput">등록일</label> <input
				class="form-control" id="readOnlyInput" type="text"
				placeholder="날짜를 선택하세요" readonly>
		</fieldset>
	</div>
	<button type="button" class="btn btn-info disabled"
		style="white-space: nowrap;">달력</button>
	<button type="button" class="btn btn-info" id="total">검색</button>


	<table class="tbclass" id="fileBoardBodyTable" style="margin-left: auto; margin-right: auto; width: 100%; height: 75%; overflow: auto;">
		<thead style="height: 15%">
			<tr>
				<th><input type="checkbox" name="_selected_all_"></th>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>파일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" name="_selected_" value="ROW_1"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
			</tr>
			<tr>
				<td scope="row"><input type="checkbox" name="_selected_"
					value="ROW_2"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
			</tr>
			<tr class="trclass">
				<td><input type="checkbox" name="_selected_" value="ROW_3"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
			</tr>
			<tr>
				<td scope="row"><input type="checkbox" name="_selected_"
					value="ROW_4"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="_selected_" value="ROW_5"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="_selected_" value="ROW_6"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="_selected_" value="ROW_6"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="_selected_" value="ROW_6"></td>
				<td>78</td>
				<td>발주서</td>
				<td>2018/06/01</td>
				<td>[1]</td>
			</tr>
		</tbody>
	</table>
	<button type="button" style="margin: 10px; float: right"
		class="btn btn-outline-secondary">삭제</button>
	<input type="button" class="btn btn-outline-primary" id="write"
		value="등록" style="margin: 10px; float: right"> <br>
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