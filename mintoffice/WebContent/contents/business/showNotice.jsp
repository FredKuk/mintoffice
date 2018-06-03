<%@page import="vo.PageBean"%>
<%@page import="vo.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="pb" value="${requestScope.pagebean}" />
<c:set var="list" value="${pb.list}" />
<c:set var="total" value="${requestScope.total}"/>
<c:set var="currentPage" value="${pb.currentPage}" />
<c:set var="totalPage" value="${pb.totalPage}" />
<c:set var="startPage" value="${pb.startPage}" />
<c:set var="endPage" value="${pb.endPage}" />

<c:if test="${not empty requestScope.result}">
	<p style="Color:RED">ERROR</p>
</c:if>
<table class="table-striped table-hover tbclass mintboard"
	style="margin-left: auto; margin-right: auto; width: 100%; height: 75%; overflow: auto;">
	<thead style="height: 15%">
		<tr>
			<th><input type="checkbox" name="_selected_all_"></th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="item" varStatus="status">
		<tr>
			<td><input type="checkbox" name="_selected_"></td>
			<td>${total-(currentPage-1)*13-status.index}</td>
			<td style="text-align:left;padding-left:2%;"><a href="#" style="text-decoration:none;cursor:pointer;" onclick="window.scrollTo(0,0);"><span style="display:none">${item.noti_no}</span>${item.noti_title}</a></td>
			<td>${item.emp_no}</td>
			<td>${item.noti_date}</td>
			<td class="boardclicks">${item.noti_clicks}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<c:if test="${(not(startPage > totalPage)) and (totalPage>1)}">
	<div
		style="display: inline-block; padding: 10px; margin-left: auto; margin-right: auto; text-align: center;">
		<ul class="pagination" id ='nPageInfo'>
			<c:if test="${not(startPage eq 1)}">
				<li class="page-item"><a class="page-link" id='nLaquo' href="#">&laquo;</a></li>
			</c:if>
			<c:forEach var="item" begin="${startPage}" end="${endPage}" step="1" varStatus="status">
				<c:if test="${status.current eq currentPage}">
					<li class="page-item active"><a class="page-link nPageNum" href="#">${startPage+status.count-1}</a></li>
				</c:if>
				<c:if test="${not(status.current eq currentPage)}">
					<li class="page-item"><a class="page-link nPageNum" href="#">${startPage+status.count-1}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${not(endPage eq totalPage)}">
				<li class="page-item"><a class="page-link" id='nRaquo' href="#">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</c:if>