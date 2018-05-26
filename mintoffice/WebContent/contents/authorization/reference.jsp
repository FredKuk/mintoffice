<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="margin: 5px; border: 1px solid; text-align: center;">
	<div
		style="margin: 10px; border: 1px solid; width: 45%; display: inline-block;">
		<div style="margin: 10px; display: inline-block;">직원 선택</div>
		<div class="form-group" style="display: inline; margin: 10px">
			<input type="text" class="form-control" placeholder="사용자 검색"
				id="inputDefault" style="width: 40%; display: inline;">
		</div>
		<button type="button" class="btn btn-info" style="margin: 10px;">검색</button>
		<div class="list-group" style="margin: 10px;">
			<a href="#" class="list-group-item list-group-item-action"> 기획팀
				임채환 직원 </a> <a href="#" class="list-group-item list-group-item-action">기획팀
				임채환 직원</a> <a href="#" class="list-group-item list-group-item-action">기획팀
				임채환 직원</a>
		</div>
	</div>
	<div
		style="margin: 10px; border: 1px solid; width: 40%; display: inline-block;">
		<div style="margin: 10px;">
			<div style="display: inline;">현 참조자</div>
			<div style="display: inline-block; float: right;">초기화</div>
		</div>
		<div class="list-group" style="margin: 10px; vertical-align: middle;">
			<a class="list-group-item list-group-item-action"> <select
				class="custom-select" style="width: 30%; float: left;">
					<option selected="">선택</option>
					<option value="1">검토</option>
					<option value="2">부재</option>
					<option value="3">결정</option>
			</select> &nbsp;&nbsp;기획팀 임채환 직원
				<div style="float: right; vertical-align: middle; float: right;">
					<i class="fas fa-trash-alt" style="width: 15px; height: auto;"></i>
				</div>
			</a> <a class="list-group-item list-group-item-action"> <select
				class="custom-select" style="width: 30%">
					<option selected="">선택</option>
					<option value="1">검토</option>
					<option value="2">부재</option>
					<option value="3">결정</option>
			</select> &nbsp;&nbsp;기획팀 임채환 직원
				<div style="float: right; vertical-align: middle;">
					<i class="fas fa-trash-alt" style="width: 15px; height: auto;"></i>
				</div>
			</a>
		</div>
	</div>
</div>
