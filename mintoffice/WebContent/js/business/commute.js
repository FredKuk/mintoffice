/** ********************** day table ************************ */
var cPage = 1;

function initCDT(){
	var dt = new Date();
	// Display the month, day, and year. getMonth() returns a 0-based number.
	var month = dt.getMonth()+1;
	if(month<10){
		month="0"+month;
	}
	var day = dt.getDate();
	if(day<10){
		day="0"+day;
	}
	var year = dt.getFullYear();
	var lday=year+'-'+month+'-01';
	var rday=year+'-'+month+'-'+day;
	$('input[name=ldDate]').val(lday);
	$('input[name=rdDate]').val(rday);
	cPage=1;
	$.ajax({
		method : 'POST',
		url : 'showcdt.do',
		data : {
			ldDate : $('input[name=ldDate').val(),
			rdDate : $('input[name=rdDate').val(),
			page : cPage
		},
		success : function(data) {
			$('#dtBody').empty();
			$('#dtBody').append(data);
		}
	});	
}

$(function() {
	$(document).on("submit", "#cdtForm", function() {
		cPage = 1;
		$.ajax({
			method : 'POST',
			url : 'showcdt.do',
			data : {
				ldDate : $('input[name=ldDate').val(),
				rdDate : $('input[name=rdDate').val(),
				page : cPage
			},
			success : function(data) {
				$('#dtBody').empty();
				$('#dtBody').append(data);
			}
		});
		return false;
	});
	
	$(document).on("click", "#cdtLaquo", function() {
		cPage = Number(cPage)-1;
		console.log('LQ cPage : ' + cPage);
		$.ajax({
			method : 'POST',
			url : 'showcdt.do',
			data : {
				ldDate : $('input[name=ldDate').val(),
				rdDate : $('input[name=rdDate').val(),
				page : cPage
			},
			success : function(data) {
				$('#dtBody').empty();
				$('#dtBody').append(data);
			}
		});
	});
	
	$(document).on("click", "#cdtRaquo", function() {
		cPage = Number(cPage)+1;
		console.log('RQ cPage : ' + cPage);
		$.ajax({
			method : 'POST',
			url : 'showcdt.do',
			data : {
				ldDate : $('input[name=ldDate').val(),
				rdDate : $('input[name=rdDate').val(),
				page : cPage
			},
			success : function(data) {
				$('#dtBody').empty();
				$('#dtBody').append(data);
			}
		});
	});
	
	$(document).on("click", ".cdtPageNum", function() {
		cPage = $(this).text();
		console.log('cPage : ' + cPage);
		$.ajax({
			method : 'POST',
			url : 'showcdt.do',
			data : {
				ldDate : $('input[name=ldDate').val(),
				rdDate : $('input[name=rdDate').val(),
				page : cPage
			},
			success : function(data) {
				$('#dtBody').empty();
				$('#dtBody').append(data);
			}
		});
	});
});

/** ********************** month table ************************ */
var workDaySum = 0;
var goodDaySum = 0;
var lateDaySum = 0;
var earlyDaySum = 0;
var sickDaySum = 0;
var overWorkSum = 0;

var month = 0;
var workDay = 0;
var goodDay = 0;
var lateDay = 0;
var earlyDay = 0;
var sickDay = 0;
var overWork = 0;

/* searching */
$(document).on("click", "#mtBtn", function() {
	showmtYear();
});

function showmtYear() {
	$.ajax({
		url : 'showmtyear.do',
		data : {
			year : $('#mtSelect').val()
		},
		method : 'post',
		success : function(data) {
			$('#mtTbody').empty();
			$('#mtTfoot').empty();
			workDaySum = 0;
			goodDaySum = 0;
			lateDaySum = 0;
			earlyDaySum = 0;
			sickDaySum = 0;
			overWorkSum = 0;

			var jsonArrObj = JSON.parse(data);
			$(jsonArrObj).each(
					function(index, jsonObj) {
						month = jsonObj.month;
						workDay = jsonObj.workDay;
						goodDay = jsonObj.goodDay;
						lateDay = jsonObj.lateDay;
						earlyDay = jsonObj.earlyDay;
						sickDay = jsonObj.sickDay;
						overWork = jsonObj.overWork;

						workDaySum += workDay;
						goodDaySum += goodDay;
						lateDaySum += lateDay;
						earlyDaySum += earlyDay;
						sickDaySum += sickDay;
						overWorkSum += overWork;

						var gw = goodDay / workDay * 100;
						var color = "";
						if (gw > 90) {
							color = "#6495ED";
						} else if (gw > 75) {
							color = "#808000";
						} else {
							color = "#FF4500";
						}

						$('#mtTbody').append(
								'<tr class="monthWorkTimeContents">');
						$('#mtTbody').append('<td>' + month + '월</td>');
						$('#mtTbody').append('<td>' + workDay + '</td>');
						$('#mtTbody').append(
								'<td>' + goodDay + '/' + workDay
										+ '&nbsp;<span style="color:' + color
										+ '">(' + gw.toFixed(1)
										+ '%)</span></td>');
						$('#mtTbody').append('<td>' + lateDay + '</td>');
						$('#mtTbody').append('<td>' + earlyDay + '</td>');
						$('#mtTbody').append('<td>' + sickDay + '</td>');
						$('#mtTbody').append('<td>' + overWork + '</td>');
						$('#mtTbody').append('</tr>');
					});
			var gwS = goodDaySum / workDaySum * 100;
			var colorS = "";
			if (gwS > 90) {
				colorS = "#6495ED";
			} else if (gwS > 75) {
				colorS = "#808000";
			} else {
				colorS = "#FF4500";
			}
			$('#mtTfoot').append('<td> 1~12월 </td>');
			$('#mtTfoot').append('<td>' + workDaySum + '</td>');
			$('#mtTfoot').append(
					'<td>' + goodDaySum + '/' + workDaySum
							+ '&nbsp;<span style="color:' + colorS + '">('
							+ gwS.toFixed(1) + '%)</td>');
			$('#mtTfoot').append('<td>' + lateDaySum + '</td>');
			$('#mtTfoot').append('<td>' + earlyDaySum + '</td>');
			$('#mtTfoot').append('<td>' + sickDaySum + '</td>');
			$('#mtTfoot').append('<td>' + overWorkSum + '</td>');
		}
	});
}
/** ********************** work Calendar ************************ */

/* SET MODAL LOCATION */
function setMLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(setMSpan);
	} else {
		x.innerHTML = "Geolocation is not supported by this browser.";
	}
}
function setMSpan(position) {
	console.log('lati : '+position.coords.latitude);
	console.log('longi : '+position.coords.longitude);
	$('#latiSpan').text(position.coords.latitude);
	$('#longiSpan').text(position.coords.longitude);
}

/* SETTING MAP */
function myMap() {
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 17,
		center : new google.maps.LatLng($('#latiSpan').text(), $('#longiSpan')
				.text())
	});
	var marker = new google.maps.Marker({
		position : new google.maps.LatLng($('#latiSpan').text(),
				$('#longiSpan').text()),
		map : map
	});
}

function googlemap(){
/* ADD GOOGLE API */
	if (!window.google || !window.google.maps) {
		var script = document.createElement('script');
		script.type = 'text/javascript';
		script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyBfIrqaBsk7v_DFG5BVrxbTuRcT3hvAhqo';
		document.body.appendChild(script);
	}
}

/* 달력 로직 */

function workCalendar() {
	$('#calendar').fullCalendar({
		customButtons : {
			arrive : {
				text : 'Arrive',
				click : function() {
					openWorkModal();
					$('#checkMsg').empty();
					$('#checkMsg').text('Do you want to record your arrival time?');
					$('#arriveBtn').css('display', 'initial');
				}
			},
			gohome : {
				text : 'Go home',
				click : function() {
					openWorkModal();
					$('#checkMsg').empty();
					$('#checkMsg').text('Do you want to finish your work today?');
					$('#gohomeBtn').css('display', 'initial');
				}
			},
			goOut : {
				text : 'Go Out',
				click : function() {
					openWorkModal();
					$('#checkMsg').empty();
					$('#checkMsg').text('Do you want to record your outside office work?');
					$('#gooutBtn').css('display', 'initial');
				}
			},
			comeBack : {
				text : 'Comeback',
				click : function() {
					openWorkModal();
					$('#checkMsg').empty();
					$('#checkMsg').text('Do you want to end your outside work recording?');
					$('#comebackBtn').css('display', 'initial');
				}
			},
			sick : {
				text : 'Illness',
				click : function() {
					openWorkModal();
					$('#checkMsg').empty();
					$('#checkMsg').text('Do you want to leave early today?');
					$('#illnessBtn').css('display', 'initial');
				}
			}
		},
		
		header : {
			left : 'prev,next arrive gohome',
			center : 'title',
			/* right: 'month,agendaWeek,agendaDay' */
			right : 'goOut comeBack sick'
		},

		defaultDate : new Date(),
		navLinks : false, // can click day/week names to
		// navigate
		// views
		editable : false,
		eventLimit : false,
		displayEventTime : false,
		events: 
			function(start, end, timezone, callback) {
				$.ajax({
					method : 'POST',
					url : 'showwcm.do',
					data: {
						start: start.unix(),
						end: end.unix()
					},
					success : function(data) {
						var events = [];
						var jsonArrObj = JSON.parse(data);
						$(jsonArrObj).each(function(index, jsonObj) {
							events.push({
								id : jsonObj.id,
								title : jsonObj.title,
								start : jsonObj.start,
								end : jsonObj.end,
								sTime : jsonObj.sTime,
								eTime : jsonObj.eTime,
								com_late : jsonObj.com_late,
								com_sick : jsonObj.com_sick,
								backgroundColor : jsonObj.backgroundColor,
								borderColor : jsonObj.borderColor
							});
						});
						callback(events);
					}
				});
			},
		eventRender : function(event, element) {
			element.attr("com_late", event.categoryname),
			element.attr("com_sick",event.categoryname),
			element.attr("sTime", event.categoryname),
			element.attr("eTime", event.categoryname),
			element.find('.fc-title').css('font-weight', 'bold').css('color','#202020');
			element.find('.fc-content').append('<div>' + event.sTime + '~' + event.eTime+ '</div>').css('color', '#404040');
			element.find('.fc-content').on('click',function() {
				if (event.kind == 0) {
					$('#modifyPS').modal();
					$('.modal-backdrop').css('opacity','0').css('z-index', '0');
					$('.modal-dialog').css('z-index','1');
					$('.modal').css('top', '180px');
					$('#modifyT').val(event.title);
					$('#modifyP').val(event.place);
					$('#modifyC').text(event.contents);
					$('#modifyN').val(event.id);
				} else {
					$('#unableMod').modal();
					$('.modal-backdrop').css('opacity','0').css('z-index', '0');
					$('.modal-dialog').css('z-index','1');
					$('.modal').css('top', '180px');
					return;
				}
			});
		}
	});
}
/* 달력로직 끝 */

/* show work Calendar */
function showWorkCalendar() {
	$.ajax({
		method : 'POST',
		url : 'showwc.do',
		success : function(data) {
			var jsonArrObj = JSON.parse(data);
			$(jsonArrObj).each(function(index, jsonObj) {
				$('#calendar').fullCalendar('renderEvent', {
					id : jsonObj.id,
					title : jsonObj.title,
					start : jsonObj.start,
					end : jsonObj.end,
					sTime : jsonObj.sTime,
					eTime : jsonObj.eTime,
					com_late : jsonObj.com_late,
					com_sick : jsonObj.com_sick,
					backgroundColor : jsonObj.backgroundColor,
					borderColor : jsonObj.borderColor
				}, true);
			});
		}
	});
}


/* 모달 백드롭 처리 */
function openWorkModal() {
	$("#workModal").modal();
	$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
	$('.modal-dialog').css('z-index', '1');
	$('.modal').css('top', '180px');
	$('#workMsg').empty();
}

function openMsgModal() {
	console.log("commutejs : openMsgModal() START");
	$('#workMsgModal').modal();
	$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
	$('.modal-dialog').css('z-index', '1');
	$('.modal').css('top', '180px');
	console.log("commutejs : openMsgModal() END");
}

function noneBtn() {
	$('#arriveBtn').css('display', 'none');
	$('#gohomeBtn').css('display', 'none');
	$('#gooutBtn').css('display', 'none');
	$('#comebackBtn').css('display', 'none');
	$('#illnessBtn').css('display', 'none');
}


$(function() {
	/* 모달 닫는다 button display none */
	$(document).on('click', '#workmodalClose', function() {
		noneBtn();
	});

	/* 모달 닫는다 button display none */
	$(document).on('click', '#workmodalClose2', function() {
		noneBtn();
	});
	
	$(document).on('click','#workMsgModal button',function(){
		$('#workCalendar').trigger('click');
	});
	/* 출근 클릭 */
	$(document).on(	'click','#arriveBtn',function() {
		if (($('#latiSpan').text()>37.4)&&($('#latiSpan').text()<37.5)&&($('#longiSpan').text()<127)&&($('#longiSpan').text()>126.8)) {
		//if ($('#latiSpan').text() > 311 && $('#longiSpan').text() > 1261) {
			$('#arriveBtn').css('display', 'none');
			$.ajax({
				url : 'commute.do',
				data : {commute : 'arrive'},
				method : 'post',
				success : function(data) {
					$("#workModal").modal('toggle');
					console.log(data);
					console.log(data.indexOf('Opps'));
					if (data == 1) { // success
						console.log("commutejs: here");
						openMsgModal();
						$('#workMsg').text('Arrival has been recorded.').css('color', '#43A479');
					} else if (data.indexOf('Opps') != -1) {
						openMsgModal();
						$('#workMsg').text(data).css('color', '#FF4500');
					} else { // failed
						alert('error! : ' + data);
					}
					//$('#workCalendar').trigger('click');
				}
			});
		} else {
			$('#arriveBtn').css('display', 'none');
			$("#workModal").modal('toggle');
			myMap();
			$('#locationModal').modal();
			$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
			$('.modal-dialog').css('z-index', '1');
			$('.modal').css('top', '180px');
		}
	});

	/* 퇴근 클릭 */
	$(document).on(	'click','#gohomeBtn',function() {
		$('#gohomeBtn').css('display', 'none');
		$.ajax({
			url : 'commute.do',
			data : {commute : 'gohome'},
			method : 'post',
			async : false,
			success : function(data) {
				$("#workModal").modal('toggle');
				if (data == 1) { // success
					openMsgModal();
					$('#workMsg').text('Go-home has been recorded.').css('color', '#43A479');
				} else if (data.indexOf('Opps') != -1) {
					openMsgModal();
					$('#workMsg').text(data).css('color', '#FF4500');
				} else { // failed
					alert('error! : ' + data);
				}
				//$('#workCalendar').trigger('click');
			}
		});
		return false;
	});

	/* 외근 시작 클릭 */
	$(document).on(	'click','#gooutBtn',function() {
		$('#gooutBtn').css('display', 'none');
		$.ajax({
			url : 'commute.do',
			data : {
				commute : 'goout'
			},
			method : 'post',
			async : false,
			success : function(data) {
				$("#workModal").modal('toggle');
				if (data == 1) { // success
					openMsgModal();
					$('#workMsg').text('Go-Out has been recorded.').css('color', '#43A479');
				} else if (data.indexOf('Opps') != -1) {
					openMsgModal();
					$('#workMsg').text(data).css('color', '#FF4500');
				} else { // failed
					alert('error! : ' + data);
				}
				//$('#workCalendar').trigger('click');
			}
		});
		//return false;
	});

	/* 외근 복귀 클릭 */
	$(document).on(	'click','#comebackBtn',	function() {
		$('#comebackBtn').css('display', 'none');
		$.ajax({
			url : 'commute.do',
			data : {commute : 'comeback'},
			method : 'post',
			async : false,
			success : function(data) {
				$("#workModal").modal('toggle');
				if (data == 1) { // success
					openMsgModal();
					$('#workMsg').text('Comeback has been recorded.').css('color', '#43A479');
				} else if (data.indexOf('Opps') != -1) {
					openMsgModal();
					$('#workMsg').text(data).css('color', '#FF4500');
				} else { // failed
					alert('error! : ' + data);
				}
				//$('#workCalendar').trigger('click');
			}
		});
		//return false;
	});

	/* 조퇴 클릭 */
	$(document).on(	'click','#illnessBtn',function() {
		$('#illnessBtn').css('display', 'none');
		$.ajax({
			url : 'commute.do',
			data : {commute : 'illness'},
			method : 'post',
			async : false,
			success : function(data) {
				$("#workModal").modal('toggle');
				if (data == 1) { // success
					openMsgModal();
					$('#workMsg').text('Illness has been recorded.').css('color', '#43A479');
				} else if (data.indexOf('Opps') != -1) {
					openMsgModal();
					$('#workMsg').text(data).css('color', '#FF4500');
				} else { // failed
					alert('error! : ' + data);
				}
				//$('#workCalendar').trigger('click');
			}
		});
		//return false;
	});
});