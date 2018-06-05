<%@page import="vo.NReply"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty requestScope.result}">
<%System.out.println("IM HERE~"); %>
	<c:forEach items="${requestScope.result}" var="item" varStatus="status">
		<div>
			<label>Reply&nbsp;<i class="far fa-comment-alt"></i>&nbsp;&nbsp;${item.idValue}&nbsp;&nbsp;${item.nr_date}</label>
			<div>
				<p class="text-primary" style="border:solid;border-width:1px;border-color:#DCDCDC;margin-left:3%;margin-right:3%;padding:1%;">${item.nr_contents}</p>
				<c:if test="${item.idValue eq sessionScope.loginInfo}">
					<textarea class="form-control" id='nReplyModTextarea'rows="2" required style="width:94%;margin-left:3%;margin-right:13%;display:none">${item.nr_contents}</textarea>
					<div class="replyBtnDiv"style='margin-left:3%;margin-bottom:1%;'>
						<input type="text" value="${item.nr_no}" readonly style="display:none">
						<button type="button" class="btn btn-info btn-sm" style="display:none">submit</button>
						<button type="button" class="btn btn-warning btn-sm">modify</button>
						<button type="button" class="btn btn-danger btn-sm">delete</button>
						<button type="button" class="btn btn-secondary btn-sm" style="display:none">cancel</button>
					</div>
				</c:if>
			</div>
		</div>
	</c:forEach>
</c:if>