<%@page import="vo.PageBean"%>
<%@page import="vo.CommuteDBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pb" value="${requestScope.pagebean}" />
<c:set var="list" value="${pb.list}" />
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