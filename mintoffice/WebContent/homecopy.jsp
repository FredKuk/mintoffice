<%@page contentType="text/html;charset=UTF-8" %>
<%System.out.println("asdf"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <title>Mint OfficeWare Main
    </title>
    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/home/home.css?ver=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="js/home/home.js"></script>
  </head>
  <body>
  
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="#">Mint Office</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarColor01">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item" id = "home">
	        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item" id = "personal">
	        <a class="nav-link" href="#">Personal</a>
	      </li>
	      <li class="nav-item" id = "authorization">
	        <a class="nav-link" href="#">Authorization</a>
	      </li>
	      <li class="nav-item" id = "business">
	        <a class="nav-link" href="#">Business</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<div id="contents" style="width:100%;height:83%">
	<div class="jumbotron">
  <h1 class="display-3">Welcome To Mint Office</h1>
  <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
  <hr class="my-4">
  <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
  <p class="lead">
    <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
  </p>
</div>
	</div>
	<footer>
     <address><br>Made by Chan-ho Kuk, Chae-hwan Im, Yong-jin Kim, Sung-min Park, Da-Eun Lee.<br>

Code released under the MIT License.<br>

Based on Bootstrap. Icons from Font Awesome. Web fonts from Google.</address> 
  	</footer>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script type = 'text/javascript' scr="js/bootstrap.js"></script>
  </body>
</html>