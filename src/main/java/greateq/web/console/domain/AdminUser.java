package greateq.web.console.domain;

import java.util.Date;

public class AdminUser extends Entity{

	private String name="";
	private String password="";
	private String fullName="";
	private String userType="";
	
	
	private Boolean forbidden=false;
	private Boolean locked=false;
	private Boolean isAdmin=false;
	
	private Date createdTime = new Date();
	private Date LoginTime;
	private Date LogoutTime;
	
	private Integer triedTimes=0;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Boolean getForbidden() {
		return forbidden;
	}

	public void setForbidden(Boolean forbidden) {
		this.forbidden = forbidden;
	}

	public Boolean getLocked() {
		return locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getLoginTime() {
		return LoginTime;
	}

	public void setLoginTime(Date loginTime) {
		LoginTime = loginTime;
	}

	public Date getLogoutTime() {
		return LogoutTime;
	}

	public void setLogoutTime(Date logoutTime) {
		LogoutTime = logoutTime;
	}

	public Integer getTriedTimes() {
		return triedTimes;
	}

	public void setTriedTimes(Integer triedTimes) {
		this.triedTimes = triedTimes;
	}
	

	

}
