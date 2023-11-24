package com.LibraryProject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;

import com.DAL.UserDAO;
import com.Entity.UserEntity;


public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserEntity user=new UserEntity();
		user.setUserName(request.getParameter("userName"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		user.setPhone(request.getParameter("phone"));
		
		UserDAO userDal = new UserDAO();
		int result = userDal.register(user);
		if(result==1)
		{
			//response.sendRedirect("Login.jsp?registered=yes");
			request.setAttribute("Message", "Successfully Registered...");
			RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
			
		}
				
		response.getWriter().print("Some Error Occured!..");
	}

}
