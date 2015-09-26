<%@page import="model.Usuario"%>
<%@page import="model.Pessoa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/auxfunctions.js"></script>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<title>Login</title>
</head>
<body>
<body id="bgd">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
		    <!-- Brand and toggle get grouped for better mobile display -->
   			<div class="navbar-header">
      			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        			<span class="sr-only">Toggle navigation</span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
      			</button>
      			<a class="navbar-brand" href="#">TwitterVL</a>
    		</div>
       	  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav">
        			<li class="active"><a href="#">Início<span class="sr-only">(current)</span></a></li>
        			<li><a href="sobre.html">Sobre</a></li>
        		</ul>
        	</div>
  		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4" align="center">
			<div id="span4Perfil">
				<br />
				<%
					Usuario u = (Usuario) getServletContext().getAttribute("user");
			    	Pessoa p = (Pessoa) getServletContext().getAttribute("nome");
				%>
				<%
					if(u == null){
						response.sendRedirect("index.html");
					}				
				%>
				<%
				if (u != null) {
				%>
					<h2>Olá <%=p.getNome()%> !</h2>
					<%if(u.getLogin().equals("veve")) {%>
						<img src="img/ve.jpg" alt="ve" class="img-circle" style="width: 200px; height: 200px;">
						<h4>@veronicka_ms</h4>
					<%}else{ %>
						<img src="img/luis.jpg" alt="ve" class="img-circle" style="width: 200px; height: 200px;">
						<h4>@lulu</h4>
					<%} %>
				<%} else {%>
					<h2>Olá</h2>
				<%}%>
				<br />
				<form action="twitter" method="post" id="formTwitter">
				<h2 align="left">Twitter</h2>
					<textarea rows=3 cols=4 onKeyPress="return taLimit(this)" onKeyUp="return taCount(this,'myCounter')" name="twit" class="form-control" placeholder="Digite sua mensagem aqui"></textarea>
					<div align="right">
						<font color="red" id=myCounter>300</font>
						<button type="submit" class="btn btn-default" >Twittar</button>
					</div>
				</form>
			</div>
				
			</div>
			<div class="col-md-8" align="center">
			<div id="span8Perfil">
				<form role="form" action="#" method="post" id="campoMensagem">
					<div class="input-group">
						<span id="basic-addon1" class="input-group-addon">
							<%if(u.getLogin().equals("veve")) {%>
								<img src="img/ve.jpg" alt="ve" class="img-rounded" style="width: 70px; height: 70px;">
							<%}else{ %>
								<img src="img/luis.jpg" alt="ve" class="img-rounded" style="width: 70px; height: 70px;">
							<%} %>
						</span>
						<textarea rows=4 cols=10 onKeyPress="return taLimit(this)" onKeyUp="return taCount(this,'myCounter')" name="mensagem" class="form-control" placeholder="Digite sua mensagem aqui"></textarea>
					</div>
					<div align="right">
						<font color="red" id=myCounter>300</font>
						<button type="submit" class="btn btn-default" >Postar</button>
					</div>
				</form>			
			</div>
			</div>
		</div>
	</div>
</body>
</html>