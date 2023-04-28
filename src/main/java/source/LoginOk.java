package source;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/loginOk")
public class LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String idSave=request.getParameter("idSave")==null ? "off" : "on"; //checkbox는 켜져있을 시 on이 나온다.
		
		HttpSession session=request.getSession();
		
		LegisterDAO dao=new LegisterDAO();
		
		LegisterVO vo=dao.login(id, pwd);
		
		boolean cookieDuplication=false;
		
		if(vo.getId()!=null) { //db에서 맞는 로그인 정보를 객체에 담아서 가져왔을 때
			session.setAttribute("sId", id);
			Cookie cookieId=new Cookie("cId",id);
			
			Cookie[] cookies = request.getCookies();
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getValue().equals(id)) {
					cookieDuplication=true;
				}
			}
			cookieId.setPath("/"); //페이지 전체에서 찾을 수 있게 해주는 코드다.
			if(idSave.equals("on")) {
				cookieId.setMaxAge(60*60*24*30);
			}
			else if(idSave.equals("off")){
				if(cookieDuplication) {
					cookieId.setMaxAge(60*60*24*30);
				} else {
					cookieId.setMaxAge(0);
				}
			}
			response.addCookie(cookieId);
			request.getRequestDispatcher("source/main.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("source/loginNo.jsp").forward(request, response);
		}
		
		request.setAttribute("id",id);
		request.setAttribute("pwd",pwd);
	}
}