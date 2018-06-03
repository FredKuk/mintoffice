var pageN=0;
var nsearch="";
$(function() {	
	$(document).on("click", "#noticeW", function() {
		$.ajax({
			method : 'POST',
			url : 'noticewrite.do',
			success : function(data) {
				$('section').empty();
				$('section').html(data);
			}
		});
	});
	
	$(document).on('click','.mintboard>tbody a',function(){
		var $clicks=$(this).parent('td').siblings('.boardclicks');
		$clicks.text(parseInt($clicks.text())+1);
		console.log("OK!");
		$.ajax({
			method : 'POST',
			url : 'noticeDetail.do',
			data:{noti_no:$(this).find('span').text()},
			success : function(data) {
				if (data.trim() != '-1') { //insert Notice success
					$('#boardSection').empty();
					$('#boardSection').html(data);
				} else { //insert Notice failed
					alert(data);
				}
			}
		});
		return false;
		
	});
	
	/*새 공지사항 추가*/
	$(document).on("submit", "#noticeForm", function() {
		$.ajax({
			method : 'POST',
			url : 'noticeNew.do',
			data:$('#noticeForm').serialize(),
			success : function(data) {
				if (data.trim() == '1') { //insert Notice success
					$('#noticeboard').trigger('click');
				} else { //insert Notice failed
					alert(data);
				}
			}
		});
		return false;
	});
	
	/*공지사항 수정*/
	$(document).on("submit", "#noticemodForm", function() {
		$.ajax({
			method : 'POST',
			url : 'noticemod.do',
			data:$('#noticemodForm').serialize(),
			success : function(data) {
				if (data.trim() == '1') { //insert Notice success
					$('#noticeboard').trigger('click');
				} else { //insert Notice failed
					alert(data);
				}
			}
		});
		return false;
	});
	
	$(document).on('click','.nPageNum',function(){
		$('#boardSection').empty();
		showNotice($(this).text());
	});
	
	$(document).on('click','#nLaquo',function(){
		$('#boardSection').empty();
		showNotice(parseInt(pageN)-1);
	});
	
	$(document).on('click','#nRaquo',function(){
		$('#boardSection').empty();
		showNotice(parseInt(pageN)+1);
	});
	
	$(document).on('click','#noticeWModBtn',function(){
		$('#noticemodForm input[name=title]').removeAttr('readonly');
		$('#noticemodForm textarea[name=contents]').removeAttr('readonly');
		$(this).css('display','none');
		$('#noticeWModBtnIn').css('display','initial');
		//$('#noticeWDelBtn').css('display','initial');
	});
	
	$(document).on('click','#noticeWDelBtn',function(){
		$.ajax({
			method : 'POST',
			url : 'noticedel.do',
			data:{no:$('#noticeWModNo').val()},
			success : function(data) {
				if (data.trim() == '1') { //insert Notice success
					$('#noticeboard').trigger('click');
				} else { //insert Notice failed
					alert(data);
				}
			}
		});
	})
	
	$(document).on('click','#noticeWCanBtn',function(){
		$('#boardSection').empty();
	});
	
	/*검색버튼 클릭*/
	$(document).on('click','#nsearchBtn',function(){
		if($('#nsearchText').val()==""){
			nsearch="";
			showNotice(1);
		}else{
			nsearch=$('#nsearchText').val();
			console.log('nsearch : '+nsearch);
			showNoticeSearch(1,nsearch);
		}
	});
});

/*검색어 없을떄*/
function showNotice(pageNum){
	if(nsearch==""){
		pageN=pageNum;
		$.ajax({
			method : 'POST',
			url : 'showNotice.do',
			data : {
				page : pageNum
			},
			success : function(data) {
				$('#noticeBody').empty();
				$('#noticeBody').html(data);
			}
		});
	}else{
		pageN=pageNum;
		showNoticeSearch(pageNum,nsearch);
	}
}

/*검색어 있을떄*/
function showNoticeSearch(pageNum,searchTxt){
	if(nsearch==""){
		showNotice(1);
	}else{
		$.ajax({
			method : 'POST',
			url : 'shownsearch.do',
			data : {
				page : pageNum,
				search : searchTxt
			},
			success : function(data) {
				$('#boardSection').empty();
				$('#noticeBody').empty();
				$('#noticeBody').html(data);
			}
		});
	}
}
