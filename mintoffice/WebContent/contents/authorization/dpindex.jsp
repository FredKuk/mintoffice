<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(function(){
	$('#btwrite').click(function(){
		$.ajax({
			method:'POST',
			url: 'contents/authorization/dpwrite.jsp',
			success: function(data){
				$('section').html(data);
			}
		});
	});
});
</script>
<button id="btwrite">글쓰기</button>
<div class="list">
	<div class="board">
		<div class="board_seq">글번호</div>
		<!-- <div class="parent_seq">부모글번호</div> -->
		<div class="board_subject">제목</div>
		<div class="board_writer">작성자</div>
		<div class="board_date">작성일자</div>
		<div class="board_viewcount">조회수</div>
	</div>
</div>