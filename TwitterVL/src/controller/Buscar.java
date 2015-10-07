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

@WebServlet("/buscar")
public class Buscar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static ArrayList<Usuario> buscaU = new ArrayList<Usuario>();
 
    public Buscar() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessao = request.getSession();
		String busca = request.getParameter("busca");
	
		if(buscaU.size()>0){
			buscaU.clear();			
		}
		if(busca != null && busca != ""){
			for(Usuario u : Autenticador.listaDeUsuarios){
				if(u.getLogin().contains(busca) || u.getNome().contains(busca)){
					buscaU.add(u);
				}
			}
			sessao.setAttribute("listaBusca", buscaU);
			response.sendRedirect(request.getContextPath() + "/listaBusca.jsp");

		}else{
			response.sendRedirect(request.getContextPath() + "/perfil.jsp");
		}
	}

}