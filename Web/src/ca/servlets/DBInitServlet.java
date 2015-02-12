package ca.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.objects.ConnectionManager;

@SuppressWarnings("serial")
public class DBInitServlet extends HttpServlet {
	
	/**
	 * This is the starting point when we are connecting to the website.
	 * Here we will create the tables, and then redirect to the Login servlet.
	 * Right now it is also used for testing - does not redirect to login.
	 * NOTE: every time the app starts here, a new row is inserted to the table.
	 */
	@Override
	public void init() {
		
		String createTable = "CREATE TABLE IF NOT EXISTS UserTable (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, username char(50), password char(50), type char(7));";
		String insertRow = "INSERT INTO UserTable (username, password, type) VALUES ('user', 'password', 'student');";
		Connection connection = ConnectionManager.getConnection();
		
		if (connection != null) {
			try {
				Statement setupStatement = connection.createStatement();
				setupStatement.addBatch(createTable);
				setupStatement.addBatch(insertRow);
				setupStatement.executeBatch();
				setupStatement.close();
			} catch (SQLException ex) {
			    // handle any errors
			    System.out.println("SQLException: " + ex.getMessage());
			    System.out.println("SQLState: " + ex.getSQLState());
			    System.out.println("VendorError: " + ex.getErrorCode());
			} finally {
			    System.out.println("Closing the connection.");
			    if (connection != null) ConnectionManager.closeConnection(connection);
			}
		}
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		String message = "";
		ResultSet resultSet;
		Statement readStatement;
		Connection connection = ConnectionManager.getConnection();
		
		if (connection != null) {
			try {
				Statement setupStatement = connection.createStatement();
				readStatement = connection.createStatement();
				resultSet = readStatement.executeQuery("SELECT * FROM UserTable;");
				while (resultSet.next()) {
					message += resultSet.getInt(1) + ", ";
					message += resultSet.getString(2) + ", ";
					message += resultSet.getString(3) + ", ";
					message += resultSet.getString(4) + "\n";
				}
			    resultSet.close();
			    readStatement.close();
			} catch (SQLException ex) {
			    // handle any errors
			    System.out.println("SQLException: " + ex.getMessage());
			    System.out.println("SQLState: " + ex.getSQLState());
			    System.out.println("VendorError: " + ex.getErrorCode());
			} finally {
			    System.out.println("Closing the connection.");
			    if (connection != null) ConnectionManager.closeConnection(connection);
			}
		}
  	     
	      // Set response content type
	      res.setContentType("text/html");

	      // Actual logic goes here.
	      PrintWriter out = res.getWriter();
	      out.println("<h1>" + message + "</h1>");
		
		// res.sendRedirect("/login");

	}

}
