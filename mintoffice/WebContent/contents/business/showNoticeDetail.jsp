<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<form style="padding:3%;padding-top:1%;padding-bottom:2%;" id="noticemodForm">
	<div class="form-group">
		<label class="col-form-label">Title</label>
		<input type="text" name="no" id="noticeWModNo" value="${requestScope.result.noti_no}" readonly style="display:none">
		<input type="text" class="form-control" name = "title" value="${requestScope.result.noti_title}" required readonly>
	</div>
	<div class="form-group">
		<label for="exampleTextarea">Contents</label>
		<textarea class="form-control" name="contents" rows="14" required readonly>${requestScope.result.noti_contents}</textarea>
	</div>
	<div class="form-group"style="margin-top:5px;">
	    <p class="text-muted">Last modified : ${requestScope.result.noti_date}</p>
	    <c:if test="${not empty sessionScope.is_manager}">
			<input type="submit" class="btn btn-outline-info" value="Modify" id="noticeWModBtnIn" style="line-height:14px; display:none;">
		    <input type="button" class="btn btn-outline-warning" value="Modify"  id="noticeWModBtn" style="line-height:14px;">
		    <input type="button" class="btn btn-outline-danger" value="Delete"  id="noticeWDelBtn" style="line-height:14px;">
	    </c:if>	
	    <input type="button" class="btn btn-outline-secondary" value="Cancel" id="noticeWCanBtn"  style="line-height:14px;">
	</div>
</form>
<div class="form-group" id="nReplyBody" style=" box-sizing: border-box;">
</div>
<form id ='newNReplyForm' style="padding:3%;padding-top:0px;">
	<div class="form-group">
		<label>New reply</label>
		<textarea required class="form-control" id="nReplyTextarea" rows="3" placeholder="writing reply here"required></textarea>
		<input type="submit" class="btn btn-outline-info" value="reply" id="" style="margin-top:10px;line-height:10px;">
	</div>
</form>