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
	var pageNumber = 2; // 다음 페이지
	var endNumber = ${pb.totalPage};// 마지막 페이징 셋팅 변수
	var endPageNumber=0;
	if(endNumber>0){
		 endPageNumber=endNumber;
	}
	
	$(window).scroll(function() {
		var documentHeight = $(document).height(); // HTML document의 높이
		var scrollHeight = $(window).scrollTop() + $(window).height(); // 현재 스크롤의 값을 반환해주는 scrollTop() 과 브라우저 viewport의 높이 값을 더해서 scrollHeight를 구함
		if (scrollHeight == documentHeight){ // scroll의 높이와 HTML document의 높이가 같은지 확인
			if (pageNumber <= endPageNumber){ // 다음 페이징의 번호가 마지막 페이징 번호보다 높은지 검사
				$.ajax({
					method : 'POST',
					data : {nextpage : pageNumber},
					url : 'nextmemo.do',
					async:false,
					success : function(data) {
						pageNumber++;// pageNumber를 1만큼 증가시켜, Next 페이징 번호를 구함
						$('.memoBody').append(data);
					}
				});
			}
		}
		return false;
	});
	/* click submit button */
	$('.memoHeader>form').on('submit', function() {
		$.ajax({
			method : 'POST',
			data : $('.memoHeader>form').serialize(),
			url : 'addmemo.do',
			async:false,
			success : function(data) {
				data = data.trim();
				if (data == '1') { //modify memo success
					$('#memo').trigger('click');
				} else { //modify memo failed
					alert(data);
				}
			}
		});	
		return false;
	});
	/* click bluemodify buttton */
	/* $('.memoEach button:nth-of-type(1)').on('click',function(){ */
	$(document).on('click',('.memoEach button:nth-of-type(1)'),function(){
		$.ajax({
			method : 'POST',
			data : {memo_no:$(this).closest('div').siblings('span').text(),
					memo_contents : $(this).closest('div').siblings('.card-body').children('textarea').val()},
			url : 'modmemo.do',
			async:false,
			success : function(data) {
				data = data.trim();
				if (data == '1') { //modify memo success
					$('#memo').trigger('click');
				} else { //modify memo failed
					alert(data);
				}
			}
		})
		return false;
	});
	/* click modify buttton */
	/* $('.memoEach button:nth-of-type(2)').on('click',function(){ */
	$(document).on('click',('.memoEach button:nth-of-type(2)'),function(){
			$(this).css('display','none');
			$(this).siblings('button:nth-of-type(1)').css('display','initial');
			$(this).siblings('button:nth-of-type(4)').css('display','initial');
			$(this).closest('div').siblings('.card-body').children('p').css('display','none');
			var tempText=$(this).closest('div').siblings('.card-body').children('p').text();
			$(this).closest('div').siblings('.card-body').children('textarea').css('display','initial');
			$(this).closest('div').siblings('.card-body').children('textarea').val(tempText);
			$(this).closest('div').siblings('.card-body').css('padding','5');
			/* $(this).closest('div').siblings('.card-body').append('<textarea class="form-control" rows="3" cols="10" style="width:100%;display:initial">${memo.memo_contents}</textarea>'); */
			$(this).closest('div').siblings('.card-body').children('textarea').html(tempText);
			return false;
	});
	
	/* click delete button */
	/* $('.memoEach button:nth-of-type(3)').on('click',function(){ */
	$(document).on('click',('.memoEach button:nth-of-type(3)'),function(){
		$('#delMemoNo').val($(this).closest('div').siblings('span').text());
		$('#delMemoChk').modal();
		$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
		$('.modal-dialog').css('z-index', '1');
		$('.modal').css('top', '190px');
		return false;
	});
	
	$('#delMemoBtn').on('click',function(){
		$.ajax({
			method : 'POST',
			data : {memo_no:$('#delMemoNo').val()},
			url : 'delmemo.do',
			async:false,
			success : function(data) {
				data = data.trim();
				if (data == '1') {
					$('#delMemoChk').toggle();
					$('#memo').trigger('click');
				} else { //modify memo failed
					alert(data);
				}
			}
		});
		return false;
	});
	
	/* click cancel button */
	/* $('.memoEach button:nth-of-type(4)').on('click',function(){ */
	$(document).on('click',('.memoEach button:nth-of-type(4)'),function(){
		$(this).siblings('button:nth-of-type(1)').css('display','none');
		$(this).siblings('button:nth-of-type(2)').css('display','initial');
		$(this).closest('div').siblings('.card-body').css('padding','20');
		$(this).closest('div').siblings('.card-body').children('p').css('display','initial');
		$(this).closest('div').siblings('.card-body').children('textarea').val('');
		$(this).closest('div').siblings('.card-body').children('textarea').css('display','none');
		/* $(this).closest('div').siblings('.card-body').children('textarea').remove(); */
		$(this).css('display','none');
		return false;
	});
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