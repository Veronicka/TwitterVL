<%@page import="controller.Mensagens"%>
<%@page import="controller.Autenticador"%>
<%@page import="model.Msg"%>
<%@page import="java.util.*"%>
<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="twitter:widgets:theme" content="light">
<meta name="twitter:widgets:link-color" content="#55acee">
<meta name="twitter:widgets:border-color" content="#55acee">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/auxfunctions.js"></script>
<script src="js/scriptVL.js"></script>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="canonical" href="https://dev.twitter.com/web/tweet-button">
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
        			<li><a href="perfil.jsp">Início<span class="sr-only">(current)</span></a></li>
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
					Usuario u = (Usuario) session.getAttribute("user2");
		    		String seguindo = (String) session.getAttribute("seguindo");
				%>
				<%
					if(u == null){
						response.sendRedirect("index.html");
					}				
				%>
				<%
				if (u != null) {%>
					<h2>Olá <%=u.getNome()%> !</h2>
						<img src=<%=u.getFoto()%> alt="ve" class="img-circle" style="width: 200px; height: 200px;">
						<h4><%="@"+u.getLogin()%></h4>
				<%}%>
				<br />
				<%if(u.getLogin().equals("veve")){ %>
					<div id="formTwitter">
					<a class="twitter-timeline" href="https://twitter.com/search?q=%40Veronicka_Moon" data-widget-id="648212040432119809"></a>		
					</div>
				<%}else if(u.getLogin().equals("luis")){ %>
					<div id="formTwitter">
					<a class="twitter-timeline" href="https://twitter.com/Laugustosilva" data-widget-id="650302705274081280"></a>
					</div>
				<%} %>
			</div>
			</div>
			<div class="col-md-6" align="center">
			<div id="span6Perfil">
				
				<div id="mensagem" >
				<div align="right">
					<form action="seguidores" method="post">
						<input type="text" name="seguir" value=<%=u.getLogin()%> hidden="hidden"/>
						<button type="submit" class="btn btn-default btn-large"><%if(seguindo!=null){%><%=seguindo %><%}else{%>Seguir<%} %></button>
					</form>
				</div>
				<br />		
					<%if(u.getMensagens() != null){%>
						<%for(Msg s: u.getMensagens()){%>
							<div class="input-group">
								<span id="basic-addon1" class="input-group-addon"><img src=<%=s.getFoto()%> alt="ve" class="img-rounded" style="width: 70px; height: 70px;"></span>
								<textarea disabled="disabled" rows=4 cols=10 class="form-control"><%=s.getMsg()%></textarea>
							</div>
							<br />
						<%} %>
					<%} %>
				</div>					
			</div>
			</div>
			<div class="col-md-2" align="center">
				<div id="span2Perfil">
					<br />
					<form action="buscar" method="post" class="form-inline">
						<div class="input-group" align="center" id="buscar">
							<span id="basic-addon1" class="input-group-addon">
								<i class="fa fa-search"></i>
							</span>
							<input type="text" name="busca" placeholder="Buscar Usuário" aria-describedby="basic-addon1" class="form-control"/>
						</div>
							<div align="right"><button type="submit" class="btn btn-default">Buscar</button></div>
					</form>
					<br />
					<h3>Tópicos</h3>
					<br/>
					<%ArrayList<String> tags = (ArrayList<String>) getServletContext().getAttribute("tags"); 
					if(tags != null){
						for(String t: tags){%>
								<h4 align="left"><%=t %></h4>
							<%}
					}else{%>
						<h3>Não há tópicos</h3>
					<%}	%>
				</div>
			</div>
		</div>
	</div>
    
	<div class="row" id="rodape" align="center">
        <div class="col-md-12">
        <font color="white">Copyright 2015 @ Verônica e Luís</font>
        </div>
    </div>
</body>
</html>