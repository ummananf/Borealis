package ca.logic;

import ca.objects.User;
import ca.persistence.DB;
import ca.persistence.StudentDataRetrieval;

/**
 * This class is used as the business logic class - will talk to the persistence and send data back to the servlet layer through returns
 * @author IceMasterCho
 *
 */
public class Profile_BO {

	private User user;
	
	public Profile_BO(User user) {
		
		this.user = user;
	}
	
	public boolean isValid() {
		boolean result = false;
		
		if( user.getPassword().equals(StudentDataRetrieval.getUserData(user.getUsername())) )
			result = true;
		
		return result;
	}
	
	public User getUser() {
		return user;
	}
	
}
