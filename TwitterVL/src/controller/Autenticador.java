package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import model.Pessoa;
import model.Usuario;

@WebServlet("/login")
public class Autenticador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Autenticador() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context = getServletContext();
		String login = request.getParameter("username");
		String senha = request.getParameter("password");
		
		/**
		 * DataBase
		 */		
		Usuario usuario = new Usuario(login, senha);
		Pessoa p = new Pessoa();
		
		if(senha.equals("123") && login.equals("veve")){
			p.setNome("Verônica");
			request.getSession().setAttribute("usuario", usuario);
			context.setAttribute("user", usuario);
			context.setAttribute("nome", p);
			response.sendRedirect(request.getContextPath() + "/perfil.jsp");
		}
		else if(senha.equals("321") && login.equals("lulu")){
			p.setNome("Luis Augusto");
			request.getSession().setAttribute("usuario", usuario);
			context.setAttribute("user", usuario);
			context.setAttribute("nome", p);
			response.sendRedirect(request.getContextPath() + "/perfil.jsp");
			
		}else{
			response.sendRedirect("index.html");
		}
		
		
	}

}
