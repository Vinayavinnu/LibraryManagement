package com.LibraryProject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import com.DAL.BookDAO;


public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		
		try {			

			int id=Integer.parseInt(request.getParameter("bookId"));
			BookDAO bookDAO = new BookDAO();
			int deletedRows = bookDAO.deleteBook(id);
			if(deletedRows==1) {
				request.setAttribute("Message", "Book deleted successfully...");
			}
			else {
				request.setAttribute("Message", "Book could not be deleted...");
			}
			RequestDispatcher rd=request.getRequestDispatcher("/BookList");
			rd.forward(request, response);
			
			
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
				request.setAttribute("Message", "Could not delete book...");
				RequestDispatcher rd=request.getRequestDispatcher("/BookList");
				
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
		
			}				
		
	}

	
}