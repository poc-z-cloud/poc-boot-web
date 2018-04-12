package greateq.web.console.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import greateq.web.console.domain.AdminSystemCategory;

public class AdminSystemCategoryDAO extends EntityDAO<AdminSystemCategory>{

	public AdminSystemCategoryDAO(Connection cn){
		super(cn);
	}

	@Override
	protected String getTableName() {
		return "ADMIN_SYSTEM_CATEGORY";
	}

	@Override
	protected String buildWhereCondition(AdminSystemCategory adminSystemCategory){
		StringBuilder sb = new StringBuilder();
		if (adminSystemCategory.getName()!=null && !"".equals(adminSystemCategory.getName())){
			sb.append(" and UPPER(NAME) like '%"+adminSystemCategory.getName().toUpperCase().replace("'", "''") + "%'");
		}
		
		if (adminSystemCategory.getDescription()!=null && !"".equals(adminSystemCategory.getDescription())){
			sb.append(" and UPPER(DESCRIPTION) like '%"+adminSystemCategory.getDescription().toUpperCase().replace("'", "''") + "%'");
		}

		return sb.toString();
		
	}


	@Override
	protected AdminSystemCategory rs2Entity(ResultSet rs) throws SQLException {
		AdminSystemCategory adminSystemCategory = new AdminSystemCategory();
		
		adminSystemCategory.setId(rs.getLong("ID"));
		adminSystemCategory.setName(rs.getString("NAME"));
		adminSystemCategory.setDescription(rs.getString("DESCRIPTION"));
		adminSystemCategory.setSortOrder(rs.getInt("SORT_ORDER"));
		
		return adminSystemCategory;
	}


	@Override
	protected void entity2Rs(AdminSystemCategory adminSystemCategory, ResultSet rs) throws SQLException {
		rs.updateString("NAME", adminSystemCategory.getName());
		rs.updateString("DESCRIPTION", adminSystemCategory.getDescription());
		rs.updateInt("SORT_ORDER", adminSystemCategory.getSortOrder());
		
	}
	
	
}
