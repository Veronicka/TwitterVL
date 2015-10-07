package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;

@WebServlet("/seguidores")
public class Seguidores extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public Seguidores() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessao = request.getSession();
		String seguir = request.getParameter("seguir");
		for(Usuario u: Autenticador.listaDeUsuarios){
			if(u.getLogin().equals(seguir)){
				Mensagens.user.getSeguidos().add(u);
			}
		}
		sessao.setAttribute("seguindo", "seguindo");
		response.sendRedirect(request.getContextPath() + "/perfilUser.jsp");
		
	}

}
