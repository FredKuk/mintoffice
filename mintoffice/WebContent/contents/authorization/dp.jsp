<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.im * {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
}
.wrap {
min-height: 100%;
position: relative;
padding-bottom: 19px; /* footer height */
}
</style>
<div style="max-height:88%; text-align: center;" class="im">
	<div style="margin: 5px; border: 1px solid" >
		<div style="margin: 10px; border: 1px solid; padding: 10px;">
			<h4 style="display: inline;">결제선 저장</h4>
			&nbsp;&nbsp;&nbsp;
			<div class="form-group" style="display: inline;">
				<input type="text" class="form-control" placeholder="결재선 이름 저장"
					id="inputDefault" style="width: 25%; display: inline;">
			</div>
			<button type="button" class="btn btn-info">저장</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<h4 style="display: inline;">결재선 목록</h4>
			&nbsp;&nbsp;&nbsp;
			<div class="form-group" style="display: inline;">
				<select class="custom-select" style="width: 20%">
					<option selected="">---저장 결재선---</option>
					<option value="1">OO 프로젝트 결재</option>
					<option value="2">★★ 발주서 결재</option>
					<option value="3">2분기 인사이동 기안서 결재</option>
				</select>
			</div>
		</div>
		<div style="margin:10px; border: 1px solid; width: 40%; display: inline-block; ">
			<div style="margin: 10px; display: inline-block;">직원 선택</div>
			<div class="form-group" style="display: inline; margin: 10px">
				<input type="text" class="form-control" placeholder="사용자 검색"
					id="inputDefault" style="width: 40%; display: inline;">
			</div>
			<button type="button" class="btn btn-info" style="margin: 10px;">검색</button>
			<div class="list-group" style="margin: 10px; text-align: center;">
				<a href="#" class="list-group-item list-group-item-action">
				기획팀 임채환 직원 
				</a>
				<a href="#" class="list-group-item list-group-item-action">기획팀 임채환 직원</a> 
				<a href="#" class="list-group-item list-group-item-action">기획팀 임채환 직원</a>
			</div>
		</div>
		<div
			style="margin: 10px; border: 1px solid; width: 40%; display: inline-block;">
			<div style="margin: 10px;">
				<div style="display: inline;">현 결재선</div>
				<div style="display: inline-block; float: right;">초기화</div>
			</div>
			<div class="list-group" style="margin: 10px; vertical-align: middle;">
				<a class="list-group-item list-group-item-action"> 
				<select class="custom-select" style="width: 30%; float: left;">
						<option selected="">선택</option>
						<option value="1">검토</option>
						<option value="2">부재</option>
						<option value="3">결정</option>
				</select> &nbsp;&nbsp;기획팀 임채환 직원
				<div style="float: right;">
					<i class="fas fa-trash-alt" style=" width: 15px; height: auto;"></i>
				</div>
				</a>
			</div>
		</div>
	</div>
</div>