<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
<%String name = request.getParameter("searchName");
			if (name != null) {
				//input객체의 name에 대입%> 		$("input[name=searchName]").val("<%=name%>");
<%}
			String num = request.getParameter("searchNum");
			if (num != null) {%> 		$("input[name=searchNum]").val("<%=num%>");   
<%}
			String grade = request.getParameter("searchGrade");
			if (grade != null) {%>		$("select").val("<%=grade%>");
<%}
			String depart = request.getParameter("searchDepart");
			if (depart != null) {%>		$("select").val("<%=depart%>
	");
<%}%>
	$("#empInfoForm").submit(function() {
			alert('test');
			$.ajax({
				method : "post",
				data : $("form").serialize(),
				url : "empinfo.do",
				success : function(data) {
					if ($("section").length > 0) {
						$("section").empty();
						$("section").html(data.trim());
					} else {
						$("body").html(data.trim());
					}
				}
			});
			return false;
		});
	});
</script>

<style>
#empInfoForm .table1 {
	border-collapse: collapse;
	vertical-align: middle;
	padding: 10px;
	width: 100%;
}

.tbclass tbody>tr:hover {
	background: #CEF6E3;
}

#empInfoForm div {
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
<br>
<form method="post" id="empInfoForm">
	<div class="form-group" style="width: 250px; white-space: nowrap;">
		<label class="col-form-label" for="inputDefault">이름</label> <input
			type="text" class="form-control" name="searchName"
			placeholder="이름을 입력하세요" id="inputDefault">
	</div>
	<div class="form-group" style="width: 250px; white-space: nowrap;">
		<label class="col-form-label" for="inputDefault">사번</label> <input
			type="text" class="form-control" name="searchNum"
			placeholder="사번을 입력하세요" id="inputDefault">
	</div>
	<div class="form-group" style="width: 150px; white-space: nowrap;">
		<label for="exampleSelect1">직급</label> <select class="form-control"
			id="exampleSelect1" name="searchGrade">
			<option value="emp">사원</option>
			<option value="emp2">대리</option>
			<option value="emp3">과장</option>
		</select>
	</div>
	<div class="form-group" style="width: 150px; white-space: nowrap;">
		<label for="exampleSelect1">부서명</label> <select class="form-control"
			id="exampleSelect1" name="searchDepart">
			<option value="depart1">개발부</option>
			<option value="depart2">영업부</option>
			<option value="depart3">회계부</option>
		</select>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<button type="button" class="btn btn-info" id="total">검색</button>
</form>


<table class="tbclass"
	style="margin-left: auto; margin-right: auto; width: 100%; height: 80%; overflow: auto">
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
		<c:forEach items="${list}" var="emp">
			<tr>
				<td>${emp.emp_no}</td>
				<td>${emp.id}</td>
				<td>${emp.name}</td>
				<th scope="row">${emp.position_no}</th>
				<td>${emp.email}</td>
				<td>${emp.join_date}</td>
				<td>${emp.retire_date}</td>
				<td>${emp.msg}</td>
			</tr>
		</c:forEach>
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