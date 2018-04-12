<%@ page import="java.sql.*"%>

<%!
Connection getCn()
{
    String    drv = "org.h2.Driver";
    String    url = "jdbc:h2:tcp://localhost//core";
    String    uid = "sa";
    String    pwd = "";
    Connection cn=null;
    try
    {
      Class.forName(drv).newInstance();
      cn=DriverManager.getConnection(url,uid,pwd);
    }
    catch (Exception e)
    {
    	e.printStackTrace();
    }
	return cn;
}

Connection getCn(String url)
{
    String    drv = "com.sybase.jdbc2.jdbc.SybDriver";
//    String    url = "jdbc:microsoft:sqlserver://127.0.0.1:1433";
    String    uid = "linkwin";
    String    pwd = "linkwin";

    Connection cn=null;
    try
    {
      Class.forName(drv).newInstance();
      cn=DriverManager.getConnection(url,uid,pwd);
    }
    catch (Exception e)
    {
    	e.printStackTrace();
    }
	return cn;
}

boolean closeCn(Connection cn)
{
  try
  {
	  cn.close();
  }
  catch(Exception e)
  {
  }
  return true;

}
%>
