package ca.persistence;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ca.objects.Enrollment;



public class StudentModel {
	
	
	// TODO: may have to add a "gradeReceived" boolean to DB table, since grade will be read as 0 if it is NULL
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
				Enrollment temp = new Enrollment(data);
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

}
