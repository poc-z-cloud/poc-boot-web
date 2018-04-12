<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="greateq.web.console.util.*"%>
<%@ page import="greateq.web.console.dao.AdminUserDAO"%>
<%@ page import="greateq.web.console.dao.AdminRoleDAO"%>
<%@ page import="greateq.web.console.domain.AdminUser"%>

<%

Connection cn=ConnPool.getInstance().getConnection();
AdminUserDAO dao= new AdminUserDAO(cn);
AdminRoleDAO roleDao= new AdminRoleDAO(cn);

String sMsg="";
int iNext=0;
String sAction="",ID="";


ID=GenAPI.x_toString(request.getParameter("ID"),"0");
Long id= Long.parseLong(ID);
sMsg=GenAPI.x_toString(request.getParameter("sMsg"),"");
sAction=GenAPI.x_toString(request.getParameter("sAction"),"");

Long[] grantedRoleIds=GenAPI.string2Long(request.getParameterValues("lstSeleted"));

AdminUser user= new AdminUser();

iNext=1;
if (id>0)
{
  if (sAction.equals("EDIT"))
  {
	user=dao.selectById(id);
  }
  if (sAction.equals("UPDATE"))
  {
	user=dao.selectById(id);
	form2Entity(request, user);

	if (dao.hasName(user.getName(),id))
	    {
	      sMsg="Duplicate Name!";
	      iNext=1;
	    }else if (dao.update(user))
    {
	    	dao.grantRoles(user.getId(), grantedRoleIds);
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
		form2Entity(request, user);

    if (dao.hasName(user.getName(),id))
    {
      sMsg="Duplicate Name!";
      iNext=1;
    }
    else
    {
    	
      if(dao.save(user))
      {
    	dao.grantRoles(user.getId(), grantedRoleIds);
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
		alert("User name cannot be empty！");
		return false;
	}
	
	if ((document.frmAction.password.value!='*****') && document.frmAction.password.value!=document.frmAction.passwordConfirmation.value)
	{
		alert("Passwords don't match!");
		return false;
	}

	var obj=document.frmAction.lstSeleted;
	
	for (var i=0; i<obj.options.length; i++) {
	    obj.options[i].selected = true;
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
	<TH class="wpsPortletTitle" width="100%">User Management</TH>
	</TR>

	<TBODY ID="wasUniPortlet">
	<TR>   
	  <TD CLASS="wpsPortletArea" COLSPAN="3" >
        <h1 id="title-bread-crumb"><a href='list.jsp'>User Management</a> > <%=user.getName() %></h1>
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
								        <TD class="table-text"  scope="row" valign="top"width="80%" ><INPUT id="name" name="name" size="60"  value="<%=user.getName()%>" class="textEntryRequired" ></TD>
								   	</TR>
								    <TR>
								        <td class="table-text"  scope="row" valign="top"width="20%" >FullName:</TD>
								        <TD class="table-text"  scope="row" valign="top"width="80%" ><INPUT id="fullName" name="fullName" size="60" value="<%=user.getFullName()%>" class="textEntry"></TD>
								   </TR>
								    <TR>
								        <td class="table-text"  scope="row" valign="top"width="20%" >Password:</TD>
								        <TD class="table-text"  scope="row" valign="top"width="80%" ><INPUT type="password" name="password" size="60" value="*****" class="textEntry"></TD>
								   </TR>
								    <TR>
								        <td class="table-text"  scope="row" valign="top"width="20%" >Password Confirmation:</TD>
								        <TD class="table-text"  scope="row" valign="top"width="80%" ><INPUT  type="password" id="passwordConfirmation" name="passwordConfirmation" size="60" value="" class="textEntry"></TD>
								   </TR>
								    <TR>
								        <td class="table-text"  scope="row" valign="top"width="20%" >User Type:</TD>
								        <TD class="table-text"  scope="row" valign="top"width="80%" ><INPUT id="userType" name="userType" size="60" value="<%=user.getUserType()%>" class="textEntry"></TD>
								   </TR>
								   <TR>
								        <TD class="table-text"  scope="row" valign="top" width=20% >Disabled</TD>
								        <TD class="table-text"  scope="row" valign="top" width=80% ><%=GenAPI.getCheckHtml("forbidden","1","Disabled",user.getForbidden()?1:0)%></TD>
								   </TR>
								    <TR>
								        <TD class="table-text"  scope="row" valign="top" width=20% >Locked</TD>
								        <TD class="table-text"  scope="row" valign="top" width=80% ><%=GenAPI.getCheckHtml("locked","1","Locked",user.getLocked()?1:0)%></TD>
								   </TR>
								   
								    <TR>
								        <TD class="table-text"  scope="row" valign="top" colspan=2 ><HR></TD>
								   </TR>
								    <TR>
								        <TD class="table-text"  scope="row" valign="top" width=20% >Roles:</TD>
								        <TD class="table-text"  scope="row" valign="top" width=80% >
											<table border="0" width="100%">
												<tr>
													<td width="40%">Granted:</td>
													<td width="20%">　</td>
													<td width="40%">Available:</td>
												</tr>
												<tr>
													<td width="40%">
								      					<SELECT id="lstSeleted" name="lstSeleted" multiple="multiple" size=10 style="height: 141; width: 150"   LANGUAGE=javascript  ondblclick="return lstSeleted_ondblclick()" >
														<%=GenAPI.getOptionsHtml(roleDao.getGrantedRoleListByUserId(id),"")%>
														</SELECT>
													</td>
													<td width="20%">
								      					<P align="center"><INPUT id=btnGrant name=btnGrant style="WIDTH: 80px" type=button value="&lt;"  LANGUAGE=javascript onclick="return btnGrant_onclick()"></P>
								      					<P align="center"><INPUT id=btnGrantAll name=btnGrantAll style="WIDTH: 80px" type=button value="&lt;&lt;"  LANGUAGE=javascript onclick="return btnGrantAll_onclick()"></P>
								      					<P align="center"><INPUT  id=btnRevoke name=btnRevoke style="WIDTH: 80px" type=button value="&gt;"  LANGUAGE=javascript onclick="return btnRevoke_onclick()"></P>
								      					<P align="center"><INPUT  id=btnRevokeAll name=btnRevokeAll style="WIDTH: 80px" type=button value="&gt;&gt;"  LANGUAGE=javascript onclick="return btnRevokeAll_onclick()"></P>
									   				</td>
													<td width="40%">
										  				<SELECT id="lstUnSeleted" name="lstUnSeleted" multiple="multiple" size=10 style="height: 141; width: 150"   LANGUAGE=javascript ondblclick="return lstUnSeleted_ondblclick()">
														<%=GenAPI.getOptionsHtml(roleDao.getAvailableRoleListByUserId(id),"")%>
											            </SELECT>
													</td>
												</tr>
											</table>
								        </TD>
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
<%!
private void form2Entity(HttpServletRequest request, AdminUser user){
	user.setName(GenAPI.x_toString(request.getParameter("name"),""));
	user.setFullName(GenAPI.x_toString(request.getParameter("fullName"),""));
	user.setUserType(GenAPI.x_toString(request.getParameter("userType"),""));
	String pwd=GenAPI.x_toString(request.getParameter("password"),"");
	if(!pwd.equals("*****")){
	 user.setPassword(GenAPI.hashPassword(pwd));  
	}
	  
	user.setForbidden(Integer.parseInt(GenAPI.x_toString(request.getParameter("forbidden"),"0"))!=0);
	user.setLocked(Integer.parseInt(GenAPI.x_toString(request.getParameter("locked"),"0"))!=0);
	
}
%>