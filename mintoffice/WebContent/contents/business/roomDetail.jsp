<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
	$("#newReservationBtn").click(function(){
        $("#reservationModal").modal();
        $('.modal-backdrop').remove();
	});
	
	$(".dragTable").on("click","div",function(){
		<%--$(this).css("background-color","blue");--%>
		$(this).parent().css("background-color","lightblue");
	});
	
	$(".dragTable").on("dragover","div",function(){
		<%--$(this).css("background-color","blue");--%>
		$(this).parent().css("background-color","lightblue");
	});
	
	$(".dragTable").on("dragstart","div",function(){
		<%--$(this).css("background-color","blue");--%>
		$(this).parent().css("background-color","lightblue");
	});
	
});
</script>
<style>
#roomInformation{
	max-width:92%;
	max-height:88%;
	margin-left: 38px;
	/*overflow:auto;*/
	margin-top: 1px;
}

table{
   width:100%;
   margin:0px;
   padding: 0px;
   border-width: 0px;
}
tr{
	height:40px;
}

.dragTable div{
box-sizing:border-box;
width:100%;
height:100%;
}
.reservationTime{
border: solid;
border-width: 1px;
border-color:#A9A9A9;
}
.reservationTime *{
text-align: center;
}
.reservationTime td{
	width:150px;
}

.dragTable td:hover{
	background-color: lightblue;
}

.modal{
	top:280px;
}
.modal-footer :first-child{
	background-color: #6CDAB2;
}

#reservationModal select{
	width:32%;
}

#newReservationBtn{
width:140px;
background-color:#6CDAB2;
}
</style>
<jsp:include page="roomSearch.jsp"></jsp:include>
<div id= "roomInformation">
	<div class="card mb-3">
		<h3 class="card-header">Room 509</h3>
  		<img style="height: 200px; width: 100%; display: block;" src="image/business/reservation/floor5/room509.png" alt="Card image">
  		<div class="card-body">
    		<h5 class="card-title">Status</h5>
			<p class="card-text"><span class="badge badge-success">Ready</span></p>
			<h5 class="card-title">Capacity</h5>
			<p class="card-text">max : 10<br>min : 6</p>
		</div>
  		<ul class="list-group list-group-flush">
   		 	<li class="list-group-item">
   		 		<h5 class="card-title">Equipment</h5>
   		 		<table class="table-hover">
  					<thead>
   						<tr>
      						<th scope="col"><span>&emsp;</span>Gear</th>
      						<th scope="col"><span>&emsp;</span>Available</th>
    					</tr>	
  					</thead>
  					<tbody>
	    				<tr class="table-success">
      						<th scope="row"><span>&emsp;</span>PC</th>
      						<td><span>&emsp;</span>yes</td>
    					</tr>
    					<tr class="table-success">
      						<th scope="row"><span>&emsp;</span>Beam Projector</th>
      						<td><span>&emsp;</span>yes</td>
    					</tr>
    					<tr class="table-warning">
      						<th scope="row"><span>&emsp;</span>White Board</th>
      						<td><span>&emsp;</span>no</td>
    					</tr>
  					</tbody>
				</table> 
   		 	</li>
   		 	<li class="list-group-item">
   		 		<h5 class="card-title">Reservation</h5>
   		 		<div class="btn-group" role="group" aria-label="Basic example" style="margin-bottom:7px;">
				  <button type="button" class="btn btn-success btn-sm" id="newReservationBtn">new</button>
				</div>
    			<table class = "reservationTime">
  					<thead>
   						<tr>
      						<th scope="col" colspan="10">2018-05-10</th>
    					</tr>	
  					</thead>
  					<tbody>
	    				<tr class="table-success">
      						<td>9</td>
      						<td>10</td>
      						<td>11</td>
      						<td>12</td>
      						<td>13</td>
      						<td>14</td>
      						<td>15</td>
      						<td>16</td>
      						<td>17</td>
      						<td>18</td>
    					</tr>
    					<tr  class="dragTable">
      						<td><div draggable="true" id="a">&nbsp;</div></td>
      						<td><div draggable="true" id="b">&nbsp;</div></td>
      						<td><div draggable="true" id="c">&nbsp;</div></td>
      						<td><div draggable="true" id="d">&nbsp;</div></td>
      						<td><div draggable="true" id="e">&nbsp;</div></td>
      						<td><div draggable="true" id="f">&nbsp;</div></td>
      						<td><div draggable="true" id="g">&nbsp;</div></td>
      						<td><div draggable="true" id="h">&nbsp;</div></td>
      						<td><div draggable="true" id="i">&nbsp;</div></td>
      						<td><div draggable="true" id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>
				<br>
    			<table id = "reservationTime">
  					<thead>
   						<tr>
      						<th scope="col" colspan="10">2018-05-11</th>
    					</tr>	
  					</thead>
  					<tbody>
	    				<tr class="table-success">
      						<td>9</td>
      						<td>10</td>
      						<td>11</td>
      						<td>12</td>
      						<td>13</td>
      						<td>14</td>
      						<td>15</td>
      						<td>16</td>
      						<td>17</td>
      						<td>18</td>
    					</tr>
    					<tr class="dragTable" draggable="true">
      						<td></td>
      						<td></td>
      						<td></td>
      						<td></td>
      						<td></td>
      						<td></td>
      						<td></td>
      						<td></td>
      						<td></td>
      						<td></td>
    					</tr>
  					</tbody>
				</table>
				<br>
   		 	</li>
  		</ul>
	</div>
</div>

<div class="modal" id="reservationModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Reservation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="form-group">
		    <select class="custom-select">
			    <option selected="">Date</option>
			    <option value="10">2018-05-10</option>
			    <option value="11">2018-05-11</option>
		    </select>&nbsp;
    		<select class="custom-select">
      			<option selected="">Start time</option>
	      		<option value="9">09</option>
	      		<option value="10">10</option>
	      		<option value="11">11</option>
	      		<option value="12">12</option>
	      		<option value="13">13</option>
	      		<option value="14">14</option>
	      		<option value="15">15</option>
	      		<option value="16">16</option>
      			<option value="17">17</option>
   		 	</select>&nbsp;
		    <select class="custom-select">
			    <option selected="">End time</option>
			    <option value="10">10</option>
			    <option value="11">11</option>
			    <option value="12">12</option>
			    <option value="13">13</option>
			    <option value="14">14</option>
			    <option value="15">15</option>
			    <option value="16">16</option>
			    <option value="17">17</option>
			    <option value="18">18</option>
		    </select>
  		</div>
  		<div class="alert alert-dismissible alert-warning">
 			<button type="button" class="close" data-dismiss="alert">&times;</button>
  			<h4 class="alert-heading">Notice!</h4>
  			<p class="mb-0">please set hours only you needed. </p>
		</div>
        <p>Does you want to make reservation according to your setting?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Yes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>