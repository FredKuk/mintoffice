<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
   	$('#personal_menu>a').click(function(){
   		var idValue= $(this).attr('id');
		$('#contents').empty();	
		switch(idValue){
			case 'home':
				location.href="home.jsp";
				break;
			case 'personal':
				$.ajax({
					method:'POST',
					url: 'viewpersonal.do',
					success: function(data){
						$('#contents').html(data);
					}
				});
				break;
			case 'authorization':
				$.ajax({
					method:'POST',
					url: 'viewauth.do',
					success: function(data){
						$('#contents').html(data);
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
   	
/*    	$("div.list-group a").click(function(){
   		$("div.list-group a").css("background", "white").css("color","#55595c");
   		$(this).css("background", "#6CDAB2").css("color","white");
   		
   	}); */
   	
	$("div#approval_register").hover(function() {
		   $("div#approval_detail").css("display", "block");
		   $("div#approval_detail a").css("font-size","12px");
		   $("a#approval_basic").css("background", "#6CDAB2").css("color","white");
		}, function(){
			   $("a#approval_basic").css("background", "white").css("color","#55595c");
		    $("div#approval_detail").css("display", "none");
		});	
	$("div#approval_detail a").hover(function() {
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
div#approval_detail{
display:none;
}
</style>
<section>asfasdf
</section>
<aside>
<div class="list-group"><!-- active disabled -->
  <a href="#" class="list-group-item list-group-item-action" style = "border: none">
  	<i class="far fa-copy"></i>&nbsp;기안서작성
  </a>
  <a href="#" class="list-group-item list-group-item-action" style = "border: none">
 	<i class="far fa-newspaper"></i>&nbsp;내결제관리
  </a>
  <a href="#" class="list-group-item list-group-item-action" style = "border: none">
  	<i class="fas fa-suitcase"></i>&nbsp;기안서통합관리
  </a>
  <div id ="approval_register">
  	<a href="#" class="list-group-item list-group-item-action" id="approval_basic" style = "border: none">
  		<i class="fas fa-eye-dropper"></i>&nbsp;기초자료등록
  	</a>
  	<div id="approval_detail">
  		<a href="#" class="list-group-item list-group-item-action" id ="approval_line" style = "border: none">
  			&emsp;-결제라인등록
  		</a>
  		<a href="#" class="list-group-item list-group-item-action" id ="approval_doc" style = "border: none">
  			&emsp;-공통양식등록
  		</a>
  	</div>
  </div>
</div>
</aside>
