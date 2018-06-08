$(function() {
	$(document).on('click','#business_menu a',function() {
		var idValue = $(this).attr('id');
		$('section').empty();
		switch (idValue) {
		case 'noticeboard':
			$.ajax({
				method : 'POST',
				url : 'viewnotice.do',
				success : function(data) {
					$('section').html(data);
					nsearch="";
					showNotice(1);
				}
			});
			break;
		case 'fileboard':
			$.ajax({
				method : 'POST',
				url : 'filelist.bo',
				success : function(data) {
					$('section').html(data);
				}
			});
			break;
		case 'roomlist':
			$.ajax({
				method : 'POST',
				url : 'viewroomlist.do',
				success : function(data) {
					$('section').html(data);
				}
			});
			break;
		case 'workCalendar':
			$.ajax({
				method : 'POST',
				url : 'viewworkcalendar.do',
				success : function(data) {
					$('section').html(data);
					googlemap();
					setMLocation();
					workCalendar();
					//showWorkCalendar();
				}
			});
			break;
		case 'record_table':
		case 'daytable':
			$.ajax({
				method : 'POST',
				url : 'viewdaytable.do',
				success : function(data) {
					$('section').html(data);
					initCDT();
				}
			});
			break;
		case 'monthtable':
			$.ajax({
				method : 'POST',
				url : 'viewmonthtable.do',
				success : function(data) {
					$('section').html(data);
					showmtYear();
				}
			});
			break;
		}
		return false;
	});	
});