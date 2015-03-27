package ca.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.logic.CourseSelectionLogic;
import ca.objects.Enrollment;
import ca.objects.Section;
import ca.objects.User;
import ca.persistence.SectionModel;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

public class RegisterCoursesServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		
		RequestDispatcher view = req.getRequestDispatcher("registerCourses.jsp");
		view.forward(req, res);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		
		CourseSelectionLogic csLogic = new CourseSelectionLogic();
		String json = null ;
		
		String term = req.getParameter("termName");
		
		if (term != null) 
		{
			LinkedHashMap<String, LinkedHashMap<String, String>> winter2015 = csLogic.getDegrees("Winter2015");  
			LinkedHashMap<String, LinkedHashMap<String, String>> fall2014 = csLogic.getDegrees("Fall2014");    
			LinkedHashMap<String, LinkedHashMap<String, String>> reset = new LinkedHashMap<String, LinkedHashMap<String, String>>();
			LinkedHashMap<String, String> temp = new LinkedHashMap<String, String>();
			temp.put("degName", "Select Term:");
		    reset.put("reset", temp);
		   
		    json= new Gson().toJson(winter2015);

		    if(term.equals("winter2015"))
		    {
		    	System.out.println("JSON = WINTER2015");
		    	json= new Gson().toJson(winter2015); 
		    }
		    else if(term.equals("fall2014"))
		    {
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
		boolean sendingSects = false;
		JsonArray jsonSections = null;
		
		if (category != null) 
		{
			sendingSects = true;
			
			ArrayList<Section> sections = new ArrayList<Section>();

			sections = SectionModel.getSectionsByDeptAndTerm(category, term);

			// setup gson for coverting object to json object
			Gson gsonSection = new Gson();
			
			// start converting object to json....
			JsonElement element = gsonSection.toJsonTree(sections, new TypeToken<ArrayList<Section>>() {}.getType());
			
			// final conversion
			jsonSections = element.getAsJsonArray();
			
			req.setAttribute("currSections", jsonSections);
			
			// Tell servlet that we are sending JSON
			res.setContentType("application/json");
			
		}

	    res.setContentType("application/json");
	    
	    if(sendingSects)
	    	res.getWriter().print(jsonSections);
	    else
	    {
	    	res.setCharacterEncoding("UTF-8");
	    	res.getWriter().write(json);    
	    }
	}
}
