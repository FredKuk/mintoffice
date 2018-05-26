<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(function() {
	$('#createdplinebtn').click(function() {
		$('#dplinemodal').modal();
		$(".modal-backdrop").remove();
	});
});
</script>
	<h2 style="margin: 20px;">결재 라인 목록</h2>

	<table class="table table-hover">
		<tr class="table-success">
			<td>순번</td>
			<td>결재 라인 명칭</td>
			<td></td>
		</tr>
		<tr>
			<td>1</td>
			<td>OO 프로젝트 결재 라인<br>
			[결재] 개발팀 임채환 사원<br>
			[결재] 개발팀 이하영 대리<br>
			[결재] 개발팀 한아연 팀장
			</td>
			<td style="vertical-align: middle;"><i class="fas fa-trash-alt" style="width: 20px; height: auto;"></i></td>
		</tr>
		<tr>
			<td>2</td>
			<td>★★ 발주 결재 라인</td>
		</tr>
		<tr>
			<td>3</td>
			<td>@@ 인사부 결재 라인</td>
		</tr>
		<tr>
			<td>4</td>
			<td>회식비 결재 라인</td>
		</tr>
		<tr>
			<td>5</td>
			<td>휴가계 결재 라인</td>
		</tr>
		<tr>
			<td>6</td>
			<td>$$ 구매 품의서 결재 라인</td>
		</tr>
		<tr>
			<td>7</td>
			<td>## 프로젝트 결재 라인</td>
		</tr>
		<tr>
			<td>8</td>
			<td>## 프로젝트 결재 라인</td>
		</tr>
		<tr>
			<td>9</td>
			<td>## 프로젝트 결재 라인</td>
		</tr>
	</table>
	<button type="button" class="btn btn-success" style="margin: 5px;" id="createdplinebtn">결재 라인 만들기</button>
	<button type="button" class="btn btn-outline-danger">삭제</button>
	
<div class="modal" id="dplinemodal">
	<div class="modal-dialog" role="document" style="max-width: 1000px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">결재자 선택</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<%@include file="/contents/authorization/dp.jsp" %>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Save</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>