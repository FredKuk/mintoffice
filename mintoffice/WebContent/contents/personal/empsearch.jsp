<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
	//value
<% String name = request.getParameter("searchName");
   if(name != null){
	   //input객체의 name에 대입
%>	  $("input[name=searchName]").val("<%=name%>");
<% }
   String num = request.getParameter("searchNum");
   if(num != null){
%>	   $("input[name=searchNum]").val("<%=num%>");
<%   }
   // item
   String grade = request.getParameter("searchGrade");
   if(grade != null){
%>	   $("select[name=searchGrade]").val("<%=grade%>");  
<%   }
   String depart = request.getParameter("searchDepart");
   if(depart != null){
%>	   $("select[name=searchDepart]").val("<%=depart%>")
<%   }
%>
	$("#empsearchjsp form").submit(function(){
		$.ajax({
			method:"post",
			data:$("#empsearchjsp form").serialize(),
			url:"empinfo.bo",
			success:function(data){
				if($("section").length > 0){
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
<br>
<div id="empsearchjsp">
<form>
	<div class="form-group" style="display:inline-block; width: 250px; white-space: nowrap;">
	<label class="col-form-label" for="inputDefault">이름</label>
	 <input type="text" class="form-control" name="searchName" placeholder="이름을 입력하세요" id="inputDefault">
	</div>
	<div class="form-group" style=" display:inline-block; width: 250px; white-space: nowrap;">
	<label class="col-form-label" for="inputDefault">사번</label>
	 <input type="text" class="form-control" name="searchNum" placeholder="사번을 입력하세요" id="inputDefault">
	</div>
	<div class="form-group" style=" display:inline-block; width: 150px; white-space: nowrap;">
		<label for="exampleSelect1">직급</label>
		<select class="form-control" id="exampleSelect1" name="searchGrade">
			<option>전체</option>
			<option>사원</option>
			<option>대리</option>
			<option>과장</option>
		</select>
	</div>
	<div class="form-group" style=" display:inline-block; width: 150px; white-space: nowrap;">
		<label for="exampleSelect1">부서명</label> 
		<select class="form-control" id="exampleSelect1" name="searchDepart">
			<option>전체</option>
			<option>개발부</option>
			<option>영업부</option>
			<option>회계부</option>
		</select>
	</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" class="btn btn-info" id="total" value="검색">
</form>
</div>