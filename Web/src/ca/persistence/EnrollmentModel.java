package ca.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import ca.objects.Enrollment;
import ca.objects.Section;  



// get the Enrollment Record based on the given userID
public class EnrollmentModel 
{
	private static String GET_ALL_ENROLLMENT_RECORDS =
			"SELECT * "
			+ "FROM Enrolled "
			+ "INNER JOIN Sections "
			+ "ON (Enrolled.crn = Sections.crn) "
			+"WHERE Enrolled.userID=? ";
	
	private static String GET_ALL_DETAILED_ENROLLMENT_RECORDS =
			"SELECT * "
			+ "FROM Enrolled "
			+ "INNER JOIN Sections "
			+ "ON (Enrolled.crn = Sections.crn) "
			+ "INNER JOIN Courses "
			+ "ON (Sections.cID = Courses.cID) "
			+ "WHERE Enrolled.userID=? ";
	
	
	public static ArrayList<Enrollment> getEnrollmentRecord( int userID )
	{
		
		Connection connection = ConnectionManager.getConnection();
		
		ResultSet data = null;
		ArrayList<Enrollment> currEnrollments = new ArrayList<Enrollment>();
		PreparedStatement prepStatement = null;
	
		try 
		{		
			prepStatement = connection.prepareStatement(GET_ALL_ENROLLMENT_RECORDS);
			prepStatement.setInt(1, userID);
System.out.println(prepStatement.toString());
			data = prepStatement.executeQuery();
			
		
			while(data.next())
			{
				Enrollment tempEnrollment = new Enrollment(
										 data.getInt("userID"),
										 data.getString("crn"),
										 data.getString("sectID"),
										 data.getString("cID"),
										 data.getDate("termStart"),
										 data.getFloat("grade"));
				
				currEnrollments.add(tempEnrollment);
			}
			
		} 
		catch (SQLException e) 
		{
			System.out.println("error reading Enrollment data from DB");
			e.printStackTrace();
		}
		finally
		{ // We have to clean up no matter what
			try 
			{
				if (null != prepStatement)
				{ // make sure we don't call method based on a null value
					prepStatement.close();
				}
			} 
			catch (SQLException e) 
			{	
				e.printStackTrace();
			}
			prepStatement = null;  // The final clean up, free everything
		}
		ConnectionManager.closeConnection(connection);

		return currEnrollments;
	}
	
	
	
	public static ArrayList<Section> getDetailedEnrollmentRecords( int userID )
	{		
			Connection connection = ConnectionManager.getConnection();
			
			ResultSet data = null;
			ArrayList<Section> currEnrollments = new ArrayList<Section>();
			PreparedStatement prepStatement = null;
		
			try 
			{		
				prepStatement = connection.prepareStatement(GET_ALL_DETAILED_ENROLLMENT_RECORDS);
				prepStatement.setInt(1, userID);
	System.out.println(prepStatement.toString());
				data = prepStatement.executeQuery();
				
			
				while(data.next())
				{					
					Section tempSection = new Section(
										  data.getString("sectID"),
										  data.getString("crn"),
										  data.getString("cID"),
										  data.getString("cName"),
										  data.getDate("termStart"),
										  data.getInt("maxSize"),
										  data.getString("days"),
										  data.getTime("startTime"),
										  data.getTime("endTime"),
										  data.getString("location"));
					
					currEnrollments.add(tempSection);
				}
				
			} catch (SQLException e) 
			{
				System.out.println("error reading Enrollment data from DB");
				e.printStackTrace();
			}
			finally
			{ // We have to clean up no matter what
				try 
				{
					if (null != prepStatement)
					{ // make sure we don't call method based on a null value
						prepStatement.close();
					}
				} 
				catch (SQLException e) 
				{	
					e.printStackTrace();
				}
				prepStatement = null;  // The final clean up, free everything
			}
			ConnectionManager.closeConnection(connection);
	
			return currEnrollments;
		}	
}
