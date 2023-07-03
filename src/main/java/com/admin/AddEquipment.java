package com.admin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.db.DBConnection;


@MultipartConfig(maxFileSize = 16177215)
public class AddEquipment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
    public AddEquipment() {
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
		String name = request.getParameter("name");
		
		System.out.println(name);
		String about = request.getParameter("about");
		System.out.println(about);
		String category = request.getParameter("category");
		
		System.out.println(category);
		float hprice = Float.parseFloat(request.getParameter("hprice"));
		System.out.println(hprice);
		float dprice = Float.parseFloat(request.getParameter("dprice"));
		System.out.println(dprice);
		float deposite = Float.parseFloat(request.getParameter("deposite"));
		System.out.println(deposite);
		String date = request.getParameter("date");
		System.out.println(date);
		InputStream inputStream = null;
		
		
		Part filePart = request.getPart("image");
		if(filePart != null)
		{
			inputStream = filePart.getInputStream();
		}
		
		
		
		int adminid = Admin.getId();
		
		try {
			Connection con = DBConnection.connect();
			String query = "insert into equipment (eid,aid,ename,eabout,eavailable,ecategary,ehourprice,edayprice,edeposite,edate,eimage) values (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, 0);
			stmt.setInt(2, adminid);
			stmt.setString(3, name);
			stmt.setString(4, about);
			stmt.setString(5, "available");
			stmt.setString(6, category);
			stmt.setFloat(7, hprice);
			stmt.setFloat(8, dprice);
			stmt.setFloat(9, deposite);
			stmt.setString(10, date);
			
			if(inputStream != null)
			{
				stmt.setBinaryStream(11, inputStream, inputStream.available());
			}
		
			int i = stmt.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("home.jsp");
			}
			else{
				response.sendRedirect("addequipment.jsp");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		doGet(request, response);
	}

}
