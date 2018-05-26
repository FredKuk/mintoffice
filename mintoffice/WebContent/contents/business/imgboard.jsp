<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(function(){
	$('ul#tabs>li.nav-item>a').click(function(){
		var idValue= $(this).attr('id');
		$('#myTabContent>#home>section').empty();
		switch(idValue){
		case 'personal':	//개인이미지함
			$.ajax({
				method:'POST',
				url: 'contents/business/personalimg.jsp',
				success: function(data){
					$('#myTabContent>#home>section').html(data);
				}
			});
		break;
		
		case 'share':	//공유이미지함
			$.ajax({
				method:'POST',
				url: 'contents/business/shareimg.jsp',
				success: function(data){
					$('#myTabContent>#home>section').html(data);
				}
			});
		break;
		};
	});
	
});
</script>

<br>
<div id='imgBoardDiv'>
<ul class="nav nav-tabs" id="tabs">
  <li class="nav-item">
    <a class="nav-link active" id="personal" data-toggle="tab" href="#personal">개인</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="share"data-toggle="tab" href="#share">공유</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade show active" id="home">
    <section style="position:absolute"></section>
  </div>
  <div class="tab-pane fade" id="profile">
   <section style="position:absolute"></section>
  </div>
</div>
</div>