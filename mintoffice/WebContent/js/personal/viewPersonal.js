$(function(){
   	$(document).on('click','#personal_menu a',function(){
   		var idValue= $(this).attr('id');
		$('section').empty();
		switch(idValue){
		case 'personal_info':	//개인설정
			console.log("Here");
			$.ajax({
				method:'POST',
				url: 'contents/personal/eachinfo.jsp',
				success: function(data){
					$('section').html(data);
				}
			});
			break;
			
		case 'emp_info':	//직원정보
			$.ajax({
				method:'POST',
				url: 'contents/personal/empinforesult.jsp',
				/*url: 'contents/personal/empinfo.jsp',*/
				success: function(data){
					$('section').html(data);
				}
			});
			break;		
		case 'schedule':
		case 'all_schedule':
			/* console.log("Here"); */
			$.ajax({
				method:'POST',
				url: 'viewallschedule.do',
				success: function(data){
					$('section').html(data);
					scheduleCalendar();
					showPS();
					showTS();
					showCS();
				}
			});
			break;
		case 'personal_schedule':
			/* console.log("Here"); */
			$.ajax({
				method:'POST',
				url: 'viewpersonalschedule.do',
				success: function(data){
					$('section').html(data);
					scheduleCalendar();
					showPS();
				}
			});
			break;
		case 'team_schedule':
			/* console.log("Here"); */
			$.ajax({
				method:'POST',
				url: 'viewteamschedule.do',
				success: function(data){
					$('section').html(data);
					scheduleCalendar();
					showTS();
				}
			});
			break;
		case 'company_schedule':
			/* console.log("Here"); */
			$.ajax({
				method:'POST',
				url: 'viewcompanyschedule.do',
				success: function(data){
					$('section').html(data);
					scheduleCalendar();
					showCS();
				}
			});
			break;
		case 'memo':
			$.ajax({
				method:'POST',
				url: 'viewmemo.do',
				success: function(data){
					$('section').html(data);
				}
			});
			break;
		case 'business':
			$.ajax({
				method:'POST',
				url: 'viewbusiness.do',
				success: function(data){
					$('#contents').html(data);
				}
			});
			break;			
		}
   	});
});