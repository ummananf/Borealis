package ca.objects;

public class Professor extends User {

	public Professor(int userID, String username, String password,
			String email, String fName, String lName, String type) {
		super(userID, username, password, email, fName, lName, type);
		
		
	}
	public Professor(Object[][] data)
	{
		super(data);
	}
}
