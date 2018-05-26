<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('#dplinebtn').click(function() {
			$('#dplinemodal').modal();
			$(".modal-backdrop").remove();
		});
		$('#referencebtn').click(function() {
			$('#referencemodal').modal();
			$(".modal-backdrop").remove();
		});
	});
</script>
<style>
.table th, .table td {
	border-top: 3px solid rgba(0, 0, 0, 0.05);
}
</style>
<h2 style="margin: 10px;">보고서 작성</h2>
<blockquote class="blockquote text-right">
	<button type="submit" class="btn btn-primary" style="margin: 10px;">Submit</button>
</blockquote>
<br>
<form>
	<table class="table table-hover">
		<tr>
			<td>작성 날짜</td>
			<td>
				<div class="form-group">
					<fieldset>
						<input class="form-control" id="readOnlyInput" type="text"
							placeholder="2018-05-08" readonly="" style="width: 30%;">
					</fieldset>
				</div>
			</td>
		</tr>
		<tr>
			<td>기안 일자</td>
			<td>
				<button type="button" class="btn btn-info">날짜</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<label>2018-05-23</label>
			</td>
		</tr>

		<tr class="table-light">
			<td>제목</td>
			<td>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Default input"
						id="inputDefault">
				</div>
			</td>
		</tr>
		<tr class="table-light">
			<td>결재자</td>
			<td><input class="form-control" id="readOnlyInput" type="text"
				placeholder="임채환, 송강현, 박성민" readonly=""
				style='width: 20%; display: inline;'>
				<button type="button" id="dplinebtn" class="btn btn-outline-info">Search</button>
				</td>
		</tr>
		<tr class="table-light">
			<td>참조자</td>
			<td><input class="form-control" id="readOnlyInput" type="text"
				placeholder="임채환, 송강현, 박성민" readonly=""
				style='width: 20%; display: inline;'>
				<button type="button" class="btn btn-outline-info" id="referencebtn">Search</button>
			</td>
		</tr>
		<tr class="table-light">
			<td>구분</td>
			<td>
				<div class="form-group">
					<fieldset>
						<input class="form-control" id="readOnlyInput" type="text"
							placeholder="기안서" readonly="" style="width: 20%;">
					</fieldset>
				</div>
			</td>
		</tr>
		<tr class="table-light">
			<td>전표 또는 그외 첨부</td>
			<td>
				<div class="form-group">
					<input type="file" class="form-control-file" id="exampleInputFile"
						aria-describedby="fileHelp"> <small id="fileHelp"
						class="form-text text-muted"> </small>
				</div>
			</td>
		</tr>
		<tr class="table-light">
			<td colspan="2" id="smarteditor">
			</td>
		</tr>

		</tbody>
	</table>
</form>

<textarea name="ir1" id="ir1" rows="10" cols="100">내용을 작성해주세요.</textarea>
<script type="text/javascript">
var oEditors = [];
window.addEventListener("load", function(){
  nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "../se2/SmartEditor2Skin.html",
    
    fCreator: "createSEditor2"
  });
  
});
</script>

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

<div class="modal" id="referencemodal">
	<div class="modal-dialog" role="document" style="max-width: 1000px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">참조자 선택</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<%@include file="/contents/authorization/reference.jsp" %>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Save</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>