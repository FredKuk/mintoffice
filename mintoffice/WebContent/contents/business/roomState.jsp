<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
	$("#newReservationBtn").click(function(){
        $("#reservationModal").modal();
        $('.modal-backdrop').remove();
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
#allRoomInfo{
	max-width:95%;
	max-height:88%;
	overflow:auto;
	margin-top: 1px;
}

#allRoomInfo ul{
	box-sizing: content-box;
	list-style-type:none
}

#allRoomInfo table{
   width:100%;
   margin:0px;
   padding: 0px;
   border-width: 0px;
}
#allRoomInfo tr{
	height:40px;
}
.reservationTime{
border: solid;
border-width: 1px;
border-color:lightgrey;
}
.reservationTime *{
text-align: center;
}
.reservationTime td{
	width:150px;
}
.dragTable div{
box-sizing:border-box;
width:100%;
height:100%;
}
.card-body{
padding:0px;
}
</style>
<jsp:include page="roomSearch.jsp"></jsp:include>
<div id="allRoomInfo">
  	<ul>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		<li>
  			<div class="card border-secondary mb-3";">
  				<div class="card-header">Room 509&emsp;<span class="badge badge-success">Ready</span></div>
  				<div class="card-body">
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
      						<td><div id="a">&nbsp;</div></td>
      						<td><div id="b">&nbsp;</div></td>
      						<td><div id="c">&nbsp;</div></td>
      						<td><div id="d">&nbsp;</div></td>
      						<td><div id="e">&nbsp;</div></td>
      						<td><div id="f">&nbsp;</div></td>
      						<td><div id="g">&nbsp;</div></td>
      						<td><div id="h">&nbsp;</div></td>
      						<td><div id="i">&nbsp;</div></td>
      						<td><div id="j">&nbsp;</div></td>
    					</tr>
  					</tbody>
				</table>    				
  				</div>
			</div>
  		</li>
  		
  	</ul>
  </div>