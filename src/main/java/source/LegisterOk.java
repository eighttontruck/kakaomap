package source;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/LegisterOk")
public class LegisterOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
		
		String id=request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd=request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name=request.getParameter("name")==null ? "" : request.getParameter("name");
		String birthday=request.getParameter("since")==null ? "" : request.getParameter("since");
//		String gender=request.getParameter("gender");
		String gender="남자";
		
		LegisterVO vo=new LegisterVO(id, pwd, name, birthday,gender);
		
		LegisterDAO dao=new LegisterDAO();
		dao.legister(vo);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("source/legisterOk.jsp");
		dispatcher.forward(request, response);
		
	}
}
