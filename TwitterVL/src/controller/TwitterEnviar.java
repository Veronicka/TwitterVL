package controller;

import java.awt.HeadlessException;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.api.TweetsResources;

@WebServlet("/twitter")
public class TwitterEnviar extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TwitterEnviar() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		ServletContext context = getServletContext();
		String mensagem = request.getParameter("mensagem");
				
		Twitter tw = new TwitterFactory().getSingleton();

		//Status status = tw.updateStatus(mensagem);
				
		response.sendRedirect(request.getContextPath() + "/perfil.jsp");
	}

}
