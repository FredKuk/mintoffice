<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
   	$('#business_menu a').click(function(){
   		var idValue= $(this).attr('id');
		$('section').empty();
		switch(idValue){
			case 'fileboard':
			$.ajax({
				method:'POST',
				url: 'contents/business/fileboard.jsp',
				success: function(data){
					$('section').html(data);
				}
			});
			break;	
			case 'imgboard':
				$.ajax({
					method:'POST',
					url: 'contents/business/imgboard.jsp',
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
			case 'roomlist':
			$.ajax({
				method:'POST',
				url: 'viewroomlist.do',
				success: function(data){
					$('section').html(data);
				}
			});
			break;
			case 'workCalendar':
				$.ajax({
					method:'POST',
					url: 'viewworkcalendar.do',
					success: function(data){
						$('section').html(data);
					}
				});
				break;
			case 'record_table':
			case 'daytable':
				$.ajax({
					method:'POST',
					url: 'viewdaytable.do',
					success: function(data){
						$('section').html(data);
					}
				});
				break;
			case 'monthtable':
				$.ajax({
					method:'POST',
					url: 'viewmonthtable.do',
					success: function(data){
						$('section').html(data);
					}
				});
			break;
		}
   	});
   	
/*    	$("div.list-group a").click(function(){
   		$("div.list-group a").css("background", "white").css("color","#55595c");
   		$(this).css("background", "#6CDAB2").css("color","white");
   		
   	}); */
   	
	$("div#all_record").hover(function() {
		   $("div#record_detail").css("display", "block");
		   $("div#record_detail a").css("font-size","12px");
		   $("a#record_table").css("background", "#6CDAB2").css("color","white");
		}, function(){
			   $("a#record_table").css("background", "white").css("color","#55595c");
		    $("div#record_detail").css("display", "none");
		});	
	$("div#record_detail a").hover(function() {
		   $(this).css("background","#A4FFDE");
		}, function(){
			$(this).css("background","white");
		});	
});
</script>
<style>
.list-group a:hover{
  background:#6CDAB2;
  color:white;
}
div#record_detail{
display:none;
}
</style>
<section>asfasdf
</section>
<aside>
<div class="list-group" id="business_menu"><!-- active disabled -->
  <a href="#" class="list-group-item list-group-item-action" id="fileboard" style = "border: none;">
  	<i class="far fa-save"></i>&nbsp;개인파일함
  </a>
  <a href="#" class="list-group-item list-group-item-action" id="imgboard" style = "border: none;">
  	<i class="far fa-image"></i>&nbsp;이미지보관함
  </a>
  <a href="#" class="list-group-item list-group-item-action" id="roomlist" style = "border: none;">
  	<i class="fas fa-th"></i>&nbsp;회의실예약
  </a>
  <a href="#" class="list-group-item list-group-item-action" id="workCalendar" style = "border: none;">
  	<i class="far fa-clock"></i>&nbsp;출/퇴근기록부
  </a>
  <div id ="all_record">
  	<a href="#" class="list-group-item list-group-item-action" id="record_table" style = "border: none">
  		<i class="fas fa-print"></i>&nbsp;출/퇴근부
  	</a>
  	<div id="record_detail">
  		<a href="#" class="list-group-item list-group-item-action" id ="daytable" style = "border: none">
  			&emsp;-일 출/퇴근현황
  		</a>
  		<a href="#" class="list-group-item list-group-item-action" id ="monthtable" style = "border: none">
  			&emsp;-월 출/퇴근현황 
  		</a>
  	</div>
  </div>
</div>
</aside>
