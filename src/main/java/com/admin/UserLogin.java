package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.db.DBConnection;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		User.setLatitude(latitude);
		User.setLongitude(longitude);
		
		LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
		
		try {
			
			int eid = 0;
			Connection con = DBConnection.connect();
			String query = "select eid from confermorder where rdate < ?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, formattedDateTime);
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				eid = rs.getInt(1);
				
				query = "update equipment set eavailable = 'available' where eid = ?";
				stmt = con.prepareStatement(query);
				stmt.setInt(1, eid);
				stmt.executeUpdate();
			
				query = "delete from confermorder where eid=?";
				stmt = con.prepareStatement(query);
				stmt.setInt(1, eid);
				stmt.executeUpdate();
			}
			
			
			 con = DBConnection.connect();
			 query = "select * from user where uemail=? and upassword=?";
			 stmt = con.prepareStatement(query);
			stmt.setString(1, email);
			stmt.setString(2, password);
			 rs = stmt.executeQuery();
			if(rs.next())
			{
				User.setId(rs.getInt(1));
				User.setName(rs.getString(2));
				User.setEmail(rs.getString(3));
				User.setMobileno(rs.getString(4));
				User.setLocation(rs.getString(5));
				User.setCity(rs.getString(6));
				User.setTaluka(rs.getString(7));
				User.setPassword(rs.getString(8));
				
				response.sendRedirect("userhome.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
