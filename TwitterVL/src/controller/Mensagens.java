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

import model.Msg;
import model.Usuario;


@WebServlet("/mensagens")
public class Mensagens extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<String> tags;
	private ArrayList<Msg> msgs;
	private Usuario user;
	private int cont = 0 ;
	
	public Mensagens() {
		super();
		msgs = new ArrayList<Msg>();
		tags = new ArrayList<String>();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessao = request.getSession();
		ServletContext context = getServletContext();
		String msg = request.getParameter("mensagem");
		
		if(msg!=null && !msg.isEmpty()){
			
			user = (Usuario) sessao.getAttribute("user");
			
			user.addMensagens(user.getFoto(), msg);
			Msg ms = new Msg();
			ms.setFoto(user.getFoto());
			ms.setMsg(msg);
			msgs.add(ms);
			
			//sessao.setAttribute("use", user);
			
			
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
			
			for(Usuario u: Autenticador.listaDeUsuarios){
				if(u.getLogin().equals("luis")){
					user.getSeguidos().add(u);
					for(Msg i: u.getMensagens()){
						msgs.add(i);
					}
				}
			}
		}
		sessao.setAttribute("msgs", msgs);
		response.sendRedirect(request.getContextPath() + "/perfil.jsp");
	}

}
