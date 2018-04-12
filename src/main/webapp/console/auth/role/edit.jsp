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

	  if (dao.hasName(role.getName(),id))
	    {
	      sMsg="Duplicate Name!";
	      iNext=1;
	    }else if (dao.update(role))
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

    if (dao.hasName(role.getName(),id))
    {
      sMsg="Duplicate Name!";
      iNext=1;
    }
    else
    {
    	
      if(dao.save(role))
      {
        iNext=2;
        sMsg="add OK!";
      }
      else
      {
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
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<META HTTP-EQUIV="Expires" CONTENT="0">
<TITLE>Detail Page</TITLE> 
<LINK href="<%=request.getContextPath()%>/console/css/adminconsole.css" rel="stylesheet" type="text/css"/>
<SCRIPT type="text/javascript" LANGUAGE="javascript" src="<%=request.getContextPath()%>/console/js/list_edit.js"></SCRIPT>
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
                                  
<body CLASS="content"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="return window_onload()"> 

  <TABLE WIDTH="98%" CELLPADDING="0" CELLSPACING="0" BORDER="0" class="portalPage">
      <TR>
          <TD CLASS="pageTitle">Greateq Console
          </TD>
      </TR>
  </TABLE>

  <TABLE WIDTH="98%" CELLPADDING="0" CELLSPACING="0" BORDER="0" CLASS="wasPortlet">
	<TR>
	<TH class="wpsPortletTitle" width="100%">Role Management</TH>
	</TR>

	<TBODY ID="wasUniPortlet">
	<TR>   
	  <TD CLASS="wpsPortletArea" COLSPAN="3" >
        <h1 id="title-bread-crumb"><a href='list.jsp'>Role Management</a> > <%=role.getName() %></h1>
        <p class="instruction-text">Use this page to edit the Details.</p>
        
		<table border="0" cellpadding="0" cellspacing="0"  width="100%" >
			<tr valign="top"> 
			    <td class="tabs-on" width="1%" nowrap height="12"> Details  </td>
		    	<td class="blank-tab" width="99%" nowrap height="12">
		        	<img src="<%=request.getContextPath()%>/console/images/onepix.gif" width="1" height="10" align="absmiddle" alt="">
		    	</td>
			</tr>
		</table>

		<table border="0" cellpadding="10" cellspacing="0" valign="top" width="100%" summary="Framing Table">
			<tr> 
				<td class="layout-manager">
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="5" cellspacing="10">
					   <TR>
					   	<TD VALIGN="top">
					   		<h2>General Properties</H2>  

							<form name="frmAction"  action="<%=request.getRequestURI()%>" method=post language=javascript onsubmit="return CheckInput()">
								<table class="framing-table" border="0" cellpadding="5" cellspacing="0" width="100%" summary="Properties Table" >
									<tr valign="top">
								        <td class="table-text"  scope="row" valign="top"width="20%" ><span class="requiredField"><img id="requiredImage" src="<%=request.getContextPath()%>/console/images/attend.gif" width="8" height="8" align="absmiddle" alt="Information required">Name:</span></TD>
								        <TD class="table-text"  scope="row" valign="top"width="80%" ><INPUT id="name" name="name" size="60"  value="<%=role.getName()%>" class="textEntryRequired" ></TD>
								   	</TR>
								    <TR>
								        <td class="table-text"  scope="row" valign="top"width="20%" >Description:</TD>
								        <TD class="table-text"  scope="row" valign="top"width="80%" ><INPUT id="description" name="description" size="60" value="<%=role.getDescription()%>" class="textEntry"></TD>
								   </TR>
									<tr>
										<td class="navigation-button-section" nowrap align="middle" vAlign=center colspan=4>
											<INPUT type="button" id=btnOK name=btnOK value=" OK " class="buttons" onclick="return btnOK_onclick()">
											&nbsp;&nbsp;&nbsp;&nbsp;
											<INPUT type="button" value="Cancel" id=btnCancel name=btnCancel  class="buttons" onclick="return btnCancel_onclick()">
								        </td>
								    </tr>
								</table>
								<INPUT id=sAction name=sAction type=hidden value="<%=sAction%>">
								<INPUT id=ID name=ID type=hidden value="<%=ID%>">
							</form>    
      					</TD>
      
					</TR>   
				</TABLE> 

			</td> 
		</tr>
	</table>
 	</td>
 	</tr>
  </TBODY>
</table>
 </body>
 </html>
<%cn.close();%>