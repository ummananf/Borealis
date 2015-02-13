package ca.logic;

import ca.objects.User;

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
		//removed logic for now...
		return true;
	}
	
	public User getUser() {
		return user;
	}
	
}
