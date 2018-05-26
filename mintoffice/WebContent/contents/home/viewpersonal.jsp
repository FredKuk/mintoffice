<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
   	$('#personal_menu a').click(function(){
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
				url: 'contents/personal/empinfo.jsp',
				success: function(data){
					$('section').html(data);
				}
			});
			break;
		
		case 'rcv_msg':	//쪽지함
			$.ajax({
				method:'POST',
				url: 'contents/personal/rcvmsg.jsp',
				success: function(data){
					$('section').html(data);
				}
			});
			break;
			
		case 'sent_msg': 	//보낸쪽지함
			$.ajax({
				method:'POST',
				url: 'contents/personal/sentmsg.jsp',
				success: function(data){
					$('section').html(data);
				}
			});
			break;
		
		case 'msgbox_msg'://Message 
			$.ajax({
				method:'POST',
				url: 'contents/personal/msgbox.jsp',
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
	$("div#all_schedule").hover(function() {
		   $("div#schedule_detail").css("display", "block");
		   $("div#schedule_detail a").css("font-size","12px");
		   $("a#schedule").css("background", "#6CDAB2").css("color","white");
		}, function(){
			   $("a#schedule").css("background", "white").css("color","#55595c");
		    $("div#schedule_detail").css("display", "none");
	});
   	
	$("div#schedule_detail a").hover(function() {
		   $(this).css("background","#A4FFDE");
		}, function(){
			$(this).css("background","white");
		});	
});
</script>
<style>
#personal_menu a:hover{
  background:#6CDAB2;
  color:white;
}
div#schedule_detail{
display:none;
}
</style>
<section>111
</section>
<aside>
<div class="list-group" id="personal_menu"><!-- active disabled -->
  <a href="#" class="list-group-item list-group-item-action" id ="personal_info" style = "border: none">
  	<i class="fas fa-user"></i>&nbsp;개인설정
  </a>
  <a href="#" class="list-group-item list-group-item-action" id ="emp_info" style = "border: none">
  	<i class="fas fa-users"></i>&nbsp;직원정보
  </a>
	<div id="all_msg">
	  	<a href="#" class="list-group-item list-group-item-action" id ="message" style = "border: none">
	  		<i class="far fa-comment-alt"></i>&nbsp;쪽지함
	  	</a>
	  	<div id="msg_detail">
	  		<a href="#" class="list-group-item list-group-item-action" id ="rcv_msg" style = "border: none">
	  			&emsp;-받은쪽지함
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action" id ="sent_msg" style = "border: none">
	  			&emsp;-보낸쪽지함
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action" id ="msgbox_msg" style = "border: none">
	  			&emsp;-쪽지함
	  		</a>
  		</div>
  </div>
  <a href="#" class="list-group-item list-group-item-action" id ="memo" style = "border: none">
  	<i class="far fa-edit"></i>&nbsp;메모함
  </a>
<div id ="all_schedule">
  	<a href="#" class="list-group-item list-group-item-action" id="schedule" style = "border: none">
  		<i class="fas fa-calendar-alt"></i>&nbsp;일정
  	</a>
  	<div id="schedule_detail">
  	  	<a href="#" class="list-group-item list-group-item-action" id ="all_schedule" style = "border: none">
  			&emsp;-전체일정
  		</a>
  		<a href="#" class="list-group-item list-group-item-action" id ="personal_schedule" style = "border: none">
  			&emsp;-개인일정
  		</a>
  		<a href="#" class="list-group-item list-group-item-action" id ="team_schedule" style = "border: none">
  			&emsp;-부서일정
  		</a>
  		<a href="#" class="list-group-item list-group-item-action" id ="company_schedule" style = "border: none">
  			&emsp;-회사일정
  		</a>
  	</div>
  </div>

</div>
</aside>
