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
		var $noti_no=$(this).find('span').text();
		$clicks.text(parseInt($clicks.text())+1);
		showNoticeDetail($noti_no);
		return false;		
	});
	
	/*새 댓글 추가*/
	$(document).on("submit", "#newNReplyForm", function() {
		newNoticeReply($('#nReplyTextarea').val());
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
	
	/*댓글 버튼 클릭*/
	$(document).on('click','.replyBtnDiv>button',function(){
		if($(this).text()=='submit'){
			var nr_no=$(this).siblings('input[type="text"]').val();
		/*	console.log('text : '+$(this).parent().siblings('textarea').text());
			console.log('text : '+$(this).parent().siblings('textarea').val());
			console.log('text : '+$(this).parent().siblings('textarea').html());
			console.log('text : '+$(this).parent().siblings('.form-control').text());
			console.log('text : '+$(this).parent().siblings('.form-control').val());
			console.log('text : '+$(this).parent().siblings('.form-control').html());*/
			modNoticeReply(nr_no,$(this).parent().siblings('textarea').val());
		}else if($(this).text()=='modify'){
			$(this).parent('.replyBtnDiv').siblings('.text-primary').css('display','none');
			$(this).parent('.replyBtnDiv').siblings('.form-control').css('display','initial');
			$(this).siblings('button:nth-of-type(1)').css('display','initial');
			$(this).css('display','none');
			$(this).siblings('button:nth-of-type(3)').css('display','none');
			$(this).siblings('button:nth-of-type(4)').css('display','initial');
		}else if($(this).text()=='delete'){
			var nr_no=$(this).siblings('input[type="text"]').val();
			delNoticeReply(nr_no)
		}else if($(this).text()=='cancel'){
			var notiNo=$('#noticeWModNo').val();
			showNoticeDetail(notiNo);
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

function showNoticeDetail(notiNo){
	$.ajax({
		method : 'POST',
		url : 'noticeDetail.do',
		data:{noti_no:notiNo},
		success : function(data) {
			if (data.trim() != '-1') { //insert Notice success
				$('#boardSection').empty();
				$('#boardSection').html(data);
				console.log("start to access reply");
				showNoticeReply();
			} else { //insert Notice failed
				alert(data);
			}
		}
	});
}

function showNoticeReply(){
	var notiNo=$('#noticeWModNo').val();
	$.ajax({
		method:'POST',
		url:'shownreply.do',
		data:{noti_no:notiNo},
		success : function(data){
			$('#nReplyBody').empty();
			$('#nReplyBody').html(data);
		}
	});	
}

function newNoticeReply(nrContents){
	var notiNo=$('#noticeWModNo').val();
	$.ajax({
		method:'POST',
		url:'nnewreply.do',
		data:{
			noti_no:notiNo,
			contents:nrContents
			},
		success : function(data){
			data=data.trim();
			if(data=='-1'){
				alert("Sorry. Try again please.");
			}else{
				showNoticeDetail(notiNo);
			}
		}
	});		
}

function modNoticeReply(nrNo,nrContents){
	var notiNo=$('#noticeWModNo').val();
	$.ajax({
		method:'POST',
		url:'nmodreply.do',
		data:{
			nr_no:nrNo,
			contents:nrContents
			},
		success : function(data){
			data=data.trim();
			if(data=='-1'){
				alert("Sorry. Try again please.");
			}else{
				showNoticeDetail(notiNo);
			}
		}
	});		
}

function delNoticeReply(nrNo){
	var notiNo=$('#noticeWModNo').val();
	$.ajax({
		method:'POST',
		url:'ndelreply.do',
		data:{
			nr_no:nrNo
			},
		success : function(data){
			data=data.trim();
			if(data=='-1'){
				alert("Sorry. Try again please.");
			}else{
				showNoticeDetail(notiNo);
			}
		}
	});		
}


