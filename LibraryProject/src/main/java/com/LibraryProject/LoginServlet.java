package com.LibraryProject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.Entity.UserEntity;
import com.DAL.UserDAO;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String version = System.getProperty("java.version");
		UserEntity user=new UserEntity();
			user.setUserName(request.getParameter("userName"));
			user.setPassword(request.getParameter("password"));
			
			UserDAO userDAO = new UserDAO();
			UserEntity userOut=userDAO.getUser(user);
			if(userOut.getUserId()!=0) 			
			{
				
				HttpSession session=request.getSession();
				session.setAttribute("validUser", "true");
				
				if(userOut.getAdmin()==1) {
					session.setAttribute("admin", "true");
				}
								
				RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("Message", "Please enter correct username and password");
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
			}
	 
	}

}
