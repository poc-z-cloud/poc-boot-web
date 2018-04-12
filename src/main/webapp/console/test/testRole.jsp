<%@ page import="java.sql.*"%>
<%@ page import="greateq.web.core.util.ConnPool"%>
<%@ page import="greateq.web.core.dao.AdminRoleDAO"%>
<%
Connection cn=ConnPool.getInstance().getConnection();
Statement stmt=null;
ResultSet rs=null;

AdminRoleDAO dao= new AdminRoleDAO(cn);
String[][] aList = dao.getList();
for (int i=0;i<aList.length;i++){
	out.println("<br/>");
	for (int j=0;j<aList[i].length;j++){
		out.println(aList[i][j] + "||");
		
	}
}
cn.close();
%>