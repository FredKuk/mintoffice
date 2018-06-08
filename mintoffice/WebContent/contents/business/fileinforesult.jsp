<%@page import="vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="vo.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%PageBean pb = (PageBean)request.getAttribute("pagebean"); %>
<script>
$(function(){
	$('#fileinforesultjsp a').click(function(){
		var page;
		if($(this).text() == '«'){
			page=<%=pb.getStartPage()%>-1;
		}else if($(this).text() == '»'){
			page=<%=pb.getEndPage()%>+1;
		}else{
			page = $(this).text();
		}
		 $.ajax({
			url:"filelist.bo",
			method:'get',
			data:'page='+page,
			success:function(data){
				$('section').empty();
				$('section').html(data.trim());
			}
		}); 
		return false;
	});
	
	$('#fileinforesultjsp a').each(function(index, element){
		if($(element).text() == '<%=pb.getCurrentPage()%>'){
			$(element).addClass('active');
		}
	});    
	
	
	$('input[name=_selected_all_]').on('change', function(){
	  $('input[name=_selected_]').prop('checked', this.checked);
	});

	$('#write').click(function(){
		window.open('contents/business/writeboard.jsp', 'winzip', 'width=580px height=580px');
	});
});

function writeForm(){
	location.href="";
}
</script>
<style>
#fileinforesultjsp div.list{
 box-sizing: border-box;
 width:100%;
 height:100%;
 margin:0px;
 overflow: auto;
}
#fileinforesultjsp div.board{
  box-sizing: border-box;
  margin:1px;
  padding:0px;
  border-bottom: 1px solid;
  display:table-row;
  width:100%;
}

#fileinforesultjsp div.board_seq, div.parent_seq,div.board_subject, div.board_writer, div.board_date, div.board_viewcount{
 box-sizing: border-box;
  margin:0px;
  padding:0px;
  display:table-cell; 
  width:20%;
  border:1px dotted;
  
}
#fileinforesultjsp .table1 {
	border-collapse: collapse;
	vertical-align: middle;
	padding: 10px;
	width: 100%;
}
#fileinforesultjsp .tbclass tbody>tr:hover {
  background:#CEF6E3;
}

#fileinforesultjsp #total {
	margin: 30px;
}

#fileinforesultjsp .pagination {
    display: inline-block;
}

#fileinforesultjsp .pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;    
}
#fileinforesultjsp .pagination a.active {
    background-color: #4CAF50;
    color: white;
    border-radius: 5px;
}
#fileinforesultjsp .pagination a:hover:not(.active) {
    background-color: #ddd;
    border-radius: 5px;
}
</style>
<div id="fileinforesultjsp">
	<div class="filesearch">
		<jsp:include page="filesearch.jsp"></jsp:include>
	</div>
	<div class="list"> 
	<table class="tbclass" style="margin-left: auto; margin-right: auto; width: 100%; height: 75%; overflow: auto; ">
	  <thead style="height:15%">
	    <tr>
	      <th><input type="checkbox" name="_selected_all_"></th>
	      <th>번호</th>
	      <th>제목</th>
	      <th>내용</th>
	      <th>등록일</th>
	      <th>파일</th>
	    </tr>
	  </thead>
	  
	  <% 
	  List<Board>list = pb.getList();
	  for(Board b:list){	  
	%>	<tr>
		<td><%=1 %></td>		
	  	<td><%=b.getBoard_seq()%></td>
	    <td><%=b.getBoard_subject()%></td>
	      <td><%=b.getBoard_contents()%></td>
	      <td><%=b.getBoard_date()%></td>
	    <td><%=0 %></td>
		</tr>
	<%	}%>
	
	</table>
	<div class="pagination">  
	<%int startPage = pb.getStartPage();
	  int endPage = pb.getEndPage();
	  if(startPage > 1){%>
		  <a href="#">&laquo;</a>  
	<%}  
	  for(int i=startPage; i<=endPage; i++){  
	%><a href="#"><%=i%></a>	  
	<%}  
	  System.out.println(pb);
	  
	  if(endPage < pb.getTotalPage()){%>
		<a href="#">&raquo;</a>  
	<%}
	%></div>
	</div>
	<button type="button" style="margin:10px;float:right" class="btn btn-outline-secondary">삭제</button>
	<input type="button" class="btn btn-outline-primary" id="write" value="등록" style="margin:10px;float:right">
</div>