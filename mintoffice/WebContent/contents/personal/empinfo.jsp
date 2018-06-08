<!DOCTYPE html>
<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="empsearch.jsp" %>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- <script>
$(function(){
<% String name = request.getParameter("searchName"); 
   if(name != null){
	   //input객체의 name에 대입
%> 		$("input[name=searchName]").val("<%=name%>");
<% }
   String num = request.getParameter("searchNum");
   if(num != null){
%> 		$("input[name=searchNum]").val("<%=num%>");   
<% }
   String grade = request.getParameter("searchGrade");
   if(grade != null){
%>		$("select").val("<%=grade %>");
<%  }
   String depart = request.getParameter("searchDepart");
   if(depart != null){
%>		$("select").val("<%=depart%>");
<%  }
%>
   
   $("form").submit(function(){
	   alert('test');
	  $.ajax({
		  method:"post",
	  	  data:$("form").serialize(),
	  	  url:"empinfo.do",
	  	  success:function(data){
	  		  if($("section").length > 0){
	  			  $("section").empty();
	  			  $("section").html(data.trim());
	  		  }else{
	  			  $("body").html(data.trim());
	  		  }
	  	  }
	  });
	  return false;
   });
});
</script> --%>

<style>
.table1 {
	border-collapse: collapse;
	vertical-align: middle;
	padding: 10px;
	width: 100%;
}
.tbclass tbody>tr:hover {
  background:#CEF6E3;
}
div {
	display: inline-block;
	width: 100%;
	padding: 5px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

#total {
	margin: 30px;
}
</style>
</head>
<body>

<%-- 
	<table class="tbclass" style="margin-left: auto; margin-right: auto; width: 100%; height: 80%; overflow: auto">
		<thead style="height:15%">
			<tr>
				<th>사번</th>
				<th>직급</th>
				<th>핸드폰번호</th>
				<th>성명</th>
				<th>Email</th>
				<th>부서</th>
				<th>입사일</th>
				<th>퇴사일</th>
			</tr>
		</thead>
		<%
		request.setCharacterEncoding("UTF-8");
		String searchName = request.getParameter("searchName");
		String searchNum = request.getParameter("searchNum");
		String searchGrade = request.getParameter("searchGrade");
		String searchDepart = request.getParameter("searchDepart");
		
	/* 	Session session = Request.getSession();
		String emp_no = session.getAttribute("emp_no");
		 */
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = sql.MyConnection.getConnection();
			String selectByNameSQL = "select e.name, e.emp_no, d.dep_name, p.position_name\r\n"+
									  "from employee e, department d, position p\r\n"+
									  "where e.dep_no = d.dep_no and e.position_no = p.position_no and\r\n"+
					     			  "e.name = '?' and e.emp_no = '?' and d.dep_name = '?' and p.position_name = '?'\r\n";
			pstmt = con.prepareStatement(selectByNameSQL);
			pstmt.setString(1, "%" + name +"%");
			pstmt.setString(2, emp_no);
			pstmt.setString(3, "test");
			pstmt.setString(4, "testPos");
			rs = pstmt.executeQuery();
			while(rs.next()) {
							
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		 --%>
		
		<tbody>
		<c:forEach items = "${list}" var="emp">
			<tr>
				<td>${emp.emp_no}</td>
				<td>${emp.id}</td>
				<td>${emp.name}</td>
				<th scope="row">${emp.position_no}</th>
				<td>${emp.email}</td>
				<td>${emp.join_date}</td>
				<td>${emp.retire_date}</td>
				<td>${emp.msg}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<br>
	<table style="width: 100%">
		<tr>
			<td></td>
			<td><div
					style="display: inline-block; width: 250px; padding: 10px; margin-left: auto; margin-right: auto; text-align: center;">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
						</li>
						<li class="page-item active"><a class="page-link" href="#">1</a>
						</li>
						<li class=
						"page-item"><a class="page-link" href="#">2</a></li>
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
