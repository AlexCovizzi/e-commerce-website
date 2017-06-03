package util;

public class Logger {
	private static String SEPARATOR = "----------------------------------------------------------------------------------\n";
	public static String DEBUG = "DEBUG";
	public static String WARNING = "WARNING";
	public static String ERROR = "ERROR";
	
	public static void log(String level, String className, String methodName, String msg) {
		java.util.Date now = new java.util.Date();
		System.out.println(SEPARATOR + now + "\t" + level + "\t" + className + " : " + methodName + "\n" + msg +"\n");
	}
	
	public static void debug(String className, String methodName, String msg) {
		log("DEBUG", className, methodName, msg);
	}
	
	public static void warning(String className, String methodName, String msg) {
		log("WARNING", className, methodName, msg);
	}
	
	public static void error(String className, String methodName, String msg) {
		log("ERROR", className, methodName, msg);
	}
}
