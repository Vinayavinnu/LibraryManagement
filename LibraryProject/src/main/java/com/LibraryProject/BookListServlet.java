package com.LibraryProject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.List;

import com.Entity.BookEntity;
import com.DAL.BookDAO;


public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		
			
		try {
	
		
			  BookDAO bookDAL = new BookDAO(); 
			  List<BookEntity> booklist =bookDAL.listBooks();
			  
			  request.setAttribute("booklist", booklist);
			  
			 RequestDispatcher rd=request.getRequestDispatcher("BookList.jsp");
			  
			 rd.forward(request, response);
			 
			} catch (ServletException | IOException e) {  
				
				e.printStackTrace();
				request.setAttribute("Message", "Book list could not be loaded...");
				RequestDispatcher rd=request.getRequestDispatcher("BookList.jsp");
				
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
		
			}			
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		doGet(request,response);
	}


}