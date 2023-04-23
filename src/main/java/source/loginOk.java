package source;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/loginOk")
public class loginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid=request.getParameter("mid");
		String pwd=request.getParameter("pwd");
		
		request.setAttribute("mid",mid);
		request.setAttribute("pwd",pwd);
			
		RequestDispatcher dispatcher = request.getRequestDispatcher("source/main.jsp");
		dispatcher.forward(request, response);
		
			
	}
}
