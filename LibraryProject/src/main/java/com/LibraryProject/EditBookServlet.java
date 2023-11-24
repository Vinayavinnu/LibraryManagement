package com.LibraryProject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import com.Entity.BookEntity;
import com.DAL.BookDAO;


public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		
		try {			

			int id=Integer.parseInt(request.getParameter("bookId"));
			BookDAO bookDAL = new BookDAO();
			BookEntity book = bookDAL.selectBook(id);

			request.setAttribute("book", book);						
			RequestDispatcher rd=request.getRequestDispatcher("EditBook.jsp");
			rd.forward(request, response);
			
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
				request.setAttribute("Message", "Could not retrive book...");
				RequestDispatcher rd=request.getRequestDispatcher("EditBook.jsp");
				
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
		
			}				
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			BookEntity book=new BookEntity();
			book.setBookId(Integer.parseInt(request.getParameter("bookId")));
			book.setBookname(request.getParameter("bookName"));
			book.setAuthor(request.getParameter("author"));
			book.setLanguage(request.getParameter("language"));
			book.setPublishedYear(Integer.parseInt(request.getParameter("publishYear")));
			
			BookDAO bookDAL = new BookDAO();
			int result = bookDAL.updateBook(book);
			if(result==1)
			{
				request.setAttribute("Message", "Book updated successfully...");
			
			}
			else
			{
				request.setAttribute("Message", "Book could not be updated...");
			}
			
			RequestDispatcher rd=request.getRequestDispatcher("/BookList");
		
				rd.forward(request, response);
			//response.sendRedirect("/BookList");
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
				request.setAttribute("Message", "Book Could not be updated...");
				RequestDispatcher rd=request.getRequestDispatcher("/BookList");
				
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
		
			}				
		
	}

}