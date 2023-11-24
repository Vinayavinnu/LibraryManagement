package com.DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Entity.UserEntity;

public class UserDAO {

	public UserEntity getUser(UserEntity user) {

		UserEntity userOut=new UserEntity();
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		String sql = "select * from usermaster where username='" + user.getUserName() + "' and password='"
				+ user.getPassword() + "' and isdeleted=0";
		try {
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			
			
			if (rs.next()) {				
				userOut.setUserId(rs.getInt("userid"));
				userOut.setAdmin(Integer.parseInt(rs.getString("isadmin")));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userOut;
	}

	public int register(UserEntity userEntity) {
		int affectedRows = 0;
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "insert into usermaster (username,password,email,phone) values (?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userEntity.getUserName());
			ps.setString(2, userEntity.getPassword());
			ps.setString(3, userEntity.getEmail());
			ps.setString(4, userEntity.getPhone());
			affectedRows = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affectedRows;
	}
	
	public List<UserEntity> getUsers(){
		List<UserEntity> users= new ArrayList<>();
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.getConnection();
		String sql = "select * from usermaster where isdeleted=0";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				UserEntity user=new UserEntity();
				user.setUserId(rs.getInt("userid"));
				user.setUserName(rs.getString("userName"));
				users.add(user);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
}
