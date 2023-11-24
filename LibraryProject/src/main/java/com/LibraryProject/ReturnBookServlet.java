package com.LibraryProject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.List;

import com.Entity.BookEntity;
import com.Entity.UserEntity;
import com.DAL.BookDAO;
import com.DAL.UserDAO;


public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		
			
		try {

			  BookDAO bookDAO = new BookDAO(); 
			  List<BookEntity> booklist =bookDAO.listIssuedBooks();
			  
			  UserDAO userDAO = new UserDAO(); 
			  List<UserEntity> userList =userDAO.getUsers();
			  
			  request.setAttribute("booklist", booklist);
			  request.setAttribute("userlist", userList);
			  
			 RequestDispatcher rd=request.getRequestDispatcher("ReturnBook.jsp");
			  
			 rd.forward(request, response);
			 
			} catch (ServletException | IOException e) {  
				
				e.printStackTrace();
				request.setAttribute("Message", "Book list could not be loaded...");
				RequestDispatcher rd=request.getRequestDispatcher("ReturnBook.jsp");
				
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
		
			}			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		
			int bookId=Integer.parseInt(request.getParameter("bookId"));
			String description=request.getParameter("issueDescription");		
			
			BookDAO bookDAO = new BookDAO();
			int result = bookDAO.returnBook(bookId,description);
			if(result==1)
			{
				request.setAttribute("Message", "Book returned successfully...");
			
			}
			else if(result==2)
			{
				request.setAttribute("Message", "Book could not be retirned due to some issue...");
			}
						
				doGet(request,response);
		

	}


}