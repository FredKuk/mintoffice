<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('input[name=_selected_all_]').on('change', function() {
			$('input[name=_selected_]').prop('checked', this.checked);
		});

		$('#write').click(
				function() {
					window.open('writeboard.jsp', 'winzip',
							'width=580px height=580px');
				});
	});
</script>

<style>
#total {
	margin: 30px;
}
</style>
<br>
<select id="search">
	<option>전체쪽지</option>
	<option>받은쪽지</option>
	<option>보낸쪽지</option>
	<option>보관쪽지</option>
</select>
<select id="search2">
	<option>아이디</option>
	<option>내용</option>
</select>
<input id="msgsearch" placeholder="쪽지검색" style="width: 200px">
<button>검색</button>
&nbsp;&nbsp;&nbsp;
<label>단체쪽지</label>
<h5 style="display: inline">24/50</h5>
<hr>
<div style="float: right">
	<button>삭제</button>
	&nbsp;&nbsp;&nbsp;
	<button>보관</button>
	&nbsp;&nbsp;&nbsp;
	<button>답장</button>
	&nbsp;&nbsp;&nbsp; <label class="text-danger"
		style="text-decoration: underline;">안읽은쪽지</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>

<table
	style="margin-left: auto; margin-right: auto; width: 100%; height: 75%; overflow: auto; text-align: center;">
	<thead style="height: 15%">
		<tr>
			<th><input type="checkbox" name="_selected_all_"></th>
			<th>보낸사람</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="checkbox" name="_selected_" value="ROW_1"></td>
			<td>daeun</td>
			<td>안녕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
			<td>18-05-19[15:19]</td>
		</tr>
		<tr>
			<td scope="row"><input type="checkbox" name="_selected_"
				value="ROW_2"></td>
			<td>daeun</td>
			<td>안녕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
			<td>18-05-19[15:19]</td>
		</tr>
		<tr class="trclass">
			<td><input type="checkbox" name="_selected_" value="ROW_3"></td>
			<td>daeun</td>
			<td>안녕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
			<td>18-05-19[15:19]</td>
		</tr>
		<tr>
			<td scope="row"><input type="checkbox" name="_selected_"
				value="ROW_4"></td>
			<td>daeun</td>
			<td>안녕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
			<td>18-05-19[15:19]</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="_selected_" value="ROW_5"></td>
			<td>daeun</td>
			<td>안녕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
			<td>18-05-19[15:19]</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="_selected_" value="ROW_6"></td>
			<td>daeun</td>
			<td>안녕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
			<td>18-05-19[15:19]</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="_selected_" value="ROW_6"></td>
			<td>daeun</td>
			<td>안녕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
			<td>18-05-19[15:19]</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="_selected_" value="ROW_6"></td>
			<td>daeun</td>
			<td>안녕ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
			<td>18-05-19[15:19]</td>
		</tr>


	</tbody>
</table>

<table
	style="width: 100%; display: inline-block; width: 100%; padding: 5px; margin-left: auto; margin-right: auto; text-align: center;">
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
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