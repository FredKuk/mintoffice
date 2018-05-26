<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	$(document).ready(
			function() {
				/* add submit */
				$('#addPSB').on('submit', function() {
					$.ajax({
						url : 'addps.do',
						method : 'post',
						data : $('form#addPSB').serialize(),
						success : function(data) {
							data = data.trim();
							if (data == '1') { //add Schedule success
								$('#addPS').modal('toggle');
								$('#addSuccess').modal();
								$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
								$('.modal-dialog').css('z-index', '1');
								$('.modal').css('top', '180px');
							} else { //add Schedule failed
								$('#addPS').modal('toggle');
								$('#addFailed').modal();
								$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
								$('.modal-dialog').css('z-index', '1');
								$('.modal').css('top', '180px');
								console.log(data);
							}
						}
					});
					return false;
				});
				
				/* modify submit */
				$('#modifyPSB').on('submit', function() {
					$.ajax({
						url : 'modifyps.do',
						method : 'post',
						data : $('form#modifyPSB').serialize(),
						success : function(data) {
							data = data.trim();
							if (data == '1') { //modify Schedule success
								$('#modifyPS').modal('toggle');
								$('#modSuccess').modal();
								$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
								$('.modal-dialog').css('z-index', '1');
								$('.modal').css('top', '180px');
							} else { //modify Schedule failed
								$('#modifyPS').modal('toggle');
								$('#modFailed').modal();
								$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
								$('.modal-dialog').css('z-index', '1');
								$('.modal').css('top', '180px');
								console.log(data);
							}
						}
					});
					return false;
				});
				
				/* Delete clicked */
				$('#psdeleteBtn').on('click', function() {
					$.ajax({
						url : 'deleteps.do',
						method : 'post',
						data : {'schedule_no': $('#modifyN').val()},
						success : function(data) {
							data = data.trim();
							if (data == '1') { //modify Schedule success
								$('#modifyPS').modal('toggle');
								$('#delSuccess').modal();
								$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
								$('.modal-dialog').css('z-index', '1');
								$('.modal').css('top', '180px');
							} else { //modify Schedule failed
								$('#modifyPS').modal('toggle');
								$('#delFailed').modal();
								$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
								$('.modal-dialog').css('z-index', '1');
								$('.modal').css('top', '180px');
								console.log(data);
							}
						}
					});
					return false;
				});
				
				/* add success btn*/
				$('#addSuccessBtn').on('click', function() {
					$('#addSuccess').modal('toggle');
					$('#schedule').trigger('click');
				});
				
				/* add failed btn*/
				$('#addFailedBtn').on('click', function() {
					$('#addFailed').modal('toggle');
				});
				
				/* mod success btn*/
				$('#modSuccessBtn').on('click', function() {
					$('#modSuccess').modal('toggle');
					$('#schedule').trigger('click');
				});
				
				/* mod failed btn*/
				$('#modFailedBtn').on('click', function() {
					$('#modFailed').modal('toggle');
				});
				
				/* del success btn*/
				$('#delSuccessBtn').on('click', function() {
					$('#delSuccess').modal('toggle');
					$('#schedule').trigger('click');
				});
				
				/* del failed btn*/
				$('#delFailedBtn').on('click', function() {
					$('#delFailed').modal('toggle');
				});
				
				
				/* calendar part */	
				$('#calendar').fullCalendar(
						{
							customButtons : {
								add : {
									text : 'Add',
									click : function() {
										$('#addPS').modal();
										$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
										$('.modal-dialog').css('z-index', '1');
										$('.modal').css('top', '180px');
									}
								}
							},

							header : {
								left : 'prev,next today add',
								center : 'title',
								/* right: 'month,basicWeek,basicDay' */
								right : 'month,agendaWeek,agendaDay'
							},
							defaultDate : new Date(),
							navLinks : true, // can click day/week names to navigate views
							editable : true,
							eventLimit : true, // allow "more" link when too many events
							displayEventTime: false,
							eventRender : function(event, element) {
								element.attr("contents", event.categoryname),
								element.attr("place",event.categoryname),
								element.attr("kind",event.categoryname),
								element.find('.fc-title').css('font-weight','bold').css('color','#202020');
								element.find('.fc-content').append('<div>place&nbsp;:&nbsp;' + event.place+'</div>').css('color','#404040'); 
								element.find('.fc-content').append('<div>contents&nbsp;:&nbsp;' + event.contents+'</div>').css('color','#404040');
								element.find('.fc-content').append('<div id="event_kind" style="display:none">'+event.kind+'</div>').css('color','#404040');
								/* element.find('.fc-content').append('<input type="text" name="modify_no" style="display:none;" value='+event.id+'>');  */ 
								/*element.find('.fc-title').append("<br/>" + event.place); 
								element.find('.fc-title').append("<br/>" + event.content);  */
								element.find('.fc-content').on('click', function() {
									if(event.kind==0){
										$('#modifyPS').modal();
										$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
										$('.modal-dialog').css('z-index', '1');
										$('.modal').css('top', '180px');
										$('#modifyT').val(event.title);
										$('#modifyP').val(event.place);
										$('#modifyC').text(event.contents);
										$('#modifyN').val(event.id);
									}else{
										$('#unableMod').modal();
										$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
										$('.modal-dialog').css('z-index', '1');
										$('.modal').css('top', '180px');
										return;
									}
								});
							}
						});
				
				/* show personal Schedule */
				$.ajax({
					method : 'POST',
					url : 'showps.do',
					success : function(data) {
						var jsonArrObj = JSON.parse(data);
						$(jsonArrObj).each(function(index, jsonObj) {
							$('#calendar').fullCalendar('renderEvent', {
								id : jsonObj.id,
								title : jsonObj.title,
								place : jsonObj.place,
								start : jsonObj.start,
								end : jsonObj.end,
								contents : jsonObj.contents,
								backgroundColor : jsonObj.backgroundColor,
								borderColor:jsonObj.borderColor,
								kind:jsonObj.kind
							}, true);
						});
					}
				});
				
				/* show team Schedule */
				$.ajax({
					method : 'POST',
					url : 'showts.do',
					success : function(data) {
						var jsonArrObj = JSON.parse(data);
						$(jsonArrObj).each(function(index, jsonObj) {
							$('#calendar').fullCalendar('renderEvent', {
								id : jsonObj.id,
								title : jsonObj.title,
								place : jsonObj.place,
								start : jsonObj.start,
								end : jsonObj.end,
								contents : jsonObj.contents,
								backgroundColor : jsonObj.backgroundColor,
								borderColor:jsonObj.borderColor,
								kind:jsonObj.kind
							}, true);
						});
					}
				});
				
				/* show company Schedule */
				$.ajax({
					method : 'POST',
					url : 'showcs.do',
					success : function(data) {
						var jsonArrObj = JSON.parse(data);
						$(jsonArrObj).each(function(index, jsonObj) {
							$('#calendar').fullCalendar('renderEvent', {
								id : jsonObj.id,
								title : jsonObj.title,
								place : jsonObj.place,
								start : jsonObj.start,
								end : jsonObj.end,
								contents : jsonObj.contents,
								backgroundColor : jsonObj.backgroundColor,
								borderColor:jsonObj.borderColor,
								kind:jsonObj.kind
							}, true);
						});
					}
				});
			});
</script>

<style>
.fc-sun {
	color: orange;
}

.fc-sat {
	color: lightblue;
}

/*   body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  } */
#calendar {
	width: 90%;
	margin-bottom: 15px;
}

#addPSB {
	margin-left: 2px;
}

#addPSB label {
	display: inline-block;
	width: 13%;
}

#addPSB input[type=text] {
	display: inline-block;
	width: 85%;
}

#addPSB select{
	display: inline-block;
	width: 20%;
	font-size: 12px;
}
#addPSB input[type=date] {
	display: inline-block;
	width: 26%;
	font-size: 12px;
}



#modifyPSB {
	margin-left: 2px;
}

#modifyPSB label {
	display: inline-block;
	width: 13%;
}

#modifyPSB input[type=text] {
	display: inline-block;
	width: 85%;
}

#modifyPSB select{
	display: inline-block;
	width: 20%;
	font-size: 12px;
}
#modifyPSB input[type=date] {
	display: inline-block;
	width: 26%;
	font-size: 12px;
}

</style>
</head>
<br>
<div class="progress" style="width:24%">
  <div class="progress-bar" role="progressbar" style="width: 33%;background-color:#6CDAB2" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">Personal</div>
  <div class="progress-bar bg-warning" role="progressbar" style="width: 33%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">Team</div>
  <div class="progress-bar bg-info" role="progressbar" style="width: 33%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">Company</div>
