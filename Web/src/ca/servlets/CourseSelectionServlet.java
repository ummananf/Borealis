package ca.servlets;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

/**
 * Servlet implementation class ActionServlet
 */

public class CourseSelectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public CourseSelectionServlet() {
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String term=request.getParameter("termName");
		Map<String, String> winter2015 = new LinkedHashMap<String, String>();
	    winter2015.put("1", "Computer Science");
	    winter2015.put("2", "Engineering");
	    winter2015.put("3", "Math");
	    winter2015.put("4", "Stat");
	    
	    Map<String, String> fall2014 = new LinkedHashMap<String, String>();
	    fall2014.put("1", "Bio");
	    fall2014.put("2", "Politics");
	    fall2014.put("3", "Physics");
	    fall2014.put("4", "Econ");
	    
	    Map<String, String> reset = new LinkedHashMap<String, String>();
	    reset.put("1", "Select Term");
	    
	    String json = null ;
	    if(term.equals("201512")){
	    	json= new Gson().toJson(winter2015);   
	    }
	    else if(term.equals("201409")){
	    	json=new Gson().toJson(fall2014);  
	    }
	    else if(term.equals("Select Term:"))
	    {
	    	json=new Gson().toJson(reset);
	    }
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}

