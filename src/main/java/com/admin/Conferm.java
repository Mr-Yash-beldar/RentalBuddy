package com.admin;

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
 * Servlet implementation class Conferm
 */
public class Conferm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Conferm() {
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

		int uid = User.getId();
		int eid = Integer.parseInt(request.getParameter("eid"));
		float totalamount = Float.parseFloat(request.getParameter("totalamount"));
		
		String uname = User.getName();
		String ucontact = User.getMobileno();
		String location = User.getLocation();
		String rdate = request.getParameter("rdate");
		
		
		try {
			Connection con = DBConnection.connect();
			String query = "SELECT  equipment.ename, admin.aname,admin.aid FROM equipment JOIN admin ON equipment.aid = admin.aid where eid=?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, eid);
			ResultSet rs = stmt.executeQuery();
			String ename = null;
			String aname = null;
			int aid = 0;
			if(rs.next())
			{
				ename = rs.getString(1);
				aname = rs.getString(2);
				aid = rs.getInt(3);
			}
			
			query = "insert into confermorder values(?,?,?,?,?,?,?,?,?,?,?)";
			stmt = con.prepareStatement(query);
			stmt.setInt(1, 0);
			stmt.setInt(2, eid);
			stmt.setInt(3, aid);
			stmt.setInt(4, uid);
			stmt.setString(5, ename);
			stmt.setString(6, aname);
			stmt.setString(7, uname);
			stmt.setString(8, location);
			stmt.setString(9, ucontact);
			stmt.setFloat(10, totalamount);
			stmt.setString(11, rdate);
			stmt.executeUpdate();
			
			query = "update equipment set eavailable = 'unavailable' where eid = ?";
			stmt = con.prepareStatement(query);
			stmt.setInt(1, eid);
			int i = stmt.executeUpdate();
			if(i>0){
			response.sendRedirect("userorder.jsp");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		doGet(request, response);
	}

}
