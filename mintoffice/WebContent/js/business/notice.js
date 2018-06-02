$(function() {
	
	$(document).on("click", "#noticeW", function() {
		$.ajax({
			method : 'POST',
			url : 'noticewrite.do',
			success : function(data) {
				$('section').empty();
				$('section').html(data);
			}
		});
	});
	
});