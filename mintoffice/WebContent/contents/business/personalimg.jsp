<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#pImg img{
   width:300px;
}
#pImg td{
	width:25%;
	margin:10px;
	padding:5px;
}
#pImg .subjectclass{
  margin:10px;
}
   
</style>
<script>
$(function(){
$('#write').click(function(){
	window.open('writeboard.jsp', 'winzip', 'width=580px height=580px');
	
});
$('#files').change(function(){
    const target = document.getElementsByName('files[]');
    var html = '';
    $.each(target[0].files, function(index, file){
        const fileName = file.name;
        html += '<div class="file">';
        html += '<img src="'+URL.createObjectURL(file)+'">'
        html += '<span>'+fileName+'</span>';
        html += '<a href="#" id="removeImg">╳</a>';
        html += '</div>';
        const fileEx = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
        if(fileEx != "jpg" && fileEx != "png" &&  fileEx != "gif" &&  fileEx != "bmp" && fileEx != "wmv" && fileEx != "mp4" && fileEx != "avi"){
            alert("파일은 (jpg, png, gif, bmp, wmv, mp4, avi) 형식만 등록 가능합니다.");
            resetFile();
            return false;
        }
        $('.fileList').html(html);
    });
});
});
</script>
<div id='pImg'>
	<br>
	<div class="list-search1" style="float:right">
	<select id="search" >
		<option>제목</option>
		<option>내용</option>
		<option>날짜</option>
		<option>작성자</option>
	</select>
	<input id="searchtxt">
	<button>검색</button>&nbsp;&nbsp;&nbsp;
	<br>
	</div>
	<br>
	<br>
	<div id="tableid" style=" height:600px;overflow:auto">
	<table style="width:100% ; height:600px; margin:auto; overflow:auto" >
		<tr>
			<td><img src="movie.jpg"><br>
			<h5 class="subjectclass">어벤져스</h5>
			<h6 class="subjectclass">2018-05-17</h6>
			</td>
			<td><img src="movie2.jpg"><br>
			<h5 class="subjectclass">어벤져스</h5>
			<h6 class="subjectclass">2018-05-17</h6>
			</td>
			<td><img src="movie.jpg"><br>
			<h5 class="subjectclass">어벤져스</h5>
			<h6 class="subjectclass">2018-05-17</h6>
			</td>
		
		</tr>
		<tr>
			<td><img src="movie.jpg"><br>
			<h5 class="subjectclass">어벤져스</h5>
			<h6 class="subjectclass">2018-05-17</h6>
			</td>
			<td><img src="movie2.jpg"><br>
			<h5 class="subjectclass">어벤져스</h5>
			<h6 class="subjectclass">2018-05-17</h6>
			</td>
			<td><img src="movie.jpg"><br>
			<h5 class="subjectclass">어벤져스</h5>
			<h6 class="subjectclass">2018-05-17</h6>
			</td>
		</tr>
		
	</table>
	 <table style="width: 100%;">
					<tr>
						<td>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</td>
						<td><div style="display: inline-block; width: 250px; padding: 10px; margin-left: auto; margin-right: auto; text-align: center;">
						<input type="button" class="btn btn-outline-primary"  id="write" style="margin:10px" value="글쓰기" style="margin:10px"></div></td>
						<td></td>
					</tr>
				</table>
		<table style="width: 100%">
		<tr>
			<td>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</td>
			<td><div
					style="display: inline-block; width: 250px; padding: 10px; margin-left: auto; margin-right: auto; text-align: center;">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
						</li>
						<li class="page-item active"><a class="page-link" href="#">1</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">&raquo;</a>
						</li>
					</ul>
				</div></td>
			<td></td>
		</tr>
	</table>
	</div>
	</div>