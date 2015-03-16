package ca.servlets;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class BooksServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		RequestDispatcher view = req.getRequestDispatcher("books.jsp");
		
		view.forward(req, res);

	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
	
	}
}
