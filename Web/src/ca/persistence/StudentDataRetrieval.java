package ca.persistence;

public class StudentDataRetrieval {
	
	public static String getUserData(String username)
	{
		String query = "SELECT password FROM Users WHERE username = '" + username + "';";
		Object[][] data = null;
		String password = "";
		
		data = DB.executeQuery(query);
		if(data != null)
		{
			password = data[0][0].toString();
			System.out.println("password retrievedadsfaadadf: " + password);
		}
		
		System.out.println("This has been called");

		return password;
	}
}
