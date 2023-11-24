package com.LibraryProject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import com.Entity.BookEntity;
import com.DAL.BookDAO;


public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			BookEntity book=new BookEntity();
			book.setBookname(request.getParameter("bookName"));
			book.setAuthor(request.getParameter("author"));
			book.setLanguage(request.getParameter("language"));
			book.setPublishedYear(Integer.parseInt(request.getParameter("publishYear")));
			
			BookDAO bookDAL = new BookDAO();
			int result = bookDAL.addBook(book);
			if(result==1)
			{
				request.setAttribute("Message", "Book added successfully...");
			
			}
			else
			{
				request.setAttribute("Message", "Book Could not be added...");
			}
			
			RequestDispatcher rd=request.getRequestDispatcher("AddBook.jsp");
		
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
				request.setAttribute("Message", "Book Could not be added...");
				RequestDispatcher rd=request.getRequestDispatcher("AddBook.jsp");
				
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
		
			}				
		
	}

}