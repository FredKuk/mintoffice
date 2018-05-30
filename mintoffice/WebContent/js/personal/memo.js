var pageNumber = 0; // 다음 페이지
var endNumber =-1;
var endPageNumber=-1;
$(function() {
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
	$(document).on('submit','.memoHeader>form', function() {
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
	$(document).on('click',('.memoEach button:nth-of-type(3)'),function(){
		$('#delMemoNo').val($(this).closest('div').siblings('span').text());
		$('#delMemoChk').modal();
		$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
		$('.modal-dialog').css('z-index', '1');
		$('.modal').css('top', '190px');
		return false;
	});
	
	$(document).on('click','#delMemoBtn',function(){
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