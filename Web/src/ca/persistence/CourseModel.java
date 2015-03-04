package ca.persistence;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ca.objects.Prereq;

public class CourseModel {

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
