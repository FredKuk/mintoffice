<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#calendar {
width: 90%;
margin-bottom: 15px;
}
.fc-sun { color:orange; }
.fc-sat { color:lightblue; }
.modal{
top:280px;
}
.modal-footer:first-child{
background-color: #6CDAB2;
}
</style>
</head>
<br>
<h2>Commute Calendar</h2><br>
<div id='calendar'></div>
<!-- Commute Checking Modal -->
<div class="modal" id="workModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Check</h5>
        <button type="button" class="close" id='workmodalClose' data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<p id='checkMsg'></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id='arriveBtn' style="display:none;background-color:#6CDAB2">Yes</button>
        <button type="button" class="btn btn-primary" id='gohomeBtn' style="display:none;background-color:#6CDAB2">Yes</button>
        <button type="button" class="btn btn-primary" id='gooutBtn' style="display:none;background-color:#6CDAB2">Yes</button>
        <button type="button" class="btn btn-primary" id='comebackBtn' style="display:none;background-color:#6CDAB2">Yes</button>
        <button type="button" class="btn btn-primary" id='illnessBtn' style="display:none;background-color:#6CDAB2">Yes</button>
        <button type="button" class="btn btn-secondary" id='workmodalClose2'  data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>

<!-- MESSAGE -->
<div class="modal" id="workMsgModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<p id='workMsg'></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>

<!-- WRONG LOCATION -->
<div class="modal" id="locationModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="color:red">ERROR</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<p>Sorry, you are not in the Office.</p>
      	<p>You're Here</p>
      	<span>Latitude&nbsp;:&nbsp;</span><span id="latiSpan"></span>&emsp;Longitude :&nbsp;<span id="longiSpan"></span>
		<div id="map" style="width:100%;height:400px;"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>