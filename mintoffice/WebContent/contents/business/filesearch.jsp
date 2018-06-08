<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
	//value
<% String subject = request.getParameter("searchSubject");
   if(subject != null){
	   //input객체의 name에 대입
%>	  $("input[name=searchSubject]").val("<%=subject%>");
<% }
   String calendar = request.getParameter("searchCalendar");
   if(calendar != null){
%>	   $("input[name=searchNum]").val("<%=calendar%>");
<%   }
%>
	$("#filesearchjsp form").submit(function(){
		$.ajax({
			method:"post",
			data:$("#filesearchjsp form").serialize(),
			url:"filelist.do",
			success:function(data){
				if($("section").length > 0){	//?
					$("section").empty();
					$("section").html(data.trim());
				}/* else{
					$("body").html(data.trim());
				} */
			}
		});
		return false;
	});
});

</script>
<style>
#filesearchjsp .table1 {
	border-collapse: collapse;
	vertical-align: middle;
	padding: 10px;
	width: 100%;
}
#filesearchjsp .tbclass tbody>tr:hover {
  background:#CEF6E3;
}
#filesearchjsp div {
	display: inline-block;
	width: 100%;
	padding: 5px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

#filesearchjsp #total {
	margin: 30px;
}
</style>
<div id='filesearchjsp'>
		<br>
	<form>
		<div class="form-group" style="width: 250px; white-space: nowrap;">
			<label class="col-form-label" for="inputDefault">제목</label> 
			<input type="text" class="form-control" placeholder="제목을 입력하세요" id="inputDefault" name="searchSubject">
		</div>
		<div class="form-group" style="width: 200px; white-space: nowrap;">
			<fieldset>
				<label class="control-label" for="readOnlyInput">등록일</label> 
				<input class="form-control" id="readOnlyInput" name="searchCalendar" type="text" placeholder="날짜를 선택하세요" readonly="">
			</fieldset>
		</div>
		<button type="button" class="btn btn-info disabled"
			style="white-space: nowrap;">달력</button>
		<input type="submit" class="btn btn-info" id="total" value="검색">
	
	</form>
</div>