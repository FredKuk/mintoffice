<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<div style="margin-left: 30px;margin-top: 20px;">
	<h2>New Notice</h2>
</div>
<form style="padding:3%;padding-top:1%;" id="noticeForm">
	<div class="form-group">
		<label class="col-form-label" for="wTitle">Title</label>
		<input type="text" class="form-control" name = "title" id="wTitle" required>
	</div>
	<div class="form-group">
		<label for="exampleTextarea">Contents</label>
		<textarea class="form-control" name="contents" rows="14" required></textarea>
	</div>
	<div class="form-group"style="margin-top:5px;">
	    <input type="submit" class="btn btn-outline-warning" value="Submit" style="line-height:14px;">
	    <input type="button" class="btn btn-outline-secondary" value="Cancel" id="noticeWCanBtn" style="line-height:14px;">
	</div>
</form>