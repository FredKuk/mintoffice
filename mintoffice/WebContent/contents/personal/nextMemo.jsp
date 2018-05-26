<%@page import="vo.PageBean"%>
<%@page import="vo.Memo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pb" value="${requestScope.pagebean}" />
<c:set var="list" value="${pb.list}" />
<!--
<script>
$(function(){
	$('.memoEach button:nth-of-type(1)').on('click',function(){
	/* $(document).on('click',('.memoEach button:nth-of-type(1)'),function(){ */
		$.ajax({
			method : 'POST',
			data : {memo_no:$(this).closest('div').siblings('span').text(),
					memo_contents : $(this).closest('div').siblings('.card-body').children('textarea').val()},
			url : 'modmemo.do',
			success : function(data) {
				data = data.trim();
				if (data == '1') { //modify memo success
				} else { //modify memo failed
					alert(data);
				}
			}
		});
		/* modlimit=0; */
		pageNumber = 2;
		$('#memo').trigger('click');
	});
	/* click modify buttton */
	$('.memoEach button:nth-of-type(2)').on('click',function(){
		/* if(modlimit!=1){ */
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
			/* modlimit=1;} */
	});
	
	/* click cancel button */
	$('.memoEach button:nth-of-type(4)').on('click',function(){
		/* modlimit=0; */
		$(this).siblings('button:nth-of-type(1)').css('display','none');
		$(this).siblings('button:nth-of-type(2)').css('display','initial');
		$(this).closest('div').siblings('.card-body').css('padding','20');
		$(this).closest('div').siblings('.card-body').children('p').css('display','initial');
		$(this).closest('div').siblings('.card-body').children('textarea').val('');
		$(this).closest('div').siblings('.card-body').children('textarea').css('display','none');
		/* $(this).closest('div').siblings('.card-body').children('textarea').remove(); */
		$(this).css('display','none');
	});
});
</script>
-->


<c:forEach items="${list}" var="memo">
	<div class="memoEach">
		<div class="card mb-3">
			<span style="display: none">${memo.memo_no}</span>
			<h6 class="card-header">${memo.memo_date}</h6>
			<div class="card-body">
				<p class="card-text">${memo.memo_contents}</p>
				<textarea class="form-control" rows="3" cols="10"
					style="width: 100%; display: none"></textarea>
			</div>
			<div class="card-footer text-muted">
				<button type="button" class="btn btn-outline-info btn-sm"
					id="memoSubBtn" style="display: none">modify</button>
				<button type="button" class="btn btn-outline-warning btn-sm"
					id="memoModBtn">modify</button>
				<button type="button" class="btn btn-outline-danger btn-sm"
					id="memoDelBtn">delete</button>
				<button type="button" class="btn btn-outline-secondary btn-sm"
					id="memoCanBtn" style="display: none">cancel</button>
			</div>
		</div>
	</div>
</c:forEach>