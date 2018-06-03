<%@page import="vo.PageBean"%>
<%@page import="vo.CommuteDBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pb" value="${requestScope.pagebean}" />
<c:set var="list" value="${pb.list}" />
<c:if test="${not empty requestScope.result}">
	<p style="Color:RED">DATE RANGE IS ERROR. LEFT DATE IS NEWER THAN RIGHT ONE.</p>
</c:if>
<table class="workTimeTable" style="margin-bottom:10px;">
	<thead>
		<tr class="workTimeTableHeader">
			<th>날짜</th>
			<th>정상출근</th>
			<th>출근시간</th>
			<th>퇴근시간</th>
			<th>야근시간</th>
			<th>외근시간</th>
			<th>복귀시간</th>
			<th>병가여부</th>
			<th>조퇴여부</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="item" varStatus="status">
			<tr class="workTimeContents">
				<td>${item.date}</td>
				<c:if test="${item.late eq '0'}">
					<td class="arriveOk"><i class="far fa-circle"></i></td>
				</c:if>
				<c:if test="${item.late eq '1'}">
					<td class="arriveBad"><i class="fas fa-times"></i></td>
				</c:if>
				<td>${item.start}</td>
				<td>${item.end}</td>
				<td>${item.overwork}</td>
				<td>${item.oStart}</td>
				<td>${item.oEnd}</td>
				<c:if test="${item.sick eq '0'}">
					<td class="dtNo"><i class="fas fa-times"></i></td>
				</c:if>
				<c:if test="${item.sick eq '1'}">
					<td class="dtYes"><i class="far fa-circle"></i></td>
				</c:if>
				<c:if test="${item.early eq '0'}">
					<td class="dtNo"><i class="fas fa-times"></i></td>
				</c:if>
				<c:if test="${item.early eq '1'}">
					<td class="dtYes"><i class="far fa-circle"></i></td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:set var="currentPage" value="${pb.currentPage}" />
<c:set var="totalPage" value="${pb.totalPage}" />
<c:set var="startPage" value="${pb.startPage}" />
<c:set var="endPage" value="${pb.endPage}" />

<c:if test="${not(startPage > totalPage) and not(totalPage eq 1) and (totalPage>0)}">
	<div class="text-center" style="margin-left:40px;">
		<ul class="pagination" id ='cdtPageInfo'>
			<c:if test="${not(startPage eq 1)}">
				<li class="page-item"><a class="page-link" id='cdtLaquo' href="#">&laquo;</a></li>
			</c:if>
			<c:forEach var="item" begin="${startPage}" end="${endPage}" step="1" varStatus="status">
				<c:if test="${status.current eq currentPage}">
					<li class="page-item active"><a class="page-link cdtPageNum" href="#">${startPage+status.count-1}</a></li>
				</c:if>
				<c:if test="${not(status.current eq currentPage)}">
					<li class="page-item"><a class="page-link cdtPageNum" href="#">${startPage+status.count-1}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${not(endPage eq totalPage)}">
				<li class="page-item"><a class="page-link" id='cdtRaquo' href="#">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</c:if>