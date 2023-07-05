package com.admin;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.db.DBConnection;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	
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
		
		LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
		System.out.println(formattedDateTime);
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
			
			
			
			
			 query = "select * from admin where aemail=? and apassword=?";
			 stmt = con.prepareStatement(query);
			 stmt.setString(1, email);
			 stmt.setString(2, password);
		     rs = stmt.executeQuery();
		     
		     
			if(rs.next())
			{
				Admin.setId(rs.getInt(1));
				Admin.setName(rs.getString(2));
				Admin.setEmail(rs.getString(3));
				Admin.setMobileno(rs.getString(4));
				Admin.setLocation(rs.getString(5));
				Admin.setCity(rs.getString(6));
				Admin.setTaluka(rs.getString(7));
				Admin.setPassword(rs.getString(8));
				Admin.setLatitude(rs.getDouble(9));
				Admin.setLongitude(rs.getDouble(10));
				response.sendRedirect("home.jsp");
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
