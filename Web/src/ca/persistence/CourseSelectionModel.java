package ca.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ca.objects.Degree;


public class CourseSelectionModel {

	private static String GET_COURSES_FOR_TERM =
			"Select * " +
			"from Degrees " +
			"where term=? ";
	
	public static ArrayList<Degree> getDegrees( String term ){
		
		Connection connection = ConnectionManager.getConnection();
		
		ResultSet data = null;
		ArrayList<Degree> degrees = new ArrayList<Degree>();
	
		
		try {		
			PreparedStatement statement = connection.prepareStatement(GET_COURSES_FOR_TERM);
			statement.setString(1, term);
System.out.println(statement.toString());
			data = statement.executeQuery();
			
			// This needs to be done before statement and connection is closed!
			// Get all courses ids returned from query and put into array list
			while(data.next())
			{
				Degree temp = new Degree(data.getString("degProgram"), 
										 data.getString("degOption"),
										 data.getString("degName"),
										 data.getInt("totalCreditHrs"));
				degrees.add(temp);
			}
			statement.close();
		} catch (SQLException e) {
			System.out.println("error reading degrees data from DB");
			e.printStackTrace();
		}
		
		ConnectionManager.closeConnection(connection);

		return degrees;
	}
	
}
