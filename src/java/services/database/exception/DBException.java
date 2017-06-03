
package services.database.exception;

import util.Logger;

public class DBException extends Exception {
  
	protected String message;

	public DBException() {}

	public DBException(String msg) {
		super(msg);
		this.message = msg;
	}
	
	public DBException(String level, Exception ex, String className, String methodName, String msg) {
		super(msg + " : " + ex.getMessage());
		this.message = msg;
		Logger.log(level, className, methodName, msg + "\n" + ex.getMessage());
	}

	public String getMsg() {
		return message;
	}
}

