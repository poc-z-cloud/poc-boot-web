<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="greateq.web.console.util.*"%>
<%@ page import="greateq.web.console.dao.AdminRoleDAO"%>

<%
Connection cn=ConnPool.getInstance().getConnection();
AdminRoleDAO dao= new AdminRoleDAO(cn);

String sMsg="";

boolean bHasList=true;

//Request sAction,sMsgmRoleIDs
String sTemp;
String sAction=GenAPI.x_toString(request.getParameter("sAction"),"");
sMsg=GenAPI.x_toString(request.getParameter("sMsg"),"");
String[] aID=(request.getParameterValues("check"));

//handle sWhere,
String sWhere=GenAPI.x_toString(request.getParameter("sWhere"),"");
if(sWhere.equals(""))
{
  sTemp=GenAPI.x_toString(session.getAttribute("adminWhere"),"");
  sWhere=sTemp.equals("")?" 1>0 ":sTemp;
}
session.setAttribute("adminWhere",sWhere);

String sPageSize=GenAPI.x_toString(request.getParameter("sPageSize"),"");
if(sPageSize.equals(""))
{
  sTemp=GenAPI.x_toString(session.getAttribute("adminPageSize"),"");
  sPageSize=sTemp.equals("")?"100":sTemp;
}
session.setAttribute("adminPageSize",sPageSize);



String sCurrentPage=GenAPI.x_toString(request.getParameter("sCurrentPage"),"");
if(sCurrentPage.equals(""))
{
  sTemp=GenAPI.x_toString(session.getAttribute("adminCurrentPage"),"");
  sCurrentPage=(sTemp.equals(""))?"1":sTemp;
}
session.setAttribute("adminCurrentPage",sCurrentPage);

if(sAction.equals("DEL")) dao.delete(aID);

String[][] aList=dao.getList();

%>
<HTML>
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="<%=request.getContextPath()%>/console/css/main.css" type="text/css">

<SCRIPT type="text/javascript" LANGUAGE="javascript" src="<%=request.getContextPath()%>/console/js/list_edit.js">

</SCRIPT>
</HEAD>
<BODY>

<div align="center"><strong><font color="midnightblue" size="5">Role Management</font></strong></div>

<form action="<%=request.getRequestURI()%>" method=post name=frmAction>

<div align=right >
<TABLE border=0 cellPadding=1 cellSpacing=1 width=95% class=listtable>
    <THEAD>
        <TH align=center width=50><B>Order</B></TH>
        <TH align=center width=250><B>Role Name</B></TH>
        <TH align=center width=350><B>Users</B></TH>
        <TH align=center width=350><B>Permissions</B></TH>
    </THEAD>
<%
if(bHasList)
{
	for(int i=0;i<aList.length;i++)
	{
%>
    <TR >
        <TD width=50><input type=checkbox class="check" name=check value="<%=aList[i][0]%>" ><%=i+1%></TD>
        <TD width=250>&nbsp;<a href="javascript:Edit(<%=aList[i][0]%>)"><%=aList[i][1]%></a></TD>
        <TD width=250>&nbsp;<a href="javascript:RefUsers(<%=aList[i][0]%>)">Users</a></TD>
        <TD width=350>&nbsp;<a href="javascript:RefSystems(<%=aList[i][0]%>)">Permissions</a></TD>
    </TR>
 <%}%>
<%}%>
 </TABLE>
</div>
<input type=hidden id=sAction name=sAction value="<%=sAction%>">
<input type=hidden id=sWhere name=sWhere value="<%=sWhere%>">
<input type=hidden id=sCurrentPage name=sCurrentPage value="<%=sCurrentPage%>">
<div align=center>
<INPUT id=btnAdd classname=button1 name=btnAdd type=button value="Add" LANGUAGE=javascript onclick="return btnAdd_onclick()">
<INPUT id=btnDel name=btnDel type=button value="Delete" LANGUAGE=javascript onclick="return btnDel_onclick()">
<INPUT id=btnSelectAll name=btnSelectAll type=button value="All" LANGUAGE=javascript onclick="return btnSelectAll_onclick()">

</div>
</form>
</BODY>
</HTML>
<%cn.close();%>