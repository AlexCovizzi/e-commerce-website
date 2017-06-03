package bflows;

import java.io.Serializable;

public abstract class AbstractManagement implements Serializable {
	private String errorMessage;
	
	public void setErrorMessage(String message) {
		this.errorMessage = message;
	}
	
	public String getErrorMessage() {
		return errorMessage;
	}
}
