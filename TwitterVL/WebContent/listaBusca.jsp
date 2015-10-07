<!DOCTYPE html>
<%@page import="model.Usuario"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<title>Login</title>
</head>
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
		<div class="col-md-4" align="center"></div>
		<div class="col-md-4">
			<div align="center">
				<div id="busca" align="center">
				<h2>Usuários Encontrados</h2>
				<br/>
		    		<table class="table table-hover">
		    			<thead>
		    				<tr>
				          		<th>Nome</th>
				          		<th>Login</th>
				        	</tr>
				      	</thead>
				      	<tbody>
							<% ArrayList<Usuario> listaBusca = (ArrayList<Usuario>) session.getAttribute("listaBusca"); 
			    		
			    			for(Usuario u: listaBusca){%>
			    			<tr>
			    				<td><%=u.getNome() %></td>
			    				<td><a href="perfilUser.jsp"><%=u.getLogin() %></a></td>
			    				<% HttpSession sessao = request.getSession();%>
								<% sessao.setAttribute("user2", u);%>
			    			</tr>
			    			<%}%>
		    			</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-4" align="center"></div>
	</div>
</div>

	<div class="row" id="rodape" align="center">
        <div class="col-md-12">
        <font color="white">Copyright 2015 @ Verônica e Luís</font>
        </div>
    </div>
    
</body>
</html>