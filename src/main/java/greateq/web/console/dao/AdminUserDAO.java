package greateq.web.console.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import greateq.web.console.domain.AdminUser;
import greateq.web.console.util.DBAPI;

public class AdminUserDAO extends EntityDAO<AdminUser>{

	public AdminUserDAO(Connection cn){
		super(cn);
	}

	public String[][] getAssignedUserListByRoleId(Long roleId){
		StringBuilder sb= new StringBuilder("select r.* from ADMIN_USER r, ADMIN_USER_ROLE ur where r.ID=ur.USER_ID and ur.ROLE_ID=");
		sb.append(roleId);
		
		return DBAPI.getList(cn, sb.toString());
	}
	
	public String[][] getAvailableUserListByRoleId(Long roleId){
		StringBuilder sb= new StringBuilder("select ID,NAME from ADMIN_USER where ID not in (select USER_ID from ADMIN_USER_ROLE where ROLE_ID=");
		sb.append(roleId);
		sb.append(")");
		
		return DBAPI.getList(cn, sb.toString());
	}

	public void grantRoles(Long userId,Long[] roleIds){
		String sql="delete ADMIN_USER_ROLE where USER_ID=" + userId;
		DBAPI.executeUpdate(cn, sql);
		if (roleIds!=null){
			for (int i=0;i<roleIds.length;i++){
				sql="insert into ADMIN_USER_ROLE(USER_ID,ROLE_ID) values (" + userId+","+roleIds[i]+")";
				DBAPI.executeUpdate(cn, sql);
			}
				
		}
	}
	
	@Override
	protected String getTableName() {
		return "ADMIN_USER";
	}

	@Override
	protected String buildWhereCondition(AdminUser adminUser){
		StringBuilder sb = new StringBuilder();
		if (adminUser.getName()!=null && !"".equals(adminUser.getName())){
			sb.append(" and UPPER(NAME) like '%"+adminUser.getName().toUpperCase().replace("'", "''") + "%'");
		}
		
		if (adminUser.getFullName()!=null && !"".equals(adminUser.getFullName())){
			sb.append(" and UPPER(FULL_NAME) like '%"+adminUser.getFullName().toUpperCase().replace("'", "''") + "%'");
		}
		return sb.toString();
		
	}

	@Override
	protected AdminUser rs2Entity(ResultSet rs) throws SQLException {
		AdminUser adminUser = new AdminUser();
		
		adminUser.setId(rs.getLong("ID"));
		adminUser.setName(rs.getString("NAME"));
		adminUser.setFullName(rs.getString("FULL_NAME"));
		adminUser.setPassword(rs.getString("PASSWORD"));
		adminUser.setUserType(rs.getString("USER_TYPE"));
		adminUser.setLocked(rs.getBoolean("LOCKED"));
		adminUser.setForbidden(rs.getBoolean("FORBIDDEN"));
		adminUser.setIsAdmin(rs.getBoolean("IS_ADMIN"));
		adminUser.setLoginTime(rs.getTimestamp("LOGON_TIME"));
		adminUser.setLogoutTime(rs.getTimestamp("LOGOUT_TIME"));
		adminUser.setTriedTimes(rs.getInt("TRIED_TIMES"));
		
		return adminUser;
	}


	@Override
	protected void entity2Rs(AdminUser adminUser, ResultSet rs) throws SQLException {
		rs.updateString("NAME", adminUser.getName());
		rs.updateString("FULL_NAME", adminUser.getFullName());
		rs.updateString("PASSWORD", adminUser.getPassword());
		rs.updateString("USER_TYPE", adminUser.getUserType());
		rs.updateBoolean("LOCKED", adminUser.getLocked());
		rs.updateBoolean("FORBIDDEN", adminUser.getForbidden());
		rs.updateBoolean("IS_ADMIN", adminUser.getIsAdmin());
		rs.updateTimestamp("LOGON_TIME", adminUser.getLoginTime()==null?null:new Timestamp(adminUser.getLoginTime().getTime()));
		rs.updateTimestamp("LOGOUT_TIME", adminUser.getLogoutTime()==null?null:new Timestamp(adminUser.getLogoutTime().getTime()));
		rs.updateInt("TRIED_TIMES", adminUser.getTriedTimes());
		
	}
	
}
