package ca.validate;

public class PasswordValidator 
{
	public static boolean validate(String newPassword, String oldPassword)
	{
		boolean isValid = false;
		
		if(!newPassword.equals(oldPassword) && (newPassword.length() <= 16 && newPassword.length() >= 4))
		{
			isValid = true;
		}

		return isValid;
	}
}
