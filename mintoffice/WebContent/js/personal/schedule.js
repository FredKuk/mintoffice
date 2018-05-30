/******************* ALL SCHEDULE ******************/
$(function(){
	$(document).on('submit','#addPSB', function() {
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
	$(document).on('submit','#modifyPSB', function() {
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
	$(document).on('click','#psdeleteBtn', function() {
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
	
	/* add success btn */
	$(document).on('click','#addSuccessBtn', function() {
		$('#addSuccess').modal('toggle');
		$('#schedule').trigger('click');
	});
	
	/* add failed btn*/
	$(document).on('click','#addFailedBtn',function() {
		$('#addFailed').modal('toggle');
	});
	
	/* mod success btn*/
	$(document).on('click','#modSuccessBtn', function() {
		$('#modSuccess').modal('toggle');
		$('#schedule').trigger('click');
	});
			
	/* mod failed btn*/
	$(document).on('click','#modFailedBtn', function() {
		$('#modFailed').modal('toggle');
	});
		
	/* del success btn*/
	$(document).on('click','#delSuccessBtn', function() {
		$('#delSuccess').modal('toggle');
		$('#schedule').trigger('click');
	});
			
	/* del failed btn*/
	$(document).on('click','#delFailedBtn', function() {
		$('#delFailed').modal('toggle');
	});	
});


function scheduleCalendar(){
	/* calendar part */	
	$('#calendar').fullCalendar({
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
		googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE",
		eventSources:[{
			googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
			className : "koHolidays",
			color : "#F08080",
			textColor : "#202020",
		}],
		eventRender : function(event, element) {
			element.attr("contents", event.categoryname),
			element.attr("place",event.categoryname),
			element.attr("kind",event.categoryname),
			element.find('.fc-title').css('font-weight','bold').css('color','#202020');
			if(event.place!=null){
				element.find('.fc-title').css('font-weight','bold').css('color','#202020');
				element.find('.fc-content').append('<div>place&nbsp;:&nbsp;' + event.place+'</div>').css('color','#404040'); 
				element.find('.fc-content').append('<div>contents&nbsp;:&nbsp;' + event.contents+'</div>').css('color','#404040');
				element.find('.fc-content').append('<div id="event_kind" style="display:none">'+event.kind+'</div>').css('color','#404040');
			}else{
				element.find('.fc-title').css('font-weight','bold').css('color','#202020').css('font-size','11px');
				element.find('.fc-content').parent('a').removeAttr('href');
			}
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
}


function showPS(){
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
}

function showTS(){
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
}


function showCS(){
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
}