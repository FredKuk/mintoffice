<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	$(document).ready(
			function() {
				$('#psSaveBtn').on('click', function() {
					$.ajax({
						url : 'addps.do',
						method : 'post',
						data : $('form#addPSB').serialize(),
						success : function(data) {
							data = data.trim();
							if (data == '1') { //add Schedule success
								alert('add success');
								$('#personal_schedule').trigger('click');
							} else { //add Schedule failed
								alert('add failed');
								console.log(data);
							}
						}
					});
					return false;
				});

				$('#calendar').fullCalendar(
						{
							customButtons : {
								add : {
									text : 'Add',
									click : function() {
										$('#addPS').modal();
										$('.modal-backdrop')
												.css('opacity', '0').css(
														'z-index', '0');
										$('.modal-dialog').css('z-index', '1');
										$('.modal').css('top', '180px');
									}
								}
							},

							header : {
								left : 'prev,next today',
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
								element.find('.fc-title').css('font-weight','bold').css('color','#202020');
								element.find('.fc-content').append('<div id="event_id" style="display:none;">id&nbsp;:&nbsp;'+event.id+'</div>');  
								element.find('.fc-content').append('<div>place&nbsp;:&nbsp;' + event.place+'</div>').css('color','#404040'); 
								element.find('.fc-content').append('<div>contents&nbsp;:&nbsp;' + event.content+'</div>').css('color','#404040'); 
								/* element.find('.fc-title').append("<br/>" + event.place); 
								element.find('.fc-title').append("<br/>" + event.content);  */
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
								contents : jsonObj.contetns,
								backgroundColor : jsonObj.backgroundColor,
								borderColor:jsonObj.borderColor
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

#addPSB select, input[type=date] {
	display: inline-block;
	width: 22.5%;
	font-size: 13px;
}
</style>
</head>
<br>
<div class="progress-bar bg-warning" role="progressbar" style="width: 8%;background-color:#6CDAB2" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">Team</div>
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
						<label>Title</label><input type="text" name="psTitle">
					</p>
					<p>
						<label>Place</label><input type="text" name="psPlace">
					</p>
					<input type="date" name="psStDate"> <select
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
						style="margin-left: 0px;"> <select class="custom-select"
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
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="psSaveBtn">Save</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>