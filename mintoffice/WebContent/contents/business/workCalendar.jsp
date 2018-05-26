<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
  $(document).ready(function() {
		/* SET MODAL LOCATION */
	  function setMLocation() {
			if (navigator.geolocation) {
			    navigator.geolocation.getCurrentPosition(setMSpan);
		    } else { 
		       x.innerHTML = "Geolocation is not supported by this browser.";
		    }
		}
		function setMSpan(position) {
			$('#latiSpan').text(position.coords.latitude);
			$('#longiSpan').text(position.coords.longitude);
		}
		setMLocation();
		
		/*SETTING MAP*/
		function myMap() {
	        var map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 17,
	          center: new google.maps.LatLng($('#latiSpan').text(),$('#longiSpan').text())
	        });
	        var marker = new google.maps.Marker({
	          position: new google.maps.LatLng($('#latiSpan').text(),$('#longiSpan').text()),
	          map: map
	        });
		}	  

		/* ADD GOOGLE API */
	  if(!window.google||!window.google.maps){
		var script = document.createElement('script');
			script.type = 'text/javascript';
			script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyBfIrqaBsk7v_DFG5BVrxbTuRcT3hvAhqo';
			document.body.appendChild(script);
	  }
		
	/*모달 백드롭 처리 */
	function openWorkModal(){
 		$("#workModal").modal();
		$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
		$('.modal-dialog').css('z-index', '1');
		$('.modal').css('top', '180px');
		$('#workMsg').empty();
	}
	function openMsgModal(){
		$('#workMsgModal').modal();
		$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
		$('.modal-dialog').css('z-index', '1');
		$('.modal').css('top', '180px');
	}
	
	function noneBtn(){
		$('#arriveBtn').css('display','none');
 		$('#gohomeBtn').css('display','none');
 		$('#gooutBtn').css('display','none');
 		$('#comebackBtn').css('display','none');
 		$('#illnessBtn').css('display','none');
	}
	/* 모달 닫는다  button display none */
	$('#workmodalClose').on('click',function(){
		noneBtn();
	});
	
	/* 모달 닫는다 button display none */
	$('#workmodalClose2').on('click',function(){
		noneBtn();
	});
	
	/* 출근 클릭 */
	$('#arriveBtn').on('click',function(){
		  if($('#latiSpan').text()>311&&$('#longiSpan').text()>1261){
		    	$('#arriveBtn').css('display','none');
		 		$.ajax({
					url : 'commute.do',
					data: {commute:'arrive'},
					method : 'post',
					async:false,
					success : function(data) {
				 		$("#workModal").modal('toggle');
				 		console.log(data);
				 		console.log(data.indexOf('Opps'));
						if (data == 1) { // success
							openMsgModal();
		 		    		$('#workMsg').text('Arrival has been recorded.').css('color','#43A479');
						} else if(data.indexOf('Opps')!=-1){
							openMsgModal();
		 		    		$('#workMsg').text(data).css('color','#FF4500');
						} else{ // failed
							alert('error! : '+data);
						}
						$('#workCalendar').trigger('click');
					}
				});
		    }else{
		    	$('#arriveBtn').css('display','none');
		 		$("#workModal").modal('toggle');
		 		myMap();
		    	$('#locationModal').modal();
				$('.modal-backdrop').css('opacity', '0').css('z-index', '0');
				$('.modal-dialog').css('z-index', '1');
				$('.modal').css('top', '180px');
		    }
		return false;
	});
	 
	/* 퇴근 클릭 */
	$('#gohomeBtn').on('click',function(){
 		$('#gohomeBtn').css('display','none');
 		$.ajax({
			url : 'commute.do',
			data: {commute:'gohome'},
			method : 'post',
			async:false,
			success : function(data) {
		 		$("#workModal").modal('toggle');
				if (data == 1) { // success
					openMsgModal();
 		    		$('#workMsg').text('Go-home has been recorded.').css('color','#43A479');
				} else if(data.indexOf('Opps')!=-1){
					openMsgModal();
 		    		$('#workMsg').text(data).css('color','#FF4500');
				} else{ // failed
					alert('error! : '+data);
				}
				$('#workCalendar').trigger('click');
			}
		});
		return false;
	});
	
	/* 외근 시작  클릭 */
	$('#gooutBtn').on('click',function(){
 		$('#gooutBtn').css('display','none');
 		$.ajax({
			url : 'commute.do',
			data: {commute:'goout'},
			method : 'post',
			async:false,
			success : function(data) {
		 		$("#workModal").modal('toggle');
				if (data == 1) { // success
					openMsgModal();
 		    		$('#workMsg').text('Go-Out has been recorded.').css('color','#43A479');
				} else if(data.indexOf('Opps')!=-1){
					openMsgModal();
 		    		$('#workMsg').text(data).css('color','#FF4500');
				} else{ // failed
					alert('error! : '+data);
				}
				$('#workCalendar').trigger('click');
			}
		});
		return false;
	});
	
	/* 외근 복귀 클릭 */
	$('#comebackBtn').on('click',function(){
 		$('#comebackBtn').css('display','none');
 		$.ajax({
			url : 'commute.do',
			data: {commute:'comeback'},
			method : 'post',
			async:false,
			success : function(data) {
		 		$("#workModal").modal('toggle');
				if (data == 1) { // success
					openMsgModal();
 		    		$('#workMsg').text('Comeback has been recorded.').css('color','#43A479');
				} else if(data.indexOf('Opps')!=-1){
					openMsgModal();
 		    		$('#workMsg').text(data).css('color','#FF4500');
				} else{ // failed
					alert('error! : '+data);
				}
				$('#workCalendar').trigger('click');
			}
		});
		return false;
	});
	
	/* 조퇴 클릭 */
	$('#illnessBtn').on('click',function(){
 		$('#illnessBtn').css('display','none');
 		$.ajax({
			url : 'commute.do',
			data: {commute:'illness'},
			method : 'post',
			async:false,
			success : function(data) {
		 		$("#workModal").modal('toggle');
				if (data == 1) { // success
					openMsgModal();
 		    		$('#workMsg').text('Illness has been recorded.').css('color','#43A479');
				} else if(data.indexOf('Opps')!=-1){
					openMsgModal();
 		    		$('#workMsg').text(data).css('color','#FF4500');
				} else{ // failed
					alert('error! : '+data);
				}
				$('#workCalendar').trigger('click');
			}
		});
		return false;
	});
	
	/*$('#myzz').attr("data-toggle","modal").attr("data-target","#myModal").attr("id","myzz");*/
	
	/* 달력 로직 */
    $('#calendar').fullCalendar({
    	customButtons: {
 			arrive: {
 		    	text: 'Arrive',
 		    	click: function() {
 		    		openWorkModal();
 		    		$('#checkMsg').empty();
 		    		$('#checkMsg').text('Do you want to record your arrival time?');
 		    		$('#arriveBtn').css('display','initial');
 		    	}
 		    },
 		    gohome: {
 		    	text: 'Go home',
 				click: function() {
 		    		openWorkModal();
 		    		$('#checkMsg').empty();
 		    		$('#checkMsg').text('Do you want to finish your work today?');
 		    		$('#gohomeBtn').css('display','initial');
 				}
 		     },
 			goOut: {
 				text: 'Go Out',
 				click: function() {
 		    		openWorkModal();
 		    		$('#checkMsg').empty();
 		    		$('#checkMsg').text('Do you want to record your outside office work?');
 		    		$('#gooutBtn').css('display','initial');
 				}
 			 },
 			comeBack: {
 				text: 'Comeback',
 				click: function() {
 		    		openWorkModal();
 		    		$('#checkMsg').empty();
 		    		$('#checkMsg').text('Do you want to end your outside work recording?');
 		    		$('#comebackBtn').css('display','initial');
 				}
 			},
 			sick: {
 				text: 'Illness',
 				click: function() {
 		    		openWorkModal();
 		    		$('#checkMsg').empty();
 		    		$('#checkMsg').text('Do you want to leave early today?');
 		    		$('#illnessBtn').css('display','initial');
 				}
 			}
 		},
    	header: {
        left: 'prev,next arrive gohome',
        center: 'title',
        /* right: 'month,agendaWeek,agendaDay' */
		right: 'goOut comeBack sick'
      },
      
      defaultDate: new Date(),
      navLinks: false, // can click day/week names to navigate views
      editable: false,
      eventLimit: false,
      displayEventTime: false,
		eventRender : function(event, element) {
			element.attr("com_late", event.categoryname),
			element.attr("com_sick",event.categoryname),
			element.attr("sTime",event.categoryname),
			element.attr("eTime",event.categoryname),
			element.find('.fc-title').css('font-weight','bold').css('color','#202020');
			element.find('.fc-content').append('<div>'+event.sTime+'~'+event.eTime+'</div>').css('color','#404040');
			/* element.find('.fc-content').append('<div>Start&nbsp;:&nbsp;' + event.sTime+'</div>').css('color','#404040'); 
			element.find('.fc-content').append('<div>End&nbsp;:&nbsp;' + event.eTime+'</div>').css('color','#404040'); */
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
    /*달력로직 끝 */
    
	/* show work Calendar */
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
					sTime:jsonObj.sTime,
					eTime:jsonObj.eTime,
					com_late : jsonObj.com_late,
					com_sick : jsonObj.com_sick,
					backgroundColor : jsonObj.backgroundColor,
					borderColor:jsonObj.borderColor
				}, true);
			});
		}
	});		
  });/*함수끝*/
</script>

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