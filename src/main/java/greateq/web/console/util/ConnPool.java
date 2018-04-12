package greateq.web.console.util;

import java.sql.Connection;
import java.sql.SQLException;

import org.h2.jdbcx.JdbcConnectionPool;

public class ConnPool {
	private static ConnPool instance;
	
	private JdbcConnectionPool cp;
	
	private ConnPool() throws SQLException{
	    String    drv = "org.h2.Driver";
	    String    url = "jdbc:h2:tcp://localhost/core";
	    String    uid = "sa";
	    String    pwd = "";
		
		cp = JdbcConnectionPool.create(url,uid,pwd);
		cp.setLoginTimeout(60);
		cp.setMaxConnections(20);
	}

	public static ConnPool getInstance() throws SQLException
	{
		if (instance==null){
			instance= new ConnPool();
		}
		
		return instance;
	}
	
	public Connection getConnection() throws SQLException{
		
		return cp.getConnection();
	}

	public void dispose(){
		
		 cp.dispose();
	}

}
