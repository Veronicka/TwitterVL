package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

@WebServlet("/adduser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public AddUser() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();		
		String n = request.getParameter("novonome");
		String l = request.getParameter("novousername");
		String s = request.getParameter("novapassword");
			
		Usuario user = new Usuario();
		user.setLogin(l);
		user.setSenha(s);
		user.setNome(n);
		user.setFoto("img/user.png");
		Autenticador.listaDeUsuarios.add(user);
						
		response.sendRedirect("index.html");

		System.out.println(Autenticador.listaDeUsuarios.size());
	}
}
