<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
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
<section>
</section>
<aside>
<div class="list-group" id="personal_menu"><!-- active disabled -->
  <a href="#" class="list-group-item list-group-item-action" id ="personal_info" style = "border: none">
  	<i class="fas fa-user"></i>&nbsp;개인설정
  </a>
  <a href="#" class="list-group-item list-group-item-action" id ="emp_info" style = "border: none">
  	<i class="fas fa-users"></i>&nbsp;직원정보
  </a>
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
