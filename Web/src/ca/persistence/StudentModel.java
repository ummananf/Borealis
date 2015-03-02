package ca.persistence;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ca.objects.Enrollment;
import ca.objects.Prereq;



public class StudentModel {
	
	public static ArrayList<Enrollment> getCompletedCourses(int studentID)
	{
		String query = "SELECT * FROM Enrolled WHERE userID = "+studentID+" AND grade IS NOT NULL;";
		Connection connection = ConnectionManager.getConnection();
		
		ResultSet data = null;
		ArrayList<Enrollment> courses = new ArrayList<Enrollment>();
	
		
		try {		
			Statement statement = connection.createStatement();
			data = statement.executeQuery(query);
			
			// This needs to be done before statement and connection is closed!
			// Get all courses ids returned from query and put into array list
			while(data.next())
			{
				Enrollment temp = new Enrollment(data.getString("cID"), data.getFloat("grade"));
				courses.add(temp);
			}
			
			statement.close();
		} catch (SQLException e) {
			System.out.println("error reading enrolled data from DB");
			e.printStackTrace();
		}
		
		ConnectionManager.closeConnection(connection);

		return courses;
	}
	
	
	// Gets list of prereqs for given courseID
	public static ArrayList<Prereq> getPrereqs(String courseID)
	{
		String query = "SELECT * FROM Prereqs WHERE cID = '"+courseID+"';";
		Connection connection = ConnectionManager.getConnection();
		
		ResultSet data = null;
		ArrayList<Prereq> prereqs = new ArrayList<Prereq>();
	
		
		try {		
			Statement statement = connection.createStatement();
			data = statement.executeQuery(query);
			
			// This needs to be done before statement and connection is closed!
			// Get all courses ids returned from query and put into array list
			while(data.next())
			{
				Prereq temp = new Prereq(data.getString("cID"), 
										 data.getString("prereqCID"),
										 data.getFloat("minGrade"));
				prereqs.add(temp);
			}
			
			statement.close();
		} catch (SQLException e) {
			System.out.println("error reading prereq data from DB");
			e.printStackTrace();
		}
		
		ConnectionManager.closeConnection(connection);

		return prereqs;
	}

}
