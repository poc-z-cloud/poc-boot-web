<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="greateq.web.console.util.*"%>
<%@ page import="greateq.web.console.dao.AdminRoleDAO"%>
<%@ page import="greateq.web.console.domain.AdminRole"%>

<%

Connection cn=ConnPool.getInstance().getConnection();
AdminRoleDAO dao= new AdminRoleDAO(cn);

String sMsg="";
int iNext=0;
String sAction="",ID="";

ID=GenAPI.x_toString(request.getParameter("ID"),"0");
Long id= Long.parseLong(ID);
sMsg=GenAPI.x_toString(request.getParameter("sMsg"),"");
sAction=GenAPI.x_toString(request.getParameter("sAction"),"");

AdminRole role= new AdminRole();

iNext=1;
if (id>0)
{
  if (sAction.equals("EDIT"))
  {
	role=dao.selectById(id);
  }
  if (sAction.equals("UPDATE"))
  {
	role=dao.selectById(id);
	  role.setName(GenAPI.x_toString(request.getParameter("name"),""));
	  role.setDescription(GenAPI.x_toString(request.getParameter("description"),""));

	  if (dao.update(role))
    {
      iNext=2;
    }
    else
    {
      sMsg="Update Error！";
      iNext=1;
    }
  }
}
else
{
  if (sAction.equals("UPDATE"))
  {
	  role.setName(GenAPI.x_toString(request.getParameter("name"),""));
	  role.setDescription(GenAPI.x_toString(request.getParameter("description"),""));

    if (dao.hasName(role.getName()))
    {
      ID="";
      sMsg="Duplicate Name!";
      iNext=1;
    }
    else
    {
    	
      if(dao.save(role))
      {
        ID="";
        iNext=2;
        sMsg="add OK!";
      }
      else
      {
        ID="";
        sMsg="Add data error!";
        iNext=1;
      }
    }
  }
}

switch(iNext)
{
  case 2:	//go to list.jsp
    response.sendRedirect("list.jsp");


//	out.println("OK");
		break;
  case 1: //current page.show err message.当前页，显示出错信息
//    out.println("path:"+request.getServletPath());

}
%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="<%=request.getContextPath()%>/console/css/main.css" type="text/css">
<title>Details</title>


<SCRIPT type="text/javascript" LANGUAGE="javascript" src="<%=request.getContextPath()%>/console/js/list_edit.js" >
</SCRIPT>
<script type="text/javascript" LANGUAGE="javascript">
<!--

function CheckInput()
{
	if (document.frmAction.name.value=='')
	{
		alert("Role name cannot be empty！");
		return false;
	}
	return true;
}

function window_onload() {
	if("<%=sMsg%>">"")
		alert("<%=(sMsg)%>")
}




//-->
</script>
</head>
<body LANGUAGE="javascript" onload="return window_onload()">
<div align="center"><strong><font color="midnightblue" size="6">Please Enter Detail
 </font></strong></div>
<p align=center>
<form name=frmAction  action="<%=request.getRequestURI()%>" method=post language=javascript onsubmit="return CheckInput()">
<table border=0 align=center cellPadding=2 cellSpacing=0  width="90%">
    <TR>
        <TD width=20% >Name:</TD>
        <TD width=80% ><INPUT id="name" name="name" value="<%=role.getName()%>"></TD>
   </TR>
    <TR>
        <TD width=20% >Description:</TD>
        <TD width=80% ><INPUT id="description" name="description" value="<%=role.getDescription()%>"></TD>
   </TR>
	<tr>
		<td align="middle" vAlign=center colspan=4>
			<INPUT type="button" id=btnOK name=btnOK value=" OK " LANGUAGE=javascript onclick="return btnOK_onclick()">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT type="button" value="Cancel" id=btnCancel name=btnCancel  LANGUAGE=javascript  onclick="return btnCancel_onclick()">
        </td>
    </tr>
</table>
	<INPUT id=sAction name=sAction type=hidden value="<%=sAction%>">
	<INPUT id=ID name=ID type=hidden value="<%=ID%>">
</p>
</form>

</body>
</html>
<%cn.close();%>