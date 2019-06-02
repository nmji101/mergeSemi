package kh.semi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.semi.dao.MemberDAO;
import kh.semi.dto.MemberDTO;

@WebServlet("*.login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		String url = request.getRequestURI().substring(request.getContextPath().length() + 1);
		
		if(url.equals("kakao.login"))
		{
			String info = request.getParameter("json").substring(1,request.getParameter("json").length()-1);
			JsonParser jp = new JsonParser();
			JsonObject root = jp.parse(info).getAsJsonObject();
			JsonObject prop = root.get("properties").getAsJsonObject();
			JsonObject account = root.get("kakao_account").getAsJsonObject();
			
			String id = "k" + root.get("id").toString();
			
			try
			{
				MemberDAO dao = new MemberDAO();
				if(!dao.kakaoLoginCheck(id))
				{
					String nickname = prop.get("nickname").toString();
					nickname = nickname.substring(1,nickname.length()-1);
					String ageRange = "기타";
					String birthday = "";
					String gender = "";
					
					try
					{
						ageRange = account.get("age_range").toString();
						ageRange = ageRange.substring(1,ageRange.length()-1);
						ageRange = ageRange.substring(0, 2);
					}
					catch(NullPointerException e){}
					
					try
					{
						birthday = account.get("birthday").toString();
						birthday = birthday.substring(1,birthday.length()-1);
					}
					catch(NullPointerException e){}
					
					try
					{
						gender = account.get("gender").toString();
						gender = gender.substring(1,gender.length()-1);
						
						if(gender.equals("male"))
						{
							gender = "M";
						}
						else if(gender.equals("female"))
						{
							gender = "F";
						}
					}
					catch(NullPointerException e){}
					
					int result = dao.kakaoSignUp(new MemberDTO(id, dao.toSha256("password"), nickname, gender, ageRange, birthday));
					
					if(result > 0)
					{
						request.setAttribute("loginId", id);
						request.getRequestDispatcher("homepage.jsp").forward(request, response);
					}
					else
					{
						System.out.println("DB INSERT ERROR");
					}
					
				}
				else
				{
					request.getSession().setAttribute("loginId", id);
					request.getRequestDispatcher("Homapage.jsp").forward(request, response);
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else if(url.equals("email.login"))
		{
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			try
			{
				MemberDAO dao = new MemberDAO();
				
				if(dao.emailLoginCheck(id, dao.toSha256(pw)))
				{
					request.getSession().setAttribute("loginId", id);
					writer.append("Y");
				}
				else
				{
					writer.append("N");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
