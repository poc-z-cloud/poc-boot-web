package greateq.web.console.domain;

import java.util.List;

public class AdminLogin {
	private AdminUser user;
	private List<AdminRole> roles;
	private List<Long> systemIds;
	
	public AdminUser getUser() {
		return user;
	}
	public void setUser(AdminUser user) {
		this.user = user;
	}
	public List<AdminRole> getRoles() {
		return roles;
	}
	public void setRoles(List<AdminRole> roles) {
		this.roles = roles;
	}
	public List<Long> getSystemIds() {
		return systemIds;
	}
	public void setSystemIds(List<Long> systemIds) {
		this.systemIds = systemIds;
	}
	
	
	
}
