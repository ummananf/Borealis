package ca.logic;

import ca.objects.User;
import ca.persistence.Profile_PE;

/**
 * This class is used as the business logic class - will talk to the persistence and send data back to the servlet layer through returns
 * @author IceMasterCho
 *
 */
public class Profile_BO {

	private User user;
	
	public Profile_BO( User user ){
		
		this.user = user;
	}
	
	public boolean isValid(){
		
		if( Profile_PE.isUserValid( user ) ){
			return true;
		} 
		else {
			return false;
		}
	}
	
	public User getUser(){
		return user;
	}
	
}
