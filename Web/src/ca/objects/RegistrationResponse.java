package ca.objects;

public class RegistrationResponse {

	private boolean success;
	private String msg;
	
	public RegistrationResponse(boolean success, String msg) {
		
		this.success = success;
		this.msg = msg;
	}

	public boolean isSuccess() {
		return success;
	}

	public String getMsg() {
		return msg;
	}

}
