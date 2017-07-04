package util;

import global.Constants;

public class Logger {
	private static final String SEPARATOR = "----------------------------------------------------------------------------------\n";
	public static String DEBUG = "DEBUG";
	public static String WARNING = "WARNING";
	public static String ERROR = "ERROR";
	
	public static void log(String level, String msg) {
		if(level.equals(DEBUG) && Constants.DEBUG ||
			level.equals(WARNING) && Constants.WARNING ||
			level.equals(ERROR) && Constants.ERROR) {
			
			java.util.Date now = new java.util.Date();
			System.out.println(SEPARATOR + level + "\t" + now + "\n" + msg +"\n");
		}
	}
	
	public static void log(String level, String className, String methodName, String msg) {
		if(level.equals(DEBUG) && Constants.DEBUG ||
			level.equals(WARNING) && Constants.WARNING ||
			level.equals(ERROR) && Constants.ERROR) {
			
			java.util.Date now = new java.util.Date();
			System.out.println(SEPARATOR + level + "\t" + now + "\t" + className + " : " + methodName + "\n" + msg +"\n");
		}
	}
	
	public static void debug(Object obj) {
		log(DEBUG, ""+obj);
	}
	
	public static void debug(String className, String methodName, String msg) {
		log(DEBUG, className, methodName, msg);
	}
	
	public static void warning(String msg) {
		log(WARNING, msg);
	}
	
	public static void warning(String className, String methodName, String msg) {
		log(WARNING, className, methodName, msg);
	}
	
	public static void error(String msg) {
		log(ERROR, msg);
	}
	
	public static void error(String className, String methodName, String msg) {
		log(ERROR, className, methodName, msg);
	}
}
