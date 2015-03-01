package ca.objects;

import java.sql.ResultSet;

public class Student extends User {

	public Student(int userID, String username, String password, String email,
			String fName, String lName, String type) {
		super(userID, username, password, email, fName, lName, type);
	}
	
	public Student(ResultSet data)
	{
		super(data);
	}

}
