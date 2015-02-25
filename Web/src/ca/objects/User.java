package ca.objects;

public class User {

	private String username, password, email, firstName, lastName;
	
	public User( String username, String password ){
		
		this.username = username;
		this.password = password;
		
	}
	
	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}
	
	public String toString(){
		return "Username: " + username + "\nPassword: " + password + "\nFirst Name: " + this.firstName + "\nLast Name: " + this.lastName + "\nEmail: " + this.email;
	}

	public void loadData(Object[][] data) {
		this.email = data[0][3].toString();
		this.firstName = data[0][4].toString();
		this.lastName = data[0][5].toString();
		
		System.out.println(this.toString());
	}
	
}
