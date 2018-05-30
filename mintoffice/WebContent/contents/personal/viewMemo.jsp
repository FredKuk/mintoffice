<%@page import="vo.PageBean"%>
<%@page import="vo.Memo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pb" value="${requestScope.pagebean}" />
<c:set var="list" value="${pb.list}" />
<script>
$(function() {
	pageNumber = 2; // 다음 페이지
	endNumber = ${pb.totalPage};// 마지막 페이징 셋팅 변수
	endPageNumber=0;
	if(endNumber>0){
		 endPageNumber=endNumber;
	}
});
</script>
<style>
.memo {
	margin-left: 30px;
	width: 94%;
}

.memoHeader {
	padding-top: 15px;
	box-sizing: content-box;
}

.memoHeader>h1 {
	padding-left: 15px;
	padding-bottom: 15px;
}

.memoHeader .card-body {
	padding: 5px;
	height: 106px;
}

.memoBody {
	box-sizing: content-box;
	margin-top: 2%;
}

.memoEach {
	margin-bottom: 3%;
}

.memoHeader .card-footer {
	padding-top: 6px;
	padding-bottom: 6px;
}

.memoBody .card-footer {
	padding-top: 6px;
	padding-bottom: 6px;
}
</style>
<div class="memo">
	<div class="memoHeader">
		<h1>Memo</h1>
		<form>
			<fieldset>
				<div class="card mb-3">
					<div class="card-body">
						<div class="form-group">
							<textarea class="form-control" name="memo_contents" rows="3" placeholder="take a note here" required></textarea>
						</div>
					</div>
					<div class="card-footer text-muted">
						<button type="submit" class="btn btn-outline-success btn-sm">submit</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>

	<div class="memoBody">
		<c:forEach items="${list}" var="memo">
			<div class="memoEach">
				<div class="card mb-3">
					<span style="display:none">${memo.memo_no}</span><h6 class="card-header">${memo.memo_date}</h6>
					<div class="card-body">
						<p class="card-text">${memo.memo_contents}</p>
						<textarea class="form-control" rows="3" cols="10" style="width:100%;display:none"></textarea>
					</div>
					<div class="card-footer text-muted">
						<button type="button" class="btn btn-outline-info btn-sm" id="memoSubBtn" style="display:none">modify</button>
						<button type="button" class="btn btn-outline-warning btn-sm" id="memoModBtn">modify</button>
						<button type="button" class="btn btn-outline-danger btn-sm" id="memoDelBtn">delete</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" id="memoCanBtn" style="display:none">cancel</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="modal" id="delMemoChk">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Check</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Do you really want to delete this memo?</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="delMemoBtn" class="btn btn-danger">Yes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        <span id='delMemoNo' style="display:none"></span>
      </div>
    </div>
  </div>
</div>