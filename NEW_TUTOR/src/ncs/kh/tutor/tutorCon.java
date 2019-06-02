package ncs.kh.tutor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncs.kh.DAO.DAO;


@WebServlet("*.con")
public class tutorCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		DAO dao = new DAO();
		request.setCharacterEncoding("UTF-8");
		
		if(command.equals("/tutor.con")) {
			System.out.println("서버 넘어옴");
			String intro = request.getParameter("intro");
			String category = request.getParameter("down");
			String zipcode = request.getParameter("zipcode");
			int add1=Integer.parseInt(zipcode);
			String add2 = request.getParameter("add1");
			String add3 = request.getParameter("add2");
			String add4 = request.getParameter("add3");
			String person = request.getParameter("max");
			int max = Integer.parseInt(person);
			String money = request.getParameter("cash");
			int cash = Integer.parseInt(money);
			String start = request.getParameter("startdate");
			String end = request.getParameter("enddate");
			String explain = request.getParameter("explain");
			System.out.println(explain);
			
			try {
				int result = dao.test(intro,category,add1,add2,add3,add4,max,cash,start,end,explain);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
