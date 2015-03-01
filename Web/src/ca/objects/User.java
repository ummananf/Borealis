package ca.objects;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {

	private int userID;
	private String username, password, email, firstName, lastName, type;

	public User(int userID, String username, String password, String email, String fName, String lName, String type) {
		this.userID = userID;
		this.username = username;
		this.password = password;
		this.email = email;
		firstName = fName;
		lastName = lName;
		this.type = type;
	}
	
	// For creating from DB data:
	public User(ResultSet data)
	{
		try {
			// Get attributes from table at current row by querying column labels
			userID = data.getInt("userID");
			username = data.getString("username");
			password = data.getString("password");
			email = data.getString("email");
			firstName = data.getString("fName");
			lastName = data.getString("lName");
			type = data.getString("userType");
		} catch (SQLException e) {
			System.out.println("error creating new User from DB data");
			e.printStackTrace();
		}
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String toString() {
		return "ID: "+userID+"\nUsername: " + username + "\nPassword: " + password
				+ "\nFirst Name: " + this.firstName + "\nLast Name: "
				+ this.lastName + "\nEmail: " + this.email +"\nUser Type: "+type;
	}

}
