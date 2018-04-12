<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="greateq.web.console.util.*"%>
<%@ page import="greateq.web.console.domain.AdminLogin"%>
<%@ page import="greateq.web.console.service.AuthenticationService"%>

<%
session.setMaxInactiveInterval(-1);

%>
<%
Connection cn=ConnPool.getInstance().getConnection();

String sAction=GenAPI.x_toString(request.getParameter("sAction"),"");
String sMsg=GenAPI.x_toString(request.getParameter("sMsg"),"");
String userName=GenAPI.x_toString(request.getParameter("userName"),"");
String password=GenAPI.x_toString(request.getParameter("password"),"");

if(sAction.equalsIgnoreCase("LOGON"))
{
	
	try
	{
		AuthenticationService service = new AuthenticationService(cn);
		AdminLogin adminLogin = service.signIn(userName,password);
	    session.setAttribute("adminLogin",adminLogin);
	    response.sendRedirect("main.jsp");
	}
	catch(Exception ex)
	{
	    request.getSession(true);
	    sAction="";
		sMsg= ex.getMessage();
	}
}

%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en_US">
<head>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
  <META HTTP-EQUIV="Expires" CONTENT="0">
	<title>
		Greateq Solutions Console
	</title>		


  <link href='css/Styles.css' rel="styleSheet" type="text/css">

<script language="JavaScript">
function CheckInput()
{
	document.frmAction.sAction.value="LOGON";
	return true;
}

function window_onload() {
	  if("<%=sMsg%>">"")
	  {
	    alert("<%=sMsg%>")
	  }
	  document.frmAction.userName.focus();
	}
</script>

</head>

<body style="direction:ltr" onload="return window_onload()">

<div dir="ltr">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="wpsBannerEnclosure" dir="ltr">

  <tr>
    <td height="35" bgcolor="#F5F5F5" align="left">
    	<img alt='Greateq Solutions Console' title='Integrated Solutions Console' src='images/iscbannerLeft-.gif'/>
    </td>
    <td align="center" bgcolor="#F5F5F5">
    	
    </td>
    <td height="35" align="right"  bgcolor="#F5F5F5">
    	<img alt='IBM' title='IBM' src='images/iscbanner-mosaic.gif'/>
    </td>
  </tr>
</table>
    
  	<form name="frmAction" "<%=request.getRequestURI()%>" method=post align=center onsubmit="return CheckInput()" style="padding: 0px; margin: 0px;">
    <table bgcolor="#E8E8E8" border=0 cellpadding=5 cellspacing=0 width="100%" height="100%" dir="ltr">
      <tr>
        <td align="left" VALIGN="top" WIDTH="100%"> 
            
            <table border=0 cellpadding=0 cellspacing=0 dir="ltr">
              <tr> 
                <TD align="left" class="wpsLoginHeadText" noWrap>
                
                Log in to the console.

                </TD>
              </tr>
              <tr> 
                <td align="left" valign=top width="33%" class="wpsLoginText" nowrap > 
                  <label for="userName">User ID:</label>
                  </td>
                  </tr>
                  <tr>
                  <td align="left">
                  <input dir="ltr" TYPE="text" class="noIndentTextEntry" name="userName" id="userName"/>  
                </td>
              </tr>
              <tr > 
                <td align="left" valign=top width="33%" class="wpsLoginText" nowrap > 
                  <label for="password" >Password:</label>
                  </td>
                  </tr>
                  <tr>
                  <td align="left">
                  <input dir="ltr" TYPE="password" class="noIndentTextEntry" name="password" id="password"/>  
                </td>
              </tr>
              
              <tr> 
                <td align="left" valign=top class="wpsLoginText" nowrap > 
                  <input TYPE="submit" name="action" class="buttons" id="other" alt='Log in' VALUE="Log in"/>
                 
                </td>
              </tr>
            </table>
         </td>
         <td VALIGN="top">
        	<img src='images/Login.gif' title='Login image' alt='Login image '>
     	 </td>
       </tr>
    </table>

	<input type=hidden name=sAction value="<%=sAction%>">
   
    </form>

<NOSCRIPT>Note: There are many convenience functions that will not be available with scripting disabled.  Enable Java Script in your browser to take advantage of these functions.</NOSCRIPT>

<script language="JavaScript" type="text/javascript">
  <!--
	if(self!=top){
		top.location = self.location;
	}
    document.frmAction.userName.focus()
  // -->
</script>
</div>

</body>
</html>
<%cn.close();%>