<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('ul#tabs>li.nav-item>a').click(function() {
			var idValue = $(this).attr('id');
			$('#myTabContent>#home>section').empty();
			switch (idValue) {
			case 'pr': //개인쪽지함
				$.ajax({
					method : 'POST',
					url : 'prmsg.jsp',
					success : function(data) {
						$('#myTabContent>#home>section').html(data);
					}
				});
				break;

			case 'gr': //단체쪽지함
				$.ajax({
					method : 'POST',
					url : 'grmsg.jsp',
					success : function(data) {
						$('#myTabContent>#home>section').html(data);
					}
				});
				break;
			}
			;
		});
	});
</script>

<br>
<ul class="nav nav-tabs" id="tabs">
	<li class="nav-item"><a class="nav-link active" id="pr"
		data-toggle="tab" href="#pr">개인쪽지함</a></li>
	<li class="nav-item"><a class="nav-link" id="gr" data-toggle="tab"
		href="#gr">단체쪽지함</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade show active" id="home">
		<section style="position: absolute"></section>
	</div>
	<div class="tab-pane fade" id="profile">
		<section style="position: absolute"></section>
	</div>
</div>