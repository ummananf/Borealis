package ca.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.objects.Course;
import ca.objects.User;

//Extend HttpServlet class
@SuppressWarnings("serial")
public class ClassInfoServlet extends HttpServlet {


	/**
	 * doGet is logic that should be done before the page is rendered
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		
		
		// create an Arraylist ot hold courses
		ArrayList<Course> courses = new ArrayList<Course>();
		
		// get the model from DB
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		RequestDispatcher view = req.getRequestDispatcher("classInfo.jsp");	
		view.forward(req, res);
	}

	/**
	 * doPost is logic that should be done after a button is clicked
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		//manipulate data on submit here

	}
}
