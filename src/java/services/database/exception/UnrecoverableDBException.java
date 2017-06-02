/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.database.exception;

import util.Logger;


/**
 *
 * @author Alex
 */
public class UnrecoverableDBException extends DBException {
	public UnrecoverableDBException(String msg) {
	  super(msg);
	}
	
	public UnrecoverableDBException(Exception ex, String className, String methodName, String msg) {
		super(Logger.ERROR, ex, className, methodName, msg);
	}
}
