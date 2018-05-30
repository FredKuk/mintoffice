<%@page contentType="text/html;charset=UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache");%>
<%response.addHeader("Cache-Control", "no-store");%>
<%response.setHeader("Pragma", "No-cache");%>
<%response.setDateHeader("Expires", 1L);%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>Mint OfficeWare Main</title>
<!-- Bootstrap core CSS -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9" crossorigin="anonymous"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript' src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/home/home.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
	integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
	crossorigin="anonymous"></script>
	
<script src="js/home/home.js"></script>
<script src="js/personal/viewPersonal.js"></script>
<script src="js/personal/schedule.js"></script>
<script src="js/business/viewBusiness.js"></script>
<script src="js/business/commute.js"></script>

<link href='css/calendar/fullcalendar.min.css' rel='stylesheet' />
<link href='css/calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='js/calendar/moment.min.js'></script>
<script src='js/calendar/fullcalendar.min.js'></script>
<script src='js/calendar/gcal.js'></script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfIrqaBsk7v_DFG5BVrxbTuRcT3hvAhqo&callback=myMap"></script> -->
</head>
<body>
	<!-- NOT LOGIN CONDITION _ INDEX -->
	<c:if test="${empty sessionScope.loginInfo}">
		<script>
			location.href="index.jsp";
		</script>
	</c:if>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="home.jsp">Mint Office</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item" id="home"><a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a></li>
				<li class="nav-item" id="personal"><a class="nav-link" href="#">Personal</a></li>
				<li class="nav-item" id="authorization"><a class="nav-link" href="#">Authorization</a></li>
				<li class="nav-item" id="business"><a class="nav-link" href="#">Business</a></li>
	        	<li class="nav-item" id="logout"><a class="nav-link" href="#">Logout</a></li>
			</ul>
		</div>
	</nav>
	<div id="contents">
		<div class="jumbotron">
			<h1 class="display-3">Welcome To Mint Office</h1>
			<p class="lead">This is a simple hero unit, a simple
				jumbotron-style component for calling extra attention to featured
				content or information.</p>
			<hr class="my-4">
			<p>It uses utility classes for typography and spacing to space
				content out within the larger container.</p>
			<p class="lead">
				<a class="btn btn-primary btn-lg" href="#" role="button">Learn
					more</a>
			</p>
		</div>
	</div>
	<footer>
		<address>
			<br>Made by Chan-ho Kuk, Chae-hwan Im, Yong-jin Kim, Da-Eun Lee.<br> Code released under the MIT License.<br>
			Based on Bootstrap. Icons from Font Awesome. Web fonts from Google.
		</address>
	</footer>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
<div class="modal" id="logoutModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Logout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Do you really want to logout?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="logoutBtn">Yes</button>
        <button type="button" class="btn btn-secondary" id="logoutNoBtn" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>