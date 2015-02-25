package ca.persistence;

public class StudentDataRetrieval {
	
	public static Object[][] getUserData(String username)
	{
		String query = "SELECT * FROM Users WHERE username = '" + username + "';";
		Object[][] data = null;
		String password = "";
		
		data = DB.executeQuery(query);
		if(data != null)
		{
			password = data[0][2].toString();
			System.out.println("password retrieved: " + password);
		}

		return data;
	}
}
