<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
	$('#roomState').click(function(){
		$('#a2').empty();
		$.ajax({
			method:'POST',
			url: 'viewroomstate.do',
			success: function(data){
				$('#a2').html(data);
			}
		});	
	});
   	$('div.reservation_detail>a').click(function(){
   		var idValue= $(this).attr('id');
		$('#a2').empty();
		switch(idValue){
			case 'r5_4':
				$.ajax({
					method:'POST',
					url: 'viewroomdetail.do',
					success: function(data){
						$('#a2').html(data);
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
<style>
div#a1{
display:inline-block;
width:15%;
height:100%;
/* border-left: solid;
border-right: solid;
border-width: 5px;
border-color: black; */
/* border-color: #6CDAB2; */
}
div#a2{
float:right;
display:inline-block;
width:85%;
height:100%;
}

/*   #calendar {
    max-width: 880px;
    margin: 0 auto;
  } */

/* div#a2{
background-color: blue;
} */

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
				<a href="#" class="list-group-item list-group-item-action" id="roomState" style = "border: none">
					<i class="fas fa-genderless"></i>&nbsp;Present State
				</a>
			</div>
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-genderless"></i>&nbsp;5 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" id = "r5_4" style = "border: none">
						&emsp;-Room 509(M)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r5_3" style = "border: none">
						&emsp;-Room 506(M)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r5_2" style = "border: none">
						&emsp;-Room 504(S)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r5_1" style = "border: none">
						&emsp;-Room 502(S)
					</a>
				</div>
			</div>
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-genderless"></i>&nbsp;4 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" id = "r4_4" style = "border: none">
						&emsp;-Room 416(L)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r4_3" style = "border: none">
						&emsp;-Room 410(M)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r4_2" style = "border: none">
						&emsp;-Room 404(M)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r4_1" style = "border: none">
						&emsp;-Room 402(S)
					</a>
				</div>
			</div>
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-genderless"></i>&nbsp;3 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" id = "r3_3" style = "border: none">
						&emsp;-Room 311(s)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r3_2" style = "border: none">
						&emsp;-Room 305(s)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r3_1" style = "border: none">
						&emsp;-Gym(XL)
					</a>
				</div>
			</div>
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-genderless"></i>&nbsp;2 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" id = "r2_4" style = "border: none">
						&emsp;-Room 208(S)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r2_3" style = "border: none">
						&emsp;-Room 205(S)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r2_2" style = "border: none">
						&emsp;-Room 204(M)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r2_1" style = "border: none">
						&emsp;-Room 201(S)
					</a>
				</div>
			</div>
			<div class ="all_reservation">
				<a href="#" class="list-group-item list-group-item-action" style = "border: none">
					<i class="fas fa-genderless"></i>&nbsp;1 Floor
				</a>
				<div class="reservation_detail">
					<a href="#" class="list-group-item list-group-item-action" id = "r1_2" style = "border: none">
						&emsp;-Auditorium(XL)
					</a>
					<a href="#" class="list-group-item list-group-item-action" id = "r2_1" style = "border: none">
						&emsp;-Square(XL)
					</a>
				</div>
			</div>
		</div>
	</div>
	<div id="a2">b
	</div>
</div>