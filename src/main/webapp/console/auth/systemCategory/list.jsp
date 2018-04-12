<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="greateq.web.console.util.*"%>
<%@ page import="greateq.web.console.dao.AdminSystemCategoryDAO"%>
<%@ page import="greateq.web.console.domain.AdminSystemCategory"%>

<%
Connection cn=ConnPool.getInstance().getConnection();
AdminSystemCategoryDAO dao= new AdminSystemCategoryDAO(cn);


AdminSystemCategory systemCategory= new AdminSystemCategory();
systemCategory.setName(GenAPI.x_toString(request.getParameter("name"),""));
systemCategory.setDescription(GenAPI.x_toString(request.getParameter("description"),""));

if ("GET".equals(request.getMethod())){
	if (session.getAttribute("systemCategorySearch")!=null){
		systemCategory=(AdminSystemCategory)session.getAttribute("systemCategorySearch");
	}
}

session.setAttribute("systemCategorySearch",systemCategory);


String sMsg="";

boolean bHasList=true;

//Request sAction,sMsgmRoleIDs
String sTemp;
String sAction=GenAPI.x_toString(request.getParameter("sAction"),"");
sMsg=GenAPI.x_toString(request.getParameter("sMsg"),"");
String[] aID=(request.getParameterValues("check"));

if(sAction.equals("DEL")) dao.delete(aID);

String[][] aList=dao.getList(systemCategory);

%>
<html>
<HEAD>
<LINK href="<%=request.getContextPath()%>/console/css/adminconsole.css" rel="stylesheet" type="text/css"/>
 
<SCRIPT type="text/javascript" LANGUAGE="javascript" src="<%=request.getContextPath()%>/console/js/list_edit.js"></SCRIPT>
</HEAD>

<body class="content" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
    		<h1 id="title-bread-crumb">Role list</h1>
 			<p class="instruction-text">Use this page to show the systemCategory list. You can set filter to shorten the list. </p>

			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" SUMMARY="List layout table">
			<TBODY>
			<TR>
				<TD CLASS="layout-manager" id="notabs">
 				<form action="<%=request.getRequestURI()%>" method=post name="frmAction" id="frmAction">

        			<table border="0" cellpadding="3" cellspacing="0" valign="top" width="100%" summary="Framing Table" CLASS="button-section">
        				<tr valign="top">
        					<td class="table-button-section"  nowrap> 
							    <table style="display: inline; font-size: 95%;" cellspacing="0" cellpadding="0" border="0">
    								<tr>
        								<td>
									        <A id="selectAllButton" HREF="javascript:selectAll()" tabindex="1" CLASS="expand-task">
									            <IMG id="selectAllImg" align="top" SRC="<%=request.getContextPath()%>/console/images/wtable_select_all.gif" ALT='Select All' BORDER="0" ALIGN="texttop"> 
									        </A>
									        </td>
									        <td>
									        <A id="deselectAllButton" HREF="javascript:selectNone()" tabindex="1" CLASS="expand-task">
									            <IMG id="deselectAllImg" align="top" SRC="<%=request.getContextPath()%>/console/images/wtable_deselect_all.gif" ALT='Deselect All' BORDER="0" ALIGN="texttop"> 
									        </A>  
									        </td>
									        
											<td>
									        <A HREF="javascript:showHideFilter()" tabindex="1" CLASS="expand-task">
									            <IMG id="filterTableImg" align="top" SRC="<%=request.getContextPath()%>/console/images/wtable_filter_row_show.gif" ALT='Show filter function' BORDER="0" ALIGN="texttop"> 
									        </A>
									        </td>
									        <td>
									        <A HREF="javascript:clearFilter('frmAction')" tabindex="1" CLASS="expand-task">
									            <IMG  id="clearFilterImg" align="top" SRC="<%=request.getContextPath()%>/console/images/wtable_clear_filters.gif" ALT='Clear filter value' BORDER="0" ALIGN="texttop"/> 
									        </A>
								        </td>
										<td>
							              <div style="position:relative;"><input type="button" name="button.new" value="New" onclick="return btnAdd_onclick()" class="buttons" id="functions"/> </div>
										</td>
						              	<td>
							              <div style="position:relative;"><input type="button" name="button.delete" value="Delete" onclick="return btnDel_onclick()" class="buttons" id="functions"/> </div>
								        </td>
							    	</tr>
							    </table>    
					        </td>
				        </tr>
			        </table>


					<TABLE BORDER="0" CELLPADDING="3" CELLSPACING="1" WIDTH="100%" SUMMARY="List table" CLASS="framing-table">
						<TR  ID="filterControls" STYLE="display:none" width="100%">
					    	<TD CLASS="column-filter-expanded" COLSPAN=7>
					           <BR>To filter the following table, enter filter criteria.
					           <table width="10%" border="0">
								 <TR valign="top">
								     <td NOWRAP CLASS="column-filter-expanded"  scope="row" valign="top"width="20%" >Name:</TD>
								     <TD NOWRAP CLASS="column-filter-expanded"  scope="row" valign="top"width="80%" ><INPUT id="filterItem" name="name" size="60"  value="<%=systemCategory.getName()%>" class="textEntryRequired" ></TD>
								   </TR>
								    <TR>
								        <td NOWRAP CLASS="column-filter-expanded"  scope="row" valign="top"width="20%" >Description:</TD>
								        <TD NOWRAP CLASS="column-filter-expanded"  scope="row" valign="top"width="80%" ><INPUT id="filterItem" name="description" size="60" value="<%=systemCategory.getDescription()%>" class="textEntry"></TD>
								   </TR>
					           
						           <tr>
							           <td NOWRAP CLASS="column-filter-expanded" align="left" valign="top"></td>
							           <td NOWRAP CLASS="column-filter-expanded" align="left" valign="top">
							           	<INPUT TYPE="submit" NAME="searchAction" ID="searchAction" VALUE="Go" CLASS="buttons-filter">
							           </td>
						           </tr>
					           </table>
				           </TD> 
			           </TR>
					</TABLE>
 
					<TABLE BORDER="0" CELLPADDING="3" CELLSPACING="1" WIDTH="100%" SUMMARY="List table" CLASS="framing-table">
					    <THEAD>
					        <TH NOWRAP VALIGN="TOP" CLASS="column-head-name" SCOPE="col" id="selectCell" NOWRAP WIDTH="1%"><B>Order</B></TH>
					        <TH NOWRAP VALIGN="TOP" CLASS="column-head-name" SCOPE="col" id="selectCell" NOWRAP WIDTH="24%"><B>Role Name</B></TH>
					        <TH NOWRAP VALIGN="TOP" CLASS="column-head-name" SCOPE="col" id="selectCell" NOWRAP WIDTH="25%"><B>Description</B></TH>
					        <TH NOWRAP VALIGN="TOP" CLASS="column-head-name" SCOPE="col" id="selectCell" NOWRAP WIDTH="25%"><B>Sort Order</B></TH>
					        <TH NOWRAP VALIGN="TOP" CLASS="column-head-name" SCOPE="col" id="selectCell" NOWRAP WIDTH="25%"><B>Systems</B></TH>
					    
					    </THEAD>
					<%
					if(bHasList)
					{
						for(int i=0;i<aList.length;i++)
						{
					%>
					    <TR CLASS="table-row">
						    <TD VALIGN="top"  NOWRAPclass="collection-table-text"><input type=checkbox class="check" name=check value="<%=aList[i][0]%>" ><%=i+1%></TD>
						    <TD VALIGN="top"  class="collection-table-text">&nbsp;<a href="javascript:Edit(<%=aList[i][0]%>)"><%=aList[i][1]%></a></TD>
						    <TD VALIGN="top"  class="collection-table-text">&nbsp;<%=aList[i][2]%></TD>
						    <TD VALIGN="top"  class="collection-table-text">&nbsp;<%=aList[i][3]%></TD>
						    <TD VALIGN="top"  class="collection-table-text">&nbsp;<a href="javascript:RefSystems(<%=aList[i][0]%>)">Systems</a></TD>
					    </TR>
					 <%}%>
					<%}%>
					 </TABLE>
						<input type=hidden id=sAction name=sAction value="<%=sAction%>">
					<TABLE class="paging-table" BORDER="0" CELLPADDING="5" CELLSPACING="0" WIDTH="100%" SUMMARY="Table for displaying paging function">
						<TR>
					       <TD CLASS="table-totals" VALIGN="baseline">               
					            Total <%= aList.length%>
					             &nbsp;&nbsp;&nbsp;               
							</TD>
						</TR>
					</TABLE>
				</form>
                  </TD>
               </TR>
	        </TBODY>
		</TABLE>
	  </td>
 	</tr>
  </TBODY>
 </table>
</body>
</html>
<%cn.close();%>
