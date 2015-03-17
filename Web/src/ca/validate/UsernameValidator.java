package ca.validate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UsernameValidator 
{
	private static Pattern pattern;
	private static Matcher matcher;
	

	private static final String USERNAME_PATTERN = 
		"^[a-zA-Z]*$";
	
	public static boolean validate(String username) 
	{
		pattern = Pattern.compile(USERNAME_PATTERN);
		matcher = pattern.matcher(username);
		return matcher.matches();
	}	
}
