<%@page import="vo.PageBean"%>
<%@page import="vo.Memo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pb" value="${requestScope.pagebean}" />
<c:set var="list" value="${pb.list}" />

<c:forEach items="${list}" var="memo">
	<div class="memoEach">
		<div class="card mb-3">
			<span style="display: none">${memo.memo_no}</span>
			<h6 class="card-header">${memo.memo_date}</h6>
			<div class="card-body">
				<p class="card-text">${memo.memo_contents}</p>
				<textarea class="form-control" rows="3" cols="10"
					style="width: 100%; display: none"></textarea>
			</div>
			<div class="card-footer text-muted">
				<button type="button" class="btn btn-outline-info btn-sm"
					id="memoSubBtn" style="display: none">modify</button>
				<button type="button" class="btn btn-outline-warning btn-sm"
					id="memoModBtn">modify</button>
				<button type="button" class="btn btn-outline-danger btn-sm"
					id="memoDelBtn">delete</button>
				<button type="button" class="btn btn-outline-secondary btn-sm"
					id="memoCanBtn" style="display: none">cancel</button>
			</div>
		</div>
	</div>
</c:forEach>