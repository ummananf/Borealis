package ca.servlets;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.logic.CourseSelectionLogic;

import com.google.gson.Gson;

//Extend HttpServlet class
@SuppressWarnings("serial")
public class RegisterCoursesServlet extends HttpServlet {



	/**
	 * doGet is logic that should be done before the page is rendered
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		
		RequestDispatcher view = req.getRequestDispatcher("registerCourses.jsp");
		view.forward(req, res);

	}

	/**
	 * doPost is logic that should be done after a button is clicked
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		CourseSelectionLogic csLogic = new CourseSelectionLogic();
		String json = null ;
		
		String term = req.getParameter("termName");
		
		if (term != null) {
			LinkedHashMap<String, LinkedHashMap<String, String>> winter2015 = csLogic.getDegrees("Winter2015");  
			LinkedHashMap<String, LinkedHashMap<String, String>> fall2014 = csLogic.getDegrees("Fall2014");    
			LinkedHashMap<String, LinkedHashMap<String, String>> reset = new LinkedHashMap<String, LinkedHashMap<String, String>>();
			LinkedHashMap<String, String> temp = new LinkedHashMap<String, String>();
			temp.put("degName", "Select Term:");
		    reset.put("reset", temp);
		   
		    json= new Gson().toJson(winter2015);

		    if(term.equals("winter2015")){
		    	System.out.println("JSON = WINTER2015");
		    	json= new Gson().toJson(winter2015); 
		    }
		    else if(term.equals("fall2014")){
		    	System.out.println("JSON = FALL2014");
		    	json=new Gson().toJson(fall2014);  
		    }
		    else if(term.equals("Select Term:"))
		    {
		    	System.out.println("JSON = RESET");
		    	json=new Gson().toJson(reset);
		    }
		}
		
		String category = req.getParameter("categoryName");
		
		System.out.println("RegisterCourses: Category: " + category);
		
		if (category != null) {
			LinkedHashMap<String, LinkedHashMap<String, String>> courses = csLogic.getCourses(category);
			json = new Gson().toJson(courses);
		}
		
		System.out.println("Sending json: " + json);


	    res.setContentType("application/json");
	    res.setCharacterEncoding("UTF-8");
	    res.getWriter().write(json);    

	}
}
