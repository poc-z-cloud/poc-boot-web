package greateq.web.console.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import greateq.web.console.domain.Entity;
import greateq.web.console.util.DBAPI;

public abstract class EntityDAO<T extends Entity> {
	protected Connection cn;

	public EntityDAO (Connection cn){
		this.cn=cn;
	}
	
	public List<T> selectAll() throws SQLException{
		return selectAll(false);
	}

	public List<T> selectAll(boolean ordered) throws SQLException{
		List<T> ret = new ArrayList<T>();
		String sql = "select * from " + this.getTableName();
		if (ordered){
			sql+=" order by SORT_ORDER";
		}
		ResultSet rs = DBAPI.executeQuery(cn, sql, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
		
		ret = rs2Entities(rs);
		
		rs.close();
		
		return ret;

	}

	public T selectById(Long id) throws SQLException{
		String sql= "select * from " + this.getTableName() + " where id=" + id;
		ResultSet rs= DBAPI.executeQuery(cn, sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
		
		if (rs.next()){
			T t=rs2Entity(rs);
			rs.close();
			return t;
		}else{
			rs.close();
			return null;
		}
	}

	public List<T> selectByIds(List<Long> idList) throws SQLException{
		return selectByIds(idList,false);
	}

	public List<T> selectByIds(List<Long> idList, boolean ordered) throws SQLException{
		List<T> ret = new ArrayList<T>();
		String ids = "0";

		if (idList != null) {
			for (Long id: idList) {
				ids += "," + id;
			}

		}

		String sql = "select * from " + this.getTableName() + " where id in (" + ids+")";
		if (ordered){
			sql+=" order by SORT_ORDER";
		}
		ResultSet rs = DBAPI.executeQuery(cn, sql, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
		
		ret = rs2Entities(rs);
		
		rs.close();
		
		return ret;

	}

	public T selectByName(String name) throws SQLException{
		String sql= "select * from " + this.getTableName() + " where name='" + name.replace("'", "''") + "'";
		ResultSet rs= DBAPI.executeQuery(cn, sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
		
		if (rs.next()){
			T t=rs2Entity(rs);
			rs.close();
			return t;
		}else{
			rs.close();
			return null;
		}
	}

	public boolean hasName(String name, Long id) throws SQLException{
		T t = this.selectByName(name);
		if (t==null) return false;
		
		return (!t.getId().equals(id));
	}

	public boolean save(T t) throws SQLException{
		String sql= "select * from " + this.getTableName() + " where id=" + t.getId();
		ResultSet rs= DBAPI.executeQuery(cn, sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		
		if (rs.next()){
			rs.close();
			return false;
		}
		
		rs.moveToInsertRow();
		entity2Rs(t,rs);
		
		rs.insertRow();
		rs.moveToCurrentRow();
		rs.close();
		
		sql="select IDENTITY()";
		
		rs= DBAPI.executeQuery(cn, sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
		
		if (rs.next()){
			t.setId(rs.getLong(1));
			rs.close();
		}
		
		
		return true;
	}

	public boolean update(T t) throws SQLException{
		String sql= "select * from " + this.getTableName() + " where id=" + t.getId();
		ResultSet rs= DBAPI.executeQuery(cn, sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		
		if (rs.next()){
			entity2Rs(t,rs);
			
			rs.updateRow();
			rs.moveToCurrentRow();
			rs.close();
			
			return true;
		}else{
			rs.close();
			return false;
			
		}
		
	}

	
	public boolean delete(String[] aID){
		String ids="0";

		if(aID!=null)
		  for(int i=0;i<aID.length;i++)
		  {
			  ids+=","+aID[i];
		  }		
		
		return delete(ids);
	}

	public boolean delete(String ids){
		String sql= "delete " + getTableName() + " where ID in (" + ids + ")";
		return DBAPI.executeUpdate(cn, sql);
	}
	
	public int getTotal(T t) throws SQLException{
		int total = 0;
		String sql= getCountSql(t);
		ResultSet rs= DBAPI.executeQuery(cn, sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
		
		if (rs.next()){
			total=rs.getInt(1);
		}

		rs.close();
		return total;
	}

	public String[][] getList(T t){
		return DBAPI.getList(cn, getListSql(t));
	}
	
	public String[][] getList(T t,int begin, int count){
		return DBAPI.getList(cn, getListSql(t),begin,count);
	}

	public String[][] getList(){
		return DBAPI.getList(cn, getListSql());
	}

	public String[][] getList(int begin, int count){
		return DBAPI.getList(cn, getListSql(),begin,count);
	}
	
	protected abstract String buildWhereCondition(T t);
	protected String getListSql(){
		StringBuilder sb= new StringBuilder("select * from ");
		sb.append(getTableName());
		return sb.toString();
	}
	protected String getListSql(T t){
		StringBuilder sb= new StringBuilder("select * from ");
		sb.append(getTableName());
		sb.append(" where 1>0 ");
		sb.append(buildWhereCondition(t));
		
		return sb.toString();
	}
	protected String getCountSql(T t){
		StringBuilder sb = new StringBuilder("select count(*) from ");
		sb.append(getTableName());
		sb.append(" where 1>0 ");
		sb.append(buildWhereCondition(t));
		
		return sb.toString();
		
	}
	
	protected List<T> rs2Entities(ResultSet rs) throws SQLException{
		List<T> list = new ArrayList<T>();
		while (rs.next()){
			list.add(rs2Entity(rs));
		}
		
		return list;
	}
	
	protected abstract String getTableName();
	protected abstract T rs2Entity(ResultSet rs) throws SQLException;
	protected abstract void entity2Rs(T t, ResultSet rs) throws SQLException;

	
	public Connection getCn() {
		return cn;
	}

	public void setCn(Connection cn) {
		this.cn = cn;
	}
	
}
