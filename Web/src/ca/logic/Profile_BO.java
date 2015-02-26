package ca.logic;

import ca.model.StudentModel;
import ca.objects.User;
import ca.persistence.DB;
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
		Object[][] data = StudentModel.getUserData(user.getUsername());
		String password = data[0][2].toString();
		
		if( user.getPassword().equals(password) ){
			user.loadData(data);
			
			result = true;
			
		}
		
		return result;
	}
	
	public User getUser() {
		return user;
	}
	
}
