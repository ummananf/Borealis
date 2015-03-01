package ca.objects;

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
	public User(Object[][] data)
	{
		userID = Integer.parseInt(data[0][0].toString());
		username = data[0][1].toString();
		password = data[0][2].toString();
		email = data[0][3].toString();
		firstName = data[0][4].toString();
		lastName = data[0][5].toString();
		type = data[0][6].toString();
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

//	public void loadData(Object[][] data) {
//		this.email = data[0][3].toString();
//		this.firstName = data[0][4].toString();
//		this.lastName = data[0][5].toString();
//
//		System.out.println(this.toString());
//	}

}
