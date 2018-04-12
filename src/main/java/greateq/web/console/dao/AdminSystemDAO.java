package greateq.web.console.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import greateq.web.console.domain.AdminRole;
import greateq.web.console.domain.AdminSystem;
import greateq.web.console.util.DBAPI;

public class AdminSystemDAO extends EntityDAO<AdminSystem>{

	public AdminSystemDAO(Connection cn){
		super(cn);
	}

	public List<Long> getSystemIds() throws SQLException{
		List<Long> systemIds= new ArrayList<Long>();
		StringBuilder sb= new StringBuilder("select ID from ADMIN_SYSTEM");
		ResultSet rs = DBAPI.executeQuery(cn, sb.toString());
		while (rs.next()){
			systemIds.add(rs.getLong(1));
		}
		rs.close();

		return systemIds;
	}

	public List<Long> getGrantedSystemIds(Long userId) throws SQLException{
		List<Long> systemIds= new ArrayList<Long>();
		StringBuilder sb= new StringBuilder("select distinct s.ID from ADMIN_SYSTEM s ");
		sb.append(" inner join ADMIN_SYSTEM_ROLE sr on s.ID=sr.SYSTEM_ID ");
		sb.append(" inner join ADMIN_USER_ROLE ur on ur.ROLE_ID=sr.ROLE_ID ");
		sb.append(" where ur.USER_ID=");
		sb.append(userId);

		ResultSet rs = DBAPI.executeQuery(cn, sb.toString());
		while (rs.next()){
			systemIds.add(rs.getLong(1));
		}
		rs.close();

		return systemIds;
	}

	public String[][] getAssignedSystemListByRoleId(Long roleId){
		StringBuilder sb= new StringBuilder("select s.* from ADMIN_SYSTEM s, ADMIN_SYSTEM_ROLE sr where s.ID=sr.SYSTEM_ID and sr.ROLE_ID=");
		sb.append(roleId);
		
		return DBAPI.getList(cn, sb.toString());
	}
	
	public String[][] getAvailableSystemListByRoleId(Long roleId){
		StringBuilder sb= new StringBuilder("select ID,NAME from ADMIN_SYSTEM where ID not in (select SYSTEM_ID from ADMIN_SYSTEM_ROLE where ROLE_ID=");
		sb.append(roleId);
		sb.append(")");
		
		return DBAPI.getList(cn, sb.toString());
	}

	@Override
	protected String getTableName() {
		return "ADMIN_SYSTEM";
	}

	@Override
	protected String buildWhereCondition(AdminSystem adminSystem){
		StringBuilder sb = new StringBuilder();
		if (adminSystem.getName()!=null && !"".equals(adminSystem.getName())){
			sb.append(" and UPPER(NAME) like '%"+adminSystem.getName().toUpperCase().replace("'", "''") + "%'");
		}
		
		if (adminSystem.getDescription()!=null && !"".equals(adminSystem.getDescription())){
			sb.append(" and UPPER(DESCRIPTION) like '%"+adminSystem.getDescription().toUpperCase().replace("'", "''") + "%'");
		}
		return sb.toString();
		
	}

	@Override
	protected AdminSystem rs2Entity(ResultSet rs) throws SQLException {
		AdminSystem adminSystem = new AdminSystem();
		
		adminSystem.setId(rs.getLong("ID"));
		adminSystem.setName(rs.getString("NAME"));
		adminSystem.setDescription(rs.getString("DESCRIPTION"));
		adminSystem.setCategoryId(rs.getLong("CATEGORY_ID"));
		adminSystem.setUrl(rs.getString("URL"));
		adminSystem.setIcon(rs.getString("ICON"));
		adminSystem.setSortOrder(rs.getInt("SORT_ORDER"));
		
		return adminSystem;
	}


	@Override
	protected void entity2Rs(AdminSystem adminSystem, ResultSet rs) throws SQLException {
		rs.updateString("NAME", adminSystem.getName());
		rs.updateString("DESCRIPTION", adminSystem.getDescription());
		rs.updateString("URL", adminSystem.getUrl());
		rs.updateString("ICON", adminSystem.getIcon());
		rs.updateLong("CATEGORY_ID", adminSystem.getCategoryId());
		rs.updateInt("SORT_ORDER", adminSystem.getSortOrder());
	}


	@Override
	protected String getListSql(AdminSystem adminSystem) {
		StringBuilder sb=new StringBuilder("select s.*,c.name as categoryName from ADMIN_SYSTEM s, ADMIN_SYSTEM_CATEGORY c where s.CATEGORY_ID=c.ID ");
		if (adminSystem.getName()!=null && !"".equals(adminSystem.getName())){
			sb.append(" and UPPER(c.NAME) like '%"+adminSystem.getName().toUpperCase().replace("'", "''") + "%'");
		}
		
		if (adminSystem.getDescription()!=null && !"".equals(adminSystem.getDescription())){
			sb.append(" and UPPER(c.DESCRIPTION) like '%"+adminSystem.getDescription().toUpperCase().replace("'", "''") + "%'");
		}
		
		return sb.toString();
	}
	
	
}
