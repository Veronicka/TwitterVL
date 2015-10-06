package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;


@WebServlet("/mensagens")
public class Mensagens extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<String> msgs;
	//private ArrayList<String> msgs2;
	private ArrayList<String> tags;
	private Usuario user;
	private int cont = 0 ;
	
	public Mensagens() {
		super();
		msgs = new ArrayList<String>();
		tags = new ArrayList<String>();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessao = request.getSession();
		ServletContext context = getServletContext();
		String msg = request.getParameter("mensagem");
		
		user = (Usuario) sessao.getAttribute("user");
		
		user.addMensagens(msg);
		sessao.setAttribute("msgs", user.getMensagens());
		
		if(msg.contains("#")){
			String m[] = msg.split(" ");
			if(cont==7){
				tags.remove(0);
			}
			for(String i: m){
				if(i.startsWith("#")){
					System.out.println(i);
					tags.add(i);
					context.setAttribute("tags", tags);
					cont++;
				}
			}
		}
		
		/*if(user.getLogin().equals("veve")){		
			user.addMensagens(msg);
			sessao.setAttribute("msgs", user.getMensagens());
		}
		else{
			user.addMensagens(msg);
			sessao.setAttribute("msgs2", user.getMensagens());
		}
		*/
		response.sendRedirect(request.getContextPath() + "/perfil.jsp");
	}

}
