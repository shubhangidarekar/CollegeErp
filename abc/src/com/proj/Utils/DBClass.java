package com.proj.Utils;
import java.sql.*;
public class DBClass {

	static Connection con=null;
	static final String url="jdbc:mysql://localhost:3306/mentordb";
	static final String user="root";
	static final String password="";
	
public static Connection DBConnectMethod(){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Adapter for MYSQL Found ...");
			con=DriverManager.getConnection(url, user, password);
		}
		catch(ClassNotFoundException c){
			c.printStackTrace();
		}
		catch(Exception d){
			d.printStackTrace();
			System.out.println("Failed to Connect the MySql Server...");
		}
		
		
		return con;
	}
	
	
}
