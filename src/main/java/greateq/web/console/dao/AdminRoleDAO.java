package greateq.web.console.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import greateq.web.console.domain.AdminRole;
import greateq.web.console.util.DBAPI;

public class AdminRoleDAO extends EntityDAO<AdminRole>{

	public AdminRoleDAO(Connection cn){
		super(cn);
	}

	public List<AdminRole> getGrantedRolesByUserId(Long userId) throws SQLException{
		StringBuilder sb= new StringBuilder("select r.* from ADMIN_ROLE r, ADMIN_USER_ROLE ur where r.ID=ur.ROLE_ID and ur.USER_ID=");
		sb.append(userId);
		ResultSet rs = DBAPI.executeQuery(cn, sb.toString());
		List<AdminRole> roles=this.rs2Entities(rs);
		rs.close();

		return roles;
	}
	
	public String[][] getGrantedRoleListByUserId(Long userId){
		StringBuilder sb= new StringBuilder("select r.* from ADMIN_ROLE r, ADMIN_USER_ROLE ur where r.ID=ur.ROLE_ID and ur.USER_ID=");
		sb.append(userId);
		return DBAPI.getList(cn, sb.toString());
	}
	
	public String[][] getAvailableRoleListByUserId(Long userId){
		StringBuilder sb= new StringBuilder("select * from ADMIN_ROLE where ID not in (select ROLE_ID from ADMIN_USER_ROLE where USER_ID=");
		sb.append(userId);
		sb.append(")");
		
		return DBAPI.getList(cn, sb.toString());
	}
	
	public void assignUsers(Long roleId,Long[] userIds){
		String sql="delete ADMIN_USER_ROLE where ROLE_ID=" + roleId;
		DBAPI.executeUpdate(cn, sql);
		if (userIds!=null){
			for (int i=0;i<userIds.length;i++){
				sql="insert into ADMIN_USER_ROLE(ROLE_ID,USER_ID) values (" + roleId+","+userIds[i]+")";
				DBAPI.executeUpdate(cn, sql);
			}
				
		}
	}
	
	public void assignSystems(Long roleId,Long[] systemIds){
		String sql="delete ADMIN_SYSTEM_ROLE where ROLE_ID=" + roleId;
		DBAPI.executeUpdate(cn, sql);
		if (systemIds!=null){
			for (int i=0;i<systemIds.length;i++){
				sql="insert into ADMIN_SYSTEM_ROLE(ROLE_ID,SYSTEM_ID) values (" + roleId+","+systemIds[i]+")";
				DBAPI.executeUpdate(cn, sql);
			}
				
		}
	}

	@Override
	protected String getTableName() {
		return "ADMIN_ROLE";
	}


	protected String buildWhereCondition(AdminRole adminRole){
		StringBuilder sb = new StringBuilder();
		if (adminRole.getName()!=null && !"".equals(adminRole.getName())){
			sb.append(" and UPPER(NAME) like '%"+adminRole.getName().toUpperCase().replace("'", "''") + "%'");
		}
		
		if (adminRole.getDescription()!=null && !"".equals(adminRole.getDescription())){
			sb.append(" and UPPER(DESCRIPTION) like '%"+adminRole.getDescription().toUpperCase().replace("'", "''") + "%'");
		}

		return sb.toString();
		
	}

	protected List<AdminRole> rs2Entities(ResultSet rs) throws SQLException {
		List<AdminRole> roles = new ArrayList<AdminRole>();
		while(rs.next()){
			AdminRole adminRole = new AdminRole();
			
			adminRole.setId(rs.getLong("ID"));
			adminRole.setName(rs.getString("NAME"));
			adminRole.setDescription(rs.getString("DESCRIPTION"));
			adminRole.setSortOrder(rs.getInt("SORT_ORDER"));
			
			roles.add(adminRole);
		}
		
		return roles;
	}

	@Override
	protected AdminRole rs2Entity(ResultSet rs) throws SQLException {
		AdminRole adminRole = new AdminRole();
		
		adminRole.setId(rs.getLong("ID"));
		adminRole.setName(rs.getString("NAME"));
		adminRole.setDescription(rs.getString("DESCRIPTION"));
		adminRole.setSortOrder(rs.getInt("SORT_ORDER"));
		
		return adminRole;
	}


	@Override
	protected void entity2Rs(AdminRole adminRole, ResultSet rs) throws SQLException {
		rs.updateString("NAME", adminRole.getName());
		rs.updateString("DESCRIPTION", adminRole.getDescription());
		rs.updateInt("SORT_ORDER", adminRole.getSortOrder());
		
	}
	
}
