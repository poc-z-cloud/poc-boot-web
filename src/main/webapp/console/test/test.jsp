<%@ page import="java.sql.*"%>
<%@ page import="com.genweb.util.*"%>
<%
Connection cn=DBAPI.getCnByDriver();
Statement stmt=null;
ResultSet rs=null;


try{
    stmt=cn.createStatement();
    rs=stmt.executeQuery("select name from weblogic_test");
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