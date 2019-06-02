package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpgradeDAO;
import dto.UpgradeDTO;


@WebServlet("*.admin")
public class AdminServlets extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length());
		System.out.println(cmd);

		UpgradeDAO dao = new UpgradeDAO();
		try {
			if(cmd.equals("/mypage.admin")) { //메인-> 마이페이지 클릭해서 들어온경우 1페이지 띄워주기
				//1. 튜터등록 목록 보내줘야함. 
				int currentPage = 1;
				List<UpgradeDTO> upgradeList = dao.selectByPageUpgradeList(currentPage);
				if(upgradeList.size()!=0) {
					request.setAttribute("upgradeList", upgradeList);
				}
				//2. 네비게이터 보내줘야함
				List<String> naviList = dao.getNavi(currentPage, upgradeList.size());
				request.setAttribute("navi", naviList);

				request.getRequestDispatcher("WEB-INF/adminMypage.jsp").forward(request, response);
			}else if(cmd.equals("/tutorUpgrade.admin")) {
				String[] apply_checkedId = request.getParameterValues("checkedId");
				//System.out.println("길이" + apply_checkedId.length);
				for(String str : apply_checkedId) {
					System.out.println(str);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
