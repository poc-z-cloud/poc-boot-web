<%@ page import="java.sql.*"%>
<%@ include file="../common/dblib.jsp"%>
<%
Connection cn=this.getCn();
Statement stmt=null;
ResultSet rs=null;


try{
    stmt=cn.createStatement();
    rs=stmt.executeQuery("select name from admin_role");
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
this.closeCn(cn);
%>