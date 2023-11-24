package com.DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private String dburl = "jdbc:mysql://localhost:3306/librarydb";
	private String dbuname = "root";
	private String dbpassword = "12345";
	private String dbdriver = "com.mysql.jdbc.Driver";


	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(dbdriver);
			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
}