</div>
<br>
<div id='calendar'></div>

<div class="modal" id="addPS">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Personal Schedule</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="addPSB">
					<p>
						<label>Title</label><input type="text" name="psTitle" required>
					</p>
					<p>
						<label>Place</label><input type="text" name="psPlace" required>
					</p>
					<input type="date" name="psStDate" required> <select
						class="custom-select" name="psStHour">
						<option value="00:00">12:00 AM</option>
						<option value="00:30">12:30 AM</option>
						<option value="01:00">01:00 AM</option>
						<option value="01:30">01:30 AM</option>
						<option value="02:00">02:00 AM</option>
						<option value="02:30">02:30 AM</option>
						<option value="03:00">03:00 AM</option>
						<option value="03:30">03:30 AM</option>
						<option value="04:00">04:00 AM</option>
						<option value="04:30">04:30 AM</option>
						<option value="05:00">05:00 AM</option>
						<option value="05:30">05:30 AM</option>
						<option value="06:00">06:00 AM</option>
						<option value="06:30">06:30 AM</option>
						<option value="07:00">07:00 AM</option>
						<option value="07:30">07:30 AM</option>
						<option value="08:00" selected>08:00 AM</option>
						<option value="08:30">08:30 AM</option>
						<option value="09:00">09:00 AM</option>
						<option value="09:30">09:30 AM</option>
						<option value="10:00">10:00 AM</option>
						<option value="10:30">10:30 AM</option>
						<option value="11:00">11:00 AM</option>
						<option value="11:30">11:30 AM</option>
						<option value="12:00">12:00 PM</option>
						<option value="12:30">12:30 PM</option>
						<option value="13:00">01:00 PM</option>
						<option value="13:30">01:30 PM</option>
						<option value="14:00">02:00 PM</option>
						<option value="14:30">02:30 PM</option>
						<option value="15:00">03:00 PM</option>
						<option value="15:30">03:30 PM</option>
						<option value="16:00">04:00 PM</option>
						<option value="16:30">04:30 PM</option>
						<option value="17:00">05:00 PM</option>
						<option value="17:30">05:30 PM</option>
						<option value="18:00">06:00 PM</option>
						<option value="18:30">06:30 PM</option>
						<option value="19:00">07:00 PM</option>
						<option value="19:30">07:30 PM</option>
						<option value="20:00">08:00 PM</option>
						<option value="20:30">08:30 PM</option>
						<option value="21:00">09:00 PM</option>
						<option value="21:30">09:30 PM</option>
						<option value="22:00">10:00 PM</option>
						<option value="22:30">10:30 PM</option>
						<option value="23:00">11:00 PM</option>
						<option value="23:30">11:30 PM</option>
					</select>&nbsp;~&nbsp; <input type="date" name="psEndDate"
						style="margin-left: 0px;" required> <select class="custom-select"
						name="psEndHour">
						<option value="00:00">12:00 AM</option>
						<option value="00:30">12:30 AM</option>
						<option value="01:00">01:00 AM</option>
						<option value="01:30">01:30 AM</option>
						<option value="02:00">02:00 AM</option>
						<option value="02:30">02:30 AM</option>
						<option value="03:00">03:00 AM</option>
						<option value="03:30">03:30 AM</option>
						<option value="04:00">04:00 AM</option>
						<option value="04:30">04:30 AM</option>
						<option value="05:00">05:00 AM</option>
						<option value="05:30">05:30 AM</option>
						<option value="06:00">06:00 AM</option>
						<option value="06:30">06:30 AM</option>
						<option value="07:00">07:00 AM</option>
						<option value="07:30">07:30 AM</option>
						<option value="08:00">08:00 AM</option>
						<option value="08:30">08:30 AM</option>
						<option value="09:00" selected>09:00 AM</option>
						<option value="09:30">09:30 AM</option>
						<option value="10:00">10:00 AM</option>
						<option value="10:30">10:30 AM</option>
						<option value="11:00">11:00 AM</option>
						<option value="11:30">11:30 AM</option>
						<option value="12:00">12:00 PM</option>
						<option value="12:30">12:30 PM</option>
						<option value="13:00">01:00 PM</option>
						<option value="13:30">01:30 PM</option>
						<option value="14:00">02:00 PM</option>
						<option value="14:30">02:30 PM</option>
						<option value="15:00">03:00 PM</option>
						<option value="15:30">03:30 PM</option>
						<option value="16:00">04:00 PM</option>
						<option value="16:30">04:30 PM</option>
						<option value="17:00">05:00 PM</option>
						<option value="17:30">05:30 PM</option>
						<option value="18:00">06:00 PM</option>
						<option value="18:30">06:30 PM</option>
						<option value="19:00">07:00 PM</option>
						<option value="19:30">07:30 PM</option>
						<option value="20:00">08:00 PM</option>
						<option value="20:30">08:30 PM</option>
						<option value="21:00">09:00 PM</option>
						<option value="21:30">09:30 PM</option>
						<option value="22:00">10:00 PM</option>
						<option value="22:30">10:30 PM</option>
						<option value="23:00">11:00 PM</option>
						<option value="23:30">11:30 PM</option>
					</select>
					<p style="margin-bottom: 5px; margin-top: 12px;">Contents</p>
					<p style="margin-bottom: 0px">
						<textarea rows="4" cols="10" style="width:100%" name="psContents"></textarea>
					</p>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success" id="psSaveBtn">Save</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="modifyPS">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modify Personal Schedule</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modifyPSB">
					<p>
						<label>Title</label><input type="text" id="modifyT"name="modifyTitle" required>
					</p>
					<p>
						<label>Place</label><input type="text" id="modifyP" name="modifyPlace" required>
					</p>
					<input type="date" name="modifyStDate"required> <select
						class="custom-select" name="modifyStHour">
						<option value="00:00">12:00 AM</option>
						<option value="00:30">12:30 AM</option>
						<option value="01:00">01:00 AM</option>
						<option value="01:30">01:30 AM</option>
						<option value="02:00">02:00 AM</option>
						<option value="02:30">02:30 AM</option>
						<option value="03:00">03:00 AM</option>
						<option value="03:30">03:30 AM</option>
						<option value="04:00">04:00 AM</option>
						<option value="04:30">04:30 AM</option>
						<option value="05:00">05:00 AM</option>
						<option value="05:30">05:30 AM</option>
						<option value="06:00">06:00 AM</option>
						<option value="06:30">06:30 AM</option>
						<option value="07:00">07:00 AM</option>
						<option value="07:30">07:30 AM</option>
						<option value="08:00" selected>08:00 AM</option>
						<option value="08:30">08:30 AM</option>
						<option value="09:00">09:00 AM</option>
						<option value="09:30">09:30 AM</option>
						<option value="10:00">10:00 AM</option>
						<option value="10:30">10:30 AM</option>
						<option value="11:00">11:00 AM</option>
						<option value="11:30">11:30 AM</option>
						<option value="12:00">12:00 PM</option>
						<option value="12:30">12:30 PM</option>
						<option value="13:00">01:00 PM</option>
						<option value="13:30">01:30 PM</option>
						<option value="14:00">02:00 PM</option>
						<option value="14:30">02:30 PM</option>
						<option value="15:00">03:00 PM</option>
						<option value="15:30">03:30 PM</option>
						<option value="16:00">04:00 PM</option>
						<option value="16:30">04:30 PM</option>
						<option value="17:00">05:00 PM</option>
						<option value="17:30">05:30 PM</option>
						<option value="18:00">06:00 PM</option>
						<option value="18:30">06:30 PM</option>
						<option value="19:00">07:00 PM</option>
						<option value="19:30">07:30 PM</option>
						<option value="20:00">08:00 PM</option>
						<option value="20:30">08:30 PM</option>
						<option value="21:00">09:00 PM</option>
						<option value="21:30">09:30 PM</option>
						<option value="22:00">10:00 PM</option>
						<option value="22:30">10:30 PM</option>
						<option value="23:00">11:00 PM</option>
						<option value="23:30">11:30 PM</option>
					</select>&nbsp;~&nbsp; <input type="date" name="modifyEndDate"
						style="margin-left: 0px;" required> <select class="custom-select"
						name="modifyEndHour">
						<option value="00:00">12:00 AM</option>
						<option value="00:30">12:30 AM</option>
						<option value="01:00">01:00 AM</option>
						<option value="01:30">01:30 AM</option>
						<option value="02:00">02:00 AM</option>
						<option value="02:30">02:30 AM</option>
						<option value="03:00">03:00 AM</option>
						<option value="03:30">03:30 AM</option>
						<option value="04:00">04:00 AM</option>
						<option value="04:30">04:30 AM</option>
						<option value="05:00">05:00 AM</option>
						<option value="05:30">05:30 AM</option>
						<option value="06:00">06:00 AM</option>
						<option value="06:30">06:30 AM</option>
						<option value="07:00">07:00 AM</option>
						<option value="07:30">07:30 AM</option>
						<option value="08:00">08:00 AM</option>
						<option value="08:30">08:30 AM</option>
						<option value="09:00" selected>09:00 AM</option>
						<option value="09:30">09:30 AM</option>
						<option value="10:00">10:00 AM</option>
						<option value="10:30">10:30 AM</option>
						<option value="11:00">11:00 AM</option>
						<option value="11:30">11:30 AM</option>
						<option value="12:00">12:00 PM</option>
						<option value="12:30">12:30 PM</option>
						<option value="13:00">01:00 PM</option>
						<option value="13:30">01:30 PM</option>
						<option value="14:00">02:00 PM</option>
						<option value="14:30">02:30 PM</option>
						<option value="15:00">03:00 PM</option>
						<option value="15:30">03:30 PM</option>
						<option value="16:00">04:00 PM</option>
						<option value="16:30">04:30 PM</option>
						<option value="17:00">05:00 PM</option>
						<option value="17:30">05:30 PM</option>
						<option value="18:00">06:00 PM</option>
						<option value="18:30">06:30 PM</option>
						<option value="19:00">07:00 PM</option>
						<option value="19:30">07:30 PM</option>
						<option value="20:00">08:00 PM</option>
						<option value="20:30">08:30 PM</option>
						<option value="21:00">09:00 PM</option>
						<option value="21:30">09:30 PM</option>
						<option value="22:00">10:00 PM</option>
						<option value="22:30">10:30 PM</option>
						<option value="23:00">11:00 PM</option>
						<option value="23:30">11:30 PM</option>
					</select>
					<p style="margin-bottom: 5px; margin-top: 12px;">Contents</p>
					<p style="margin-bottom: 0px">
						<textarea rows="4" cols="10" style="width:100%" name="modifyContents" id='modifyC'></textarea>
					</p>
					<input type="text" id='modifyN' name="modify_no" style="display:none;">
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" id="psdeleteBtn">Delete</button>
						<button type="submit" class="btn btn-warning" id="psmodifyBtn">modify</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- mod block -->
<div class="modal" id="unableMod">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Opps!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Only Personal Schedule can be modified.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>

<!-- addsuccess modal-->
<div class="modal" id="addSuccess">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Success</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Add schedule is done</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="addSuccessBtn" class="btn btn-secondary">OK</button>
      </div>
    </div>
  </div>
</div>

<!-- addfailed modal-->
<div class="modal" id="addFailed">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Failed</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Add schedule is failed.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="addFailedBtn" class="btn btn-secondary">OK</button>
      </div>
    </div>
  </div>
</div>

<!-- modsuccess modal-->
<div class="modal" id="modSuccess">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Success</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modifying schedule is done</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="modSuccessBtn" class="btn btn-secondary">OK</button>
      </div>
    </div>
  </div>
</div>

<!-- modfailed modal-->
<div class="modal" id="modFailed">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Failed</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modifying schedule is failed.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="modFailedBtn" class="btn btn-secondary">OK</button>
      </div>
    </div>
  </div>
</div>

<!-- delete Sucess modal-->
<div class="modal" id="delSuccess">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Success</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Delete schedule is done.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="delSuccessBtn" class="btn btn-secondary">OK</button>
      </div>
    </div>
  </div>
</div>

<!-- delete failed modal-->
<div class="modal" id="delFailed">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Failed</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Delete schedule is failed.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="delFailedBtn" class="btn btn-secondary">OK</button>
      </div>
    </div>
  </div>
</div>