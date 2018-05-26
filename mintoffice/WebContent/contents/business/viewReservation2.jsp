<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
   	$('#business_menu a').click(function(){
   		var idValue= $(this).attr('id');
		$('section').empty();
		switch(idValue){
			case 'reservation':
			$.ajax({
				method:'POST',
				url: 'reservation.do',
				success: function(data){
					$('section').html(data);
				}
			});
			break;
			case 'workCalendar':
				$.ajax({
					method:'POST',
					url: 'workcalendar.do',
					success: function(data){
						$('section').html(data);
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
   	

	$("div.all_reservation").hover(function() {
		   $(this).find("div.reservation_detail").css("display", "block");
		   $(this).find("div.reservation_detail a").css("font-size","12px");
		   $(this).find("div.all_reservation").css("background", "pink").css("color","white");
		}, function(){//"a#record_table"
			$(this).find("div.all_reservation").css("background", "white").css("color","#55595c");
			$(this).find("div.reservation_detail").css("display", "none");
		});	
	
	$("div.reservation_detail a").hover(function() {
		   $(this).css("background","pink");
		}, function(){
			$(this).css("background","white");
		});	
});
</script>
<link rel="stylesheet" href="../../css/home/menu.css">
<style>
div#all{
position:absolute;
width:100%;
height:730px;
padding:0px;
margin:0px;
}
div#a1{
display:inline-block;
width:14%;
height:100%;
}
div#a2{
float:right;
display:inline-block;
width:86%;
height:100%;
}
div#a2{
background-color: blue;
}

.list-group a:hover{
  background:#6CDAB2;
  color:white;
}
.all_reservation a:hover{
  background:pink;
  color:white;
}
div.reservation_detail{
display:none;
}
</style>
<div id="all">
	<div id="a1">
		<div class="list-group" id="reservation_menu"><!-- active disabled -->
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-print"></i>&nbsp;5 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 509
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 506
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 504
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 502
					</a>
				</div>
			</div>
		</div>
		<div class="list-group" id="reservation_menu"><!-- active disabled -->
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-print"></i>&nbsp;4 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 416
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 410
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 404
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 402
					</a>
				</div>
			</div>
		</div>
		<div class="list-group" id="reservation_menu"><!-- active disabled -->
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-print"></i>&nbsp;3 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 311
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 305
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Gym
					</a>
				</div>
			</div>
		</div>
		<div class="list-group" id="reservation_menu"><!-- active disabled -->
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-print"></i>&nbsp;2 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 208
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 205
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 204
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Room 201
					</a>
				</div>
			</div>
		</div>
		<div class="list-group" id="reservation_menu"><!-- active disabled -->
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-print"></i>&nbsp;1 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Auditorium
					</a>
					<a href="#" class="list-group-item list-group-item-action" style = "border: none">
						&emsp;-Center Square
					</a>
				</div>
			</div>
		</div>
	</div>
	<div id="a2">b
	</div>
</div>