package com.DAL;

import java.sql.Connection;
//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Entity.BookEntity;
import com.mysql.cj.jdbc.CallableStatement;

import java.util.Date;

public class BookDAO {
	
	public int addBook(BookEntity bookEntity) {
		int affectedRows = 0;
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "insert into bookmaster (bookname,author,language,publishedyear) values (?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bookEntity.getBookname());
			ps.setString(2, bookEntity.getAuthor());
			ps.setString(3, bookEntity.getLanguage());
			ps.setInt(4, bookEntity.getPublishedYear());
			affectedRows = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affectedRows;
	}
	
	public int updateBook(BookEntity bookEntity) {
		int affectedRows = 0;
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "update bookmaster set bookname=?,author=?,language=?,publishedyear=? where bookid=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bookEntity.getBookname());
			ps.setString(2, bookEntity.getAuthor());
			ps.setString(3, bookEntity.getLanguage());
			ps.setInt(4, bookEntity.getPublishedYear());
			ps.setInt(5, bookEntity.getBookId());
			affectedRows = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affectedRows;
	}
	
	public BookEntity selectBook(int id){
		BookEntity book= new BookEntity();
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "select bookid,bookname,author,language,publishedyear from bookmaster where bookid =?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {				
				book.setBookId(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setLanguage(rs.getString("language"));
				book.setPublishedYear(rs.getInt("publishedYear"));				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}
	

	public int deleteBook(int bookId) {
		int affectedRows = 0;
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "update bookmaster set isdeleted=? where bookid=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);		
			ps.setInt(1, 1);
			ps.setInt(2, bookId);
			affectedRows = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affectedRows;
	}

	public List<BookEntity> listBooks(){
		List<BookEntity> books= new ArrayList<>();
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "select * from bookmaster where isdeleted=0";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				BookEntity book=new BookEntity();
				book.setBookId(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setLanguage(rs.getString("language"));
				book.setPublishedYear(rs.getInt("publishedYear"));
				books.add(book);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return books;
	}
	
	public List<BookEntity> listAvailableBooks(){
		List<BookEntity> books= new ArrayList<>();
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "select * from bookmaster where isdeleted=0 and isissued=0";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				BookEntity book=new BookEntity();
				book.setBookId(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setLanguage(rs.getString("language"));
				book.setPublishedYear(rs.getInt("publishedYear"));
				books.add(book);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return books;
	}
	
	public int issueBook(int bookId, int userId, String description) {
		int issueStatus = 0;
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "{call issuebook(?,?,?,?,?)}";
		try {
			CallableStatement ps = (CallableStatement) con.prepareCall(sql);
			
			ps.registerOutParameter(5, java.sql.Types.INTEGER);
			
			Date date=new Date();
			java.sql.Date sqlDate=new java.sql.Date(date.getTime());
			
			
			ps.setInt(1, bookId);
			ps.setInt(2, userId);			
			ps.setDate(3, sqlDate);
			ps.setString(4, description);
			ps.execute();
			
			issueStatus=(Integer)ps.getObject(5,Integer.class);
			
			ps.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return issueStatus;
	}
	
	
	public List<BookEntity> listIssuedBooks(){
		List<BookEntity> books= new ArrayList<>();
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "select * from bookmaster where isdeleted=0 and isissued=1";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				BookEntity book=new BookEntity();
				book.setBookId(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setLanguage(rs.getString("language"));
				book.setPublishedYear(rs.getInt("publishedYear"));
				books.add(book);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return books;
	}
	
	public int returnBook(int bookId, String description) {
		int issueStatus = 0;
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "{call returnbook(?,?,?,?)}";
		try {
			CallableStatement ps = (CallableStatement) con.prepareCall(sql);
			
			ps.registerOutParameter(4, java.sql.Types.INTEGER);
			
			Date date=new Date();
			java.sql.Date sqlDate=new java.sql.Date(date.getTime());
			
			
			ps.setInt(1, bookId);			
			ps.setDate(2, sqlDate);
			ps.setString(3, description);
			ps.execute();
			
			issueStatus=(Integer)ps.getObject(4,Integer.class);
			
			ps.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return issueStatus;
	}
	
	
}
