/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.database.exception;

/**
 *
 * @author Alex
 */
public class RecoverableDBException extends DBException {
	public RecoverableDBException(String msg) {
	  super(msg,null);
	}
}
