package greateq.web.console.service;

import java.util.HashMap;
import java.util.Map;

public class ServiceException extends Exception{
	public static final String ERROR_CODE_USER_NOT_FOUND="E0001";
	public static final String ERROR_CODE_USER_DISABLED="E0002";
	public static final String ERROR_CODE_USER_LOCKED="E0003";
	public static final String ERROR_CODE_PASSWORD_WRONG="E0004";

	public static final String ERROR_CODE_UNKNOWN="E9999";

	private static Map<String,String> errorMap = new HashMap<String,String>();
	
	static{
		errorMap.put(ERROR_CODE_USER_NOT_FOUND, "User not found.");
		errorMap.put(ERROR_CODE_USER_DISABLED, "User has been disabled.");
		errorMap.put(ERROR_CODE_USER_LOCKED, "User has been locked.");
		errorMap.put(ERROR_CODE_PASSWORD_WRONG, "User/password do not match.");

		errorMap.put(ERROR_CODE_UNKNOWN, "Unknown error.");

	}
	
	private static final long serialVersionUID = -8370262851044682253L;

	private String errorCode=ERROR_CODE_UNKNOWN;
	private Exception innerException = new Exception("details required");

	public static ServiceException throwException(String errorCode){
		ServiceException ex= new ServiceException();
		ex.setErrorCode(errorCode);
		return ex;
	}

	public static ServiceException throwException(String errorCode,Exception innerException){
		ServiceException ex= new ServiceException();
		ex.setErrorCode(errorCode);
		ex.setInnerException(innerException);
		
		return ex;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	@Override
	public String getMessage() {
		if (ERROR_CODE_UNKNOWN.equals(errorCode)){
			return "Unknow error: " + innerException.getMessage();
		}
		
		if (errorMap.containsKey(errorCode)){
			return errorMap.get(errorCode);
		}
		
		return "Unknow error: " + innerException.getMessage();
	}

	public Exception getInnerException() {
		return innerException;
	}

	public void setInnerException(Exception innerException) {
		this.innerException = innerException;
	}

	
}
