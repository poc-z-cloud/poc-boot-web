<%@ page import="java.sql.*"%>
<%@ page import="greateq.web.core.util.ConnPool"%>
<%
Connection cn=ConnPool.getInstance().getConnection();
Statement stmt=null;
ResultSet rs=null;


try{
    stmt=cn.createStatement();
    rs=stmt.executeQuery("select name from admin_system");
    while (rs.next())
    {
        out.println(rs.getString(1));
    }
    //rs.moveToInsertRow();
    //rs.updateString("name","jdbc2.0");
    //rs.insertRow();
    }catch (Exception e)
    {
        out.println(e.toString());
    }
	cn.close();
%>