<html lang="en">
<HEAD>
<LINK href="css/adminconsole.css" rel="stylesheet" type="text/css"/>

<style type="text/css">




.wpsPortletArea {
        border-left: #CCCCCC 1px solid; 
        border-right: #CCCCCC 1px solid; 
        border-bottom: #CCCCCC 1px solid; 
        BACKGROUND-COLOR: #FFFFFF;
        padding: 0.75em;
}


</style>

<!-- UL element style for unordered list inside a table cell -->
<style type="text/css">
ul.ul-table-text {
color:#000000;
font-size:95%;
list-style-position:outside;
list-style-type:disc;
}
</style>



<script LANGUAGE="JavaScript">
var pleaseWait = "Please Wait...";

var statusStarted = "Started";
var statusStopped = "Stopped";
var statusUnavailable = "Unknown";
var statusUnknown = "Unknown";
var statusPartialStart = "Partial Start";
var statusPartialStop = "Partial Stop";
var statusSynchronized = "Synchronized";
var statusNotSynchronized = "Not synchronized";


if (statusStarted == "null") { statusStarted = "Started" }
if (statusStopped == "null") { statusStopped = "Stopped" }
if (statusUnavailable == "null") { statusUnavailable = "Unknown" }
if (statusUnknown == "null") { statusUnknown = "Unknown" }
if (statusPartialStart == "null") { statusPartialStart = "Partial Start" }
if (statusPartialStop == "null") { statusPartialStop = "Partial Stop" }
if (statusSynchronized == "null") { statusSynchronized = "Synchronized" }
if (statusNotSynchronized == "null") { statusStarted = "Not Synchronized" }
statusArray = new Array(statusStarted,statusStopped,statusUnavailable,statusUnknown,statusPartialStart,statusPartialStop,statusSynchronized,statusNotSynchronized);
var statusIconStarted = 'images/running.gif';        
var statusIconStopped = 'images/stop.gif';
var statusIconUnavailable = 'images/unknown.gif';
var statusIconUnknown = 'images/unknown.gif';
var statusIconPartialStart = 'images/part_start.gif';
var statusIconPartialStop = 'images/part_stop.gif';
var statusIconSynchronized = 'images/synch.gif';
var statusIconNotSynchronized = 'images/not_synch.gif';                
statusIconArray = new Array(statusIconStarted,statusIconStopped,statusIconUnavailable,statusIconUnknown,statusIconPartialStart,statusIconPartialStop,statusIconSynchronized,statusIconNotSynchronized);

var moveInListError = "You must select an entry to be moved.";
var noInfoAvailable = "For field help information, select a field label or list marker when the help cursor is displayed.";

var lookInPageHelp = "";

var selectText = "Select";

var helpImage = "images/title_help.gif";
var minimizeImage = "images/title_minimize.gif";
var maximizeImage = "images/title_maximize.gif";
//F04026-42139                      
var csrfURLParameter = "&csrfid=122642578&";


function verifySessionName() {
	var c = document.cookie;
	var cb = c.indexOf("; sessionCode=");
	if (cb > -1) {
		cb = cb + 2;
		var ce = c.indexOf(";", cb);
		if (ce == -1)
			ce = c.length;
        try{
        var curSessionCode = c.substring(cb + 12, ce);
		var prevSessionCode = parent.parent.header.sessionCode;
		if (curSessionCode != null && prevSessionCode != null && curSessionCode != prevSessionCode) {
			top.location.href="/ibm/console/unsecure/invalidSession.jsp";
		}
        }catch (e) {
                  // do nothing - needed for secondary windows.
        }
	}	
}
verifySessionName();
</script>



 
<script language="JavaScript" src="scripts/menu_functions.js"></script>


</HEAD>


<body class="content" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">










<div class="accessibility-jumps-top">
    Accessibility anchor links, skip to the following content sections:  
    <a href="#title">title</a>,
    <a href="#main">main</a>,
    <a href="#important">important messages</a>   
</div>
 
<a name="title"></a>











   


  <TABLE WIDTH="98%" CELLPADDING="0" CELLSPACING="0" BORDER="0" class="portalPage">
      <TR>
          <TD CLASS="pageTitle">Cell=OND4C01212175Node05Cell, Profile=osap64
          </TD>
          <TD CLASS="pageClose"><A HREF="/ibm/console/navigation.do?wpageid=com.ibm.isclite.welcomeportlet.layoutElement.A&moduleRef=com.ibm.isclite.ISCAdminPortlet">Close page</A>
          </TD>
      </TR>
  </TABLE>


  <TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
  <TR>
  
    
  
  <TD valign="top">
  
  <TABLE WIDTH="98%" CELLPADDING="0" CELLSPACING="0" BORDER="0" CLASS="wasPortlet">


    
        
        
    



<TR>
	<TH class="wpsPortletTitle" width="100%">Data sources</TH>
	
		<TH class="wpsPortletTitleControls">
			<a href="/ibm/help/index.jsp?topic=/com.ibm.ws.console.resources/udat_jdbcdatasor.html" tabindex="100" target='WAS_help'><img src="images/title_help.gif" border="0" alt="View more information about this page" align="texttop"></a>
		</TH>
	
	<TH class="wpsPortletTitleControls">
		<A href="javascript:showHidePortlet('wasUniPortlet')">
			<img id="wasUniPortletImg" SRC="images/title_minimize.gif" alt="Expand or collapse" border="0" align="texttop" tabindex="1"/>
		</A> 
	</TH>
	
	
</TR>



  
  <TBODY ID="wasUniPortlet">
    <TR>   
  <TD CLASS="wpsPortletArea" COLSPAN="3" >
    
        <a name="important"></a> 
        
        <h1 id="title-bread-crumb">Data sources</h1>
        


   


   <p class="instruction-text">
       Use this page to edit the settings of a datasource that is associated with your selected JDBC provider. The datasource object supplies your application with connections for accessing the database. Learn more about this task in a <a href="/ibm/console/navigatorCmd.do?forwardName=guidedactivity.resource">guided activity</a>. A guided activity provides a list of task steps and more general information about the topic.
   </p>


        
       




<a name="main"></a>


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" SUMMARY="List layout table">

	<TBODY>
		<TR>
			<TD CLASS="layout-manager" id="notabs">

    
        
    












































<form name="contextScopeForm" method="get" action="/ibm/console/selectscope.do" class="nopad"><input type=hidden name='csrfid' value='vXB8OSiEn5T5V0n7oTJh8DD'/>





<script>
cellScope = "";clusterScope = "";nodeScope = "";serverScope = "";
</script>


<table border="0" cellpadding="2" cellspacing="0" valign="top" width="100%" summary="Framing Table" >
    <tbody>
    <tr valign="top">
        <td class="table-text-white" id="scope" nowrap scope="rowgroup"><a href="javascript:showHideSection('com_ibm_ws_scopeTable')" CLASS="expand-task">
            <img id="com_ibm_ws_scopeTableImg" SRC="images/arrow_expanded.gif" alt="Show search scope" border="0" align="texttop" tabindex="1"/>
          Scope: =<strong>All scopes</strong></A></td>
    </tr>
    </tbody>
</table>


<!-- LIDB3726-15 : scope tile changes to display drop down when list is < 50 -->


           
<table id="com_ibm_ws_scopeTable" style="display:inline" border="0" cellpadding="2" cellspacing="0"  width="100%">
   <tr>
      <td class="complex-property"  nowrap>
         <table border="0" cellpadding="2" cellspacing="0" width="90%">
               
                
            <tr>
               <td class="complex-property"  nowrap>
                  <table border="0" cellpadding="4" cellspacing="4" width="85%">

                     <tr valign="top">
                        <td class="find-filter" valign="top"  ROWSPAN="1"% colspan="2">
                           Scope specifies the level at which the resource definition is visible. For detailed information on what scope is and how it works,
                           <a href="/ibm/help/index.jsp?topic=/com.ibm.ws.console.resources/rcon_scope.html" tabindex="100" target='WAS_help'>see the scope settings help.</a>
                        </td>
                     </tr>
                     
                     <tr valign="top">
                        <td class="find-filter" valign="top" nowrap WIDTH="1%">
					       <label title="Select the scope on which to view resources." for="currentScope">
                              <SELECT ID="currentScope" name="currentScope" ONCHANGE="changeScope(this.form.currentScope)">

                     
                                          <option value="All+Scopes" SELECTED="SELECTED"><strong>All scopes</strong></option>
                                    
                                          <option value="cells%2FOND4C01212175Node05Cell">Cell=<strong>OND4C01212175Node05Cell</strong></option>
                                    
                                          <option value="cells%2FOND4C01212175Node05Cell%2Fnodes%2FOND4C01212175Node05">Node=<strong>OND4C01212175Node05</strong></option>
                                    
                                          <option value="cells%2FOND4C01212175Node05Cell%2Fnodes%2FOND4C01212175Node05%2Fservers%2Fserver1">Node=<strong>OND4C01212175Node05</strong>, Server=<strong>server1</strong></option>
                                     
                
                              </select>
						   </label>
                        </TD>
                     </TR>

                     <NOSCRIPT>
                        <tr>
                           <td valign="top" class="navigation-button-section" colspan="2">
                              <input type="submit" name="applyAction" value="Apply" class="buttons" id="section-button">
                           </td>
                        </tr>
                    </NOSCRIPT>
                
                 </table>
              </td>
           </tr>
               
        </TABLE>

        <SCRIPT>
           function changeScope(object){
              window.location = "/ibm/console/selectscope.do?applyAction=true&currentScope=" +object.options[object.selectedIndex].value + csrfURLParameter;
           } 
        </SCRIPT>
        
      </td>
   </tr>
</table>



</form>

<SCRIPT>
  function changeScopeTile(){
     if(document.getElementById('showAllScopesView').checked){
        window.location = "/ibm/console/selectscope.do?scopeViewChangeAction=true&showAllScopesView=true" + csrfURLParameter;
     } else {
        window.location = "/ibm/console/selectscope.do?scopeViewChangeAction=true&showAllScopesView=false" + csrfURLParameter;
     }
  }            
</SCRIPT>































          








<SCRIPT>
// Added because Mozilla wants to use the TBODY and table-row-group to show/hide table rows
if (isDom) {
    showString = "table-row-group";
} else {
    showString = "inline";
}
function showHideFilter() {
    var filterTableImg = document.getElementById ("filterTableImg");
    
    if (filterTableImg.src.indexOf("wtable_filter_row_show") > 0) {
        disFilter = showString;
        filterTableImg.src = "images/wtable_filter_row_hide.gif";
        filterTableImg.title = "Hide filter function";
    } else {
        filterTableImg.src = "images/wtable_filter_row_show.gif";
        filterTableImg.title = "Show filter function";
        disFilter = "none";
    }

    document.getElementById("filterControls").style.display = disFilter;
}


function clearFilter(theForm) {
    //document.getElementById("searchFilter").value = "";
    elements = document.getElementsByName("searchPattern");
    for(var i = 0; i<elements.length; i++){
    	elements.item(i).value="*";
    }
    elements = document.getElementsByName("unused");
    for(var i = 0; i<elements.length; i++){
    	elements.item(i).value="*";
    }
    //document.getElementById("searchPattern").value = "*";
    //document.getElementById("searchAction").click();
    elForm = document.getElementById(theForm);
    iscDeselectAll(theForm);
    //elForm.submit();
    document.getElementById("searchAction").click();
}

function onenter(e, theForm) {
    var keyCodeChar  
      
	if (e && e.which){
        e = e;
        keyCodeChar = e.which;
    }
    else{
        e = event;
        keyCodeChar = e.keyCode;
    }
    
    if (keyCodeChar == 13){
		document.getElementById("searchAction").click();
        return false;
    }
	else{
		return true;
    }
}


var SELECTEDFilter = "";
var firstCol = "";

firstCol = "name";

SELECTEDFilter = "name";

</SCRIPT>
























































<!-- 510878: Allow preferences and table controls to be hidden -->



<!-- 515386: By default, Admin Security Manager role has monitor access. When Admin Security Manager   -->
<!--         role should act as Administrator, this field needs to be overridden with a value of false -->


<!-- 507024.2: AdditionalRole is used by applications to indicate that the depoloyer role should be used.-->








<!-- gets all the collection items which matches with the contextType and
     compatibilty criteria using plugin registry API -->


   

 
 
 





       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       

       
       
       
              
              
        
       






  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  
       
       
       
              
              
        
       

  



<!-- We only want the preferences layout to get a map based on the items in the collection table, not 
based on the available scopes.  So clone off the contextToRolesMap so that we have a copy before
looking at the scopes -->





        




        
        

        
        
   <!-- 510878: Allow preferences to be hidden -->
    
      
   
        
            
            
            
            	
            
            
        




















<script language=JavaScript>
function showHidePreferencesCall(objectId) {
	showHidePreferences(objectId,"Show preferences","Hide preferences");
}
</script>

<form name="PreferenceForm" method="get" action="/ibm/console/preferenceAction.do" class="nopad"><input type=hidden name='csrfid' value='vXB8OSiEn5T5V0n7oTJh8DD'/>


        <table border="0" cellpadding="2" cellspacing="0" valign="top" width="100%" summary="Framing Table" >
        <tbody>
          <tr valign="top"> 
            <td class="table-text-white" id="prefs" nowrap scope="rowgroup"> 
              <a href="javascript:showHidePreferencesCall('com_ibm_ws_prefsTable')" CLASS="expand-task">
              <img id="com_ibm_ws_prefsTableImg" SRC="images/arrow_expanded.gif" alt="Hide preferences" border="0" align="texttop" tabindex="1"/>
              Preferences</A>
              <input type="hidden" name="show" value="collapsed">
            </td>
          </tr>
          </tbody>
        </table>
        
        
      


        <table id="com_ibm_ws_prefsTable" style="display:inline" border="0" cellpadding="2" cellspacing="0" valign="top" width="100%" summary="Framing Table" >
          <tbody>
                    
              <tr> 
                <td class="complex-property"> 
                  <table border="0" cellpadding="4" cellspacing="1" width="90%" summary="Properties Table">
                  
                      <tr>
                      
                            <td class="find-filter"  scope="row" valign="top" nowrap>
                      
                               <label FOR="text1" TITLE="Specifies the maximum number of rows that is displayed when the collection is large. Those rows not displayed on the current page are displayed on the next page.">
                               Maximum rows
                               </label>                                
                                <BR> 
                        
                        
                        
                        
                             
                                        <INPUT type="text" id="text1" class="textEntry" name="text1" size="25" value="20" TITLE="Specifies the maximum number of rows that is displayed when the collection is large. Those rows not displayed on the current page are displayed on the next page."/>
                                        
                                    
                                 
                             
                             
                        
                        
                          
                        <INPUT type="hidden"  name="dataType1"     value="unsigned" />
                        <INPUT type="hidden"  name="node1"         value="UI/Collections/DataSource/Preferences#maximumRows" />
                        <INPUT type="hidden"  name="defaultValue1" value="20" /> 
                        
                        
                        
                     
                      <tr>
                      
                            <td class="find-filter"  scope="row" valign="top" nowrap>
                      
                      

                       
                   
                        
                           
                           
                                                   
                           
                          <label FOR="checkbox2" TITLE="Specifies whether to use the same filter criteria entered in the show filter function to display this page the next time you visit it.">                          
                               <INPUT class="chkbox" id="checkbox2" type="checkbox" name="checkbox2"   /> 
                               Retain filter criteria
                          </label>

                       
                       
                       
                        <INPUT type="hidden"   name="node2"         value="UI/Collections/DataSource/Preferences#retainSearchCriteria" />
                        <INPUT type="hidden"   name="defaultValue2" value="false" />
                        
                    
                   
                      <tr>
                      
                            <td class="find-filter"  scope="row" valign="top" nowrap>
                      
                                  
								<label FOR="list3" TITLE="Specifies the authorization group level used to filter the items in the table.">
									Show items at the following authorization group level:
								                                
								<BR/>

								<select name="list3" >
								
									<option value="ALL" SELECTED>
										All Roles
									</option>
								
									<option value="administrator" >
										Administrator
									</option>
								
								</select>
                                </label>
								<INPUT type="hidden"   name="node3"         value="UI/Collections/DataSource/Preferences#roleFilter" />
								<INPUT type="hidden"   name="defaultValue3" value="ALL" />
							
                      <tr>
                      
                            <td class="find-filter"  scope="row" valign="top" nowrap>
                      
                      

                       
                   
                        
                           
                           
                                                   
                           
                          <label FOR="checkbox4" TITLE="Show resources in the scope hierarchy">                          
                               <INPUT class="chkbox" id="checkbox4" type="checkbox" name="checkbox4"   /> 
                               Show resources in the scope hierarchy
                          </label>

                       
                       
                       
                        <INPUT type="hidden"   name="node4"         value="UI/Collections/DataSource.content.main#resourceHierarchy" />
                        <INPUT type="hidden"   name="defaultValue4" value="false" />
                        
                    
                   
                      <tr>
                      
                            <td class="find-filter"  scope="row" valign="top" nowrap>
                      
                      

                       
                   
                        
                           
                           
                                                   
                           
                          <label FOR="checkbox5" TITLE="When enabled, the collection will include built-in resources that are defined by WebSphere Application Server.">                          
                               <INPUT class="chkbox" id="checkbox5" type="checkbox" name="checkbox5"   /> 
                               Show built-in resources
                          </label>

                       
                       
                       
                        <INPUT type="hidden"   name="node5"         value="UI/Collections/JDBCProvider_DataSource/Preferences#showBuiltinResources" />
                        <INPUT type="hidden"   name="defaultValue5" value="false" />
                        
                    
                   
            
                     </td>
                    </tr>
                
               
  
          <INPUT type="hidden" name="counter" VALUE="5" />
          
                   <tr> 
                  <td valign="top" class="navigation-button-section"> 
                    <input type="submit" name="submit2" value="Apply" class="buttons" id="section-button">
                    
                    <INPUT type="hidden" name="submit2" value="Enter" />
                    <input type="reset" value="Reset" class="buttons" id="section-button">
                  </td>
                </tr>

              </table>
            </td>
          </tr>
          </tbody>
        </table>

</form>


       <script language="JavaScript">showHidePreferencesCall('com_ibm_ws_prefsTable');</script>


                 
                                        



   

 <form name="com.ibm.ws.console.resources.database.DataSourceCollectionForm" method="post" action="/ibm/console/collectionButton.do" id="com.ibm.ws.console.resources.database.DataSourceCollectionForm"><input type=hidden name='csrfid' value='vXB8OSiEn5T5V0n7oTJh8DD'/>


        
            
            	
            
        









  




























  


<!-- gets all the action list items which matches with the contextType and 
     compatibilty criteria using plugin registry API -->




        


        <table border="0" cellpadding="3" cellspacing="0" valign="top" width="100%" summary="Framing Table" CLASS="button-section">

        <tr valign="top">
        <td class="table-button-section"  nowrap> 
        
        
    

    
    
    
    <table style="display: inline; font-size: 95%;" cellspacing="0" cellpadding="0" border="0"><tr>
    
    
              <td>
              
              <div style="position:relative;">
                   <input type="submit" name="button.new" value="New" onclick="showPleaseWaitButton()"" class="buttons" id="functions"/>
           </div>
           </td>
   
    
    
              <td>
              
              <div style="position:relative;">
                   <input type="submit" name="button.delete" value="Delete" onclick="showPleaseWaitButton()"" class="buttons" id="functions"/>
           </div>
           </td>
   
    
    
              <td>
              
              <div style="position:relative;">
                   <input type="submit" name="button.testConnection" value="Test connection" onclick="showPleaseWaitButton()"" class="buttons" id="functions"/>
           </div>
           </td>
   
    
    
              <td>
              
              <div style="position:relative;">
                   <input type="submit" name="JCALifeCycleSelect.button.manage" value="Manage state..." onclick="showPleaseWaitButton()"" class="buttons" id="functions"/>
           </div>
           </td>
   
    
    
      
        <input type="submit" name="hiddenButton1054781908513721" value="hiddenButton" style="display:none" class="buttons" id="hiddenButton1054781908513721"/>
        
    </tr></table>    
    

    <input type="hidden" name="definitionName" value="DataSource.collection.buttons.panel"/>
    <input type="hidden" name="buttoncontextType" value="DataSource"/>
    <input type="hidden" name="buttoncontextId" value="All Scopes"/>
    <input type="hidden" name="buttonperspective" value="null"/> 
     <input type="hidden" name="formAction" value="dataSourceCollection.do"/>  
    

    
    
        </td>
        </tr>
        </table>





 
<script language="JavaScript">
       function showHideMenu(buttonName){
              var table = document.getElementById(buttonName+".menu");
              if(table.style.display=="none"){
                     table.style.display="block";
              }
              else{
                     table.style.display="none";
              }       
       }
                     
       function isInputKey(e){
              var keyCodeChar;  
                           
              if (e && e.which){
                     keyCodeChar = e.which;
              }
              else{
                     e = event;
                     keyCodeChar = e.keyCode;
              }
                         
              if (keyCodeChar == 13 || keyCodeChar == 32){
                     return true;
              }
              else{
                     return false;
              }
       }
                     
       function selectMenuItem(buttonName,option,hiddenButtonId){
           var button = document.getElementById(buttonName);
           button.value=option;
           document.getElementById(hiddenButtonId).click();
       }
</script>

        

        <!-- 510878: Allow table controls to be hidden -->
         
        
        
                    <table CLASS="button-section" border="0" cellpadding="3" cellspacing="0" valign="top" width="100%" summary="Generic funtions for the table, such as content filtering">
        <tr valign="top">
        <td class="function-button-section"  nowrap>
        <table border="0" cellpadding="0" cellspacing="0" valign="top" ><tr>
        
        <td>
        <A id="selectAllButton" HREF="javascript:iscSelectAll('com.ibm.ws.console.resources.database.DataSourceCollectionForm')" tabindex="1" CLASS="expand-task">
            <IMG id="selectAllImg" align="top" SRC="images/wtable_select_all.gif" ALT='Select All' BORDER="0" ALIGN="texttop"> 
        </A>
        </td>
        <td>
        <A id="deselectAllButton" HREF="javascript:iscDeselectAll('com.ibm.ws.console.resources.database.DataSourceCollectionForm')" tabindex="1" CLASS="expand-task">
            <IMG id="deselectAllImg" align="top" SRC="images/wtable_deselect_all.gif" ALT='Deselect All' BORDER="0" ALIGN="texttop"> 
        </A>  
        </td>
        
		<td>
        <A HREF="javascript:showHideFilter()" tabindex="1" CLASS="expand-task">
            <IMG id="filterTableImg" align="top" SRC="images/wtable_filter_row_show.gif" ALT='Show filter function' BORDER="0" ALIGN="texttop"> 
        </A>
        </td>
        <td>
        <A HREF="javascript:clearFilter('com.ibm.ws.console.resources.database.DataSourceCollectionForm')" tabindex="1" CLASS="expand-task">
            <IMG  id="clearFilterImg" align="top" SRC="images/wtable_clear_filters.gif" ALT='Clear filter value' BORDER="0" ALIGN="texttop"/> 
        </A>
        </td>
        </table></tr>
        </td>        
        </tr>
        </table>


        

                <TABLE BORDER="0" CELLPADDING="3" CELLSPACING="1" WIDTH="100%" SUMMARY="List table" CLASS="framing-table">

                    <TR>
                    
                        <TH NOWRAP VALIGN="TOP" CLASS="column-head-name" SCOPE="col" id="selectCell" WIDTH="1%">
                            Select
                        </TH>
                    

                        
                    
                    
                        <TH VALIGN="TOP" CLASS="column-head-name" SCOPE="col" NOWRAP  WIDTH="25%" ID="name">
                    
                    
                            Name
                    
                            <A HREF="dataSourceCollection.do?SortAction=true&col=name&order=DSC">
                    
                                <IMG SRC="images/Sort_ascend2.gif" BORDER="0" align="texttop" ALT="Sorted in ascending order. Click to sort in descending order."></A>
                    
                    

                        </TH>

                        

                        
                    
                    
                        <TH VALIGN="TOP" CLASS="column-head-name" SCOPE="col" NOWRAP  WIDTH="25%" ID="jndiName">
                    
                    
                            JNDI name
                    
                            <A HREF="dataSourceCollection.do?SortAction=true&col=jndiName&order=ASC"><IMG SRC="images/Sort_none.gif" BORDER="0"  align="texttop"  ALT="The column is not sorted. Click to specify ascending order."></A>
                    
                    

                        </TH>

                        

                        
                    
                    
                        <TH VALIGN="TOP" CLASS="column-head-name" SCOPE="col" NOWRAP  WIDTH="25%" ID="contextId">
                    
                    
                            Scope
                    
                            <A HREF="dataSourceCollection.do?SortAction=true&col=contextId&order=ASC"><IMG SRC="images/Sort_none.gif" BORDER="0"  align="texttop"  ALT="The column is not sorted. Click to specify ascending order."></A>
                    
                    

                        </TH>

                        

                        
                    
                    
                        <TH VALIGN="TOP" CLASS="column-head-name" SCOPE="col" NOWRAP  WIDTH="25%" ID="provider">
                    
                    
                            Provider
                    
                            <A HREF="dataSourceCollection.do?SortAction=true&col=provider&order=ASC"><IMG SRC="images/Sort_none.gif" BORDER="0"  align="texttop"  ALT="The column is not sorted. Click to specify ascending order."></A>
                    
                    

                        </TH>

                        

                        
                    
                    
                        <TH VALIGN="TOP" CLASS="column-head-name" SCOPE="col" NOWRAP  WIDTH="25%" ID="description">
                    
                    
                            Description
                    
                            <A HREF="dataSourceCollection.do?SortAction=true&col=description&order=ASC"><IMG SRC="images/Sort_none.gif" BORDER="0"  align="texttop"  ALT="The column is not sorted. Click to specify ascending order."></A>
                    
                    

                        </TH>

                        

                        
                    
                    
                        <TH VALIGN="TOP" CLASS="column-head-name" SCOPE="col" NOWRAP  WIDTH="25%" ID="category">
                    
                    
                            Category
                    
                            <A HREF="dataSourceCollection.do?SortAction=true&col=category&order=ASC"><IMG SRC="images/Sort_none.gif" BORDER="0"  align="texttop"  ALT="The column is not sorted. Click to specify ascending order."></A>
                    
                    

                        </TH>

                        

                        
                    </TR>


            
<SCRIPT language="JavaScript">
	var filterOptions = new Array(6);
	var filterText = new Array(6);
	
	
			filterOptions[0]=new Array(1);
			filterOptions[0][0]="name"
			filterText[0]=new Array(0);
			
			filterOptions[1]=new Array(1);
			filterOptions[1][0]="jndiName"
			filterText[1]=new Array(0);
			
			filterOptions[2]=new Array(1);
			filterOptions[2][0]="contextId"
			filterText[2]=new Array(0);
			
			filterOptions[3]=new Array(1);
			filterOptions[3][0]="provider"
			filterText[3]=new Array(0);
			
			filterOptions[4]=new Array(1);
			filterOptions[4][0]="description"
			filterText[4]=new Array(0);
			
			filterOptions[5]=new Array(1);
			filterOptions[5][0]="category"
			filterText[5]=new Array(0);
			
	
	
	function updateSearchPattern(){
		var filterValue = document.getElementById("searchFilter").value;
		var searchPattern = document.getElementById("searchPattern").value;
		for (var i=0; i < 6; i++){
			if(filterValue == filterOptions[i][0]){
				var selectInput = document.getElementById("SelectBoxFilterInput");
				var textInput = document.getElementById("rawTextFilterInput");
				var selectBox = document.getElementById("searchPatternSelect");
				var textBox = document.getElementById("searchPattern");
				if(filterOptions[i].length == 1){
					selectInput.style.display="none";
					textInput.style.display="";
					selectBox.name="unused";
					textBox.name="searchPattern";
				}
				else{
					selectInput.style.display="";
					textInput.style.display="none";
					textBox.name="unused";
					selectBox.name="searchPattern";
					selectBox.options.length=0;
					selectBox.options[0]=new Option("*","*");
					for(var j=0; j < filterOptions[i].length-1; j++){
						selectBox.options[j+1]=new Option(filterText[i][j],filterOptions[i][j+1]);
						if(filterText[i][j] == searchPattern){
							selectBox.options[j+1].selected="True";
						}
					}
				}
				return;
			}
		}
	}
</SCRIPT>

            <TBODY ID="filterControls" STYLE="display:none">
            <TR  width="100%">
            <TD CLASS="column-filter-expanded" COLSPAN=7>
            <BR>To filter the following table, select the column by which to filter, then enter filter criteria (wildcards: *,?,%).
            <table width="10%" border="0">
            <tr>
            <td NOWRAP CLASS="column-filter-expanded" align="left" valign="top">
            <LABEL for="searchFilter" title="Select the column by which to filter">Filter</LABEL><br>
                <select NAME="searchFilter" ID="searchFilter" onchange="updateSearchPattern()">
            
            				<OPTION VALUE="name" SELECTED="SELECTED">Name</OPTION>
            
            				<OPTION VALUE="jndiName">JNDI name</OPTION>
            
            				<OPTION VALUE="contextId">Scope</OPTION>
            
            				<OPTION VALUE="provider">Provider</OPTION>
            
            				<OPTION VALUE="description">Description</OPTION>
            
            				<OPTION VALUE="category">Category</OPTION>
            
		</select>
            
            </td>
            <td NOWRAP CLASS="column-filter-expanded" align="left" valign="top">
            
            <table>
            <tbody id="SelectBoxFilterInput" ><tr><td CLASS="column-filter-expanded">
            <LABEL for="searchPatternSelect" title="Enter the filter criteria">Search terms:</LABEL><br>
            <SELECT class="textEntry" NAME="searchPattern" ID="searchPatternSelect" onkeypress="return onenter(event, this.form)">
            </SELECT>
            </td><td CLASS="column-filter-expanded" valign="bottom">
            <INPUT TYPE="submit" NAME="searchAction" ID="searchActionSelect" VALUE="Go" CLASS="buttons-filter">
            </td></tr></tbody>
            <tbody id="rawTextFilterInput" ><tr><td CLASS="column-filter-expanded">
            <LABEL for="searchPattern" title="Enter the filter criteria">Search terms:</LABEL><br>
            
            <INPUT TYPE="text" class="textEntry" NAME="searchPattern" ID="searchPattern" VALUE="*" onkeypress="return onenter(event, this.form)">            
             </td><td CLASS="column-filter-expanded" valign="bottom">
            <INPUT TYPE="submit" NAME="searchAction" ID="searchAction" VALUE="Go" CLASS="buttons-filter">
            </tr></td></tbody>
			</table>
            <br><BR>            
            </td>
            </tr>
            </table>
                                    

            </TD> 
            </TR>
            </TBODY>
            
<SCRIPT language="JavaScript">
	updateSearchPattern();
	if("none" != "none"){
		showHideFilter();
	}
</SCRIPT>



            

                     
            

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535275480" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                                                        <TR><TD class='table-role' valign='baseline' colspan='7'>You can administer the following resources:</TD></TR>
                                                        
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535275480#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 1'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535275480#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535275480#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 1
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535275480&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            ImageAFADataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/ImageAFADataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Data source template
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535278052" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535278052#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 2'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535278052#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535278052#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 2
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535278052&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            ImageFAODataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/ImageFAODataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Data source template
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1451419195819" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1451419195819#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 3'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1451419195819#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1451419195819#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 3
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1451419195819&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            ImageSFADataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/ImageSFADataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            New JDBC Datasource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535270147" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535270147#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 4'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535270147#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535270147#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 4
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535270147&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            OSAPAFAWebDataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/OSAPAFAWebDataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Data source template
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535267534" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535267534#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 5'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535267534#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535267534#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 5
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535267534&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            OSAPAWWebDataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/OSAPAWWebDataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Data source template
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535265056" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535265056#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 6'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535265056#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535265056#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 6
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535265056&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            OSAPFAOWebDataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/OSAPFAOWebDataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Data source template
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535262256" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535262256#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 7'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535262256#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535262256#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 7
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535262256&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            OSAPSFAWebDataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/OSAPSFAWebDataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Data source template
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535259668" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535259668#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 8'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535259668#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535259668#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 8
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535259668&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            OSAPSysAdminDataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/OSAPSysAdminDataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Data source template
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535272857" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535272857#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 9'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535272857#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535272857#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 9
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535272857&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            OSAPUserRegistry
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/OSAPUserRegistry
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Data source template
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535279894" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535279894#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 10'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535279894#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535279894#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 10
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535279894&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            PlatformSysAdminDataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/PlatformSysAdminDataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Oracle JDBC Driver
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Data source template
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535377574" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535377574#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 11'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535377574#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535377574#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 11
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535377574&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            _OND2C01062695Node02.server1-InfrastructureServiceBus
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/com.ibm.ws.sib/OND2C01062695Node02.server1-InfrastructureServiceBus
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Derby JDBC Provider
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Default Datasource for SIB
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1416535318037" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1416535318037#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 12'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1416535318037#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1416535318037#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 12
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1416535318037&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            _OND2C01062695Node02.server1-OSAPServiceBus
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/com.ibm.ws.sib/OND2C01062695Node02.server1-OSAPServiceBus
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Derby JDBC Provider
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Default Datasource for SIB
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1428957148512" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1428957148512#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 13'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1428957148512#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1428957148512#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 13
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1428957148512&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            _OND4C01212175Node02.server1-OSAPServiceBus
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/com.ibm.ws.sib/OND4C01212175Node02.server1-OSAPServiceBus
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Derby JDBC Provider
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Default Datasource for SIB
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1467301112738" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1467301112738#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 14'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1467301112738#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1467301112738#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 14
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1467301112738&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            _OND4C01212175Node05.server1-OSAPServiceBus
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/com.ibm.ws.sib/OND4C01212175Node05.server1-OSAPServiceBus
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            Derby JDBC Provider
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            Default Datasource for SIB
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    

                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     
                     
                     <input type="hidden" name="DataSource_1424468790784" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>



                                   
                    <TR CLASS="table-row">

                    
                        <TD VALIGN="top"  width="1%" class="collection-table-text" headers="selectCell">
                            
                                                
                                          <LABEL class="collectionLabel" for="DataSource_1424468790784#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" TITLE='Select Row 15'>
                                          &nbsp; <input type="checkbox" name="selectedObjectIds" value="DataSource_1424468790784#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1" onclick="checkChecks(this)" onkeypress="checkChecks(this)" id="DataSource_1424468790784#cells/OND4C01212175Node05Cell/nodes/OND4C01212175Node05/servers/server1">
                            
                                   
                                   <div class="hidden">
            	        Select Row 15
                        </LABEL>
                            
                         </TD>

                        
                        
                        

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="name">

                       
                                       
                               
                        
                        
                        
                        
                            <A HREF="dataSourceCollection.do?EditAction=true&refId=DataSource_1424468790784&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&resourceUri=resources.xml&perspective=tab.configuration">
                        
                            as400DataSource
                     


                            
                            </A>
                            

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="jndiName">

                       
                                       
                               
                        
                        
                        
                        
                            jdbc/as400DataSource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="contextId">

                       
                                       
                               
                        
                        
                        
                        

                           


                                
                                 
                                    Node=OND4C01212175Node05,Server=server1
                        
                        
                           


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="provider">

                       
                                       
                               
                        
                        
                        
                        
                            DB2 UDB for iSeries (Toolbox)
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="description">

                       
                                       
                               
                        
                        
                        
                        
                            New JDBC datasource
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    

                        <TD VALIGN="top"  class="collection-table-text" headers="category">

                       
                                       
                               
                        
                        
                        
                        
                            
                     


                            
                               
                                 &nbsp;
                               
                          

                        </TD>

                        
                    </TR>
                    
                    
                    


                </TABLE>


               <input type="hidden" name="collectionFormAction" value="dataSourceCollection.do"/>
              



</form>




    



    


































<!--Number Per Page: 20<BR>Total rows: 15<BR>Filtered rows: 15<BR>Current page: 1<BR>-->



          
<form action="dataSourceCollection.do" name="com.ibm.ws.console.resources.database.DataSourceCollectionForm" type="com.ibm.ws.console.resources.database.jdbc.DataSourceCollectionForm" class="nopad">
<input type=hidden name="csrfid" value="122642578">


<TABLE class="paging-table" BORDER="0" CELLPADDING="5" CELLSPACING="0" WIDTH="100%" SUMMARY="Table for displaying paging function">
	<TR>
			

            <TD CLASS="table-totals" VALIGN="baseline">               
            Total 15
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
 </TD>
 
        








<!--WSC Console: needed for Federation-->


<!--CommandAssistance LI3509-->




	<script language="JavaScript">
	var federationAdder = 0;
	</script>



   <!-- CommandAssistance LI3509-59 start -->
	<script language="JavaScript">

   function loadCAWindow(username)
   {
      initializeCAWindowVar();
      if (top.CAWindowHandle==null ||
          top.CAWindowHandle.closed)
      {
         //alert("caWindow is null or closed");
         var windowName = "wsadminCAWindow" + username;
         //alert(windowName);
         top.CAWindowHandle = window.open('com.ibm.ws.console.core.commandassistance.forwardCmd.do?csrfid=122642578&forwardName=console.commandassistance.main', windowName, 'resizable=yes,scrollbars=yes,width=700,height=350');
         top.CAWindowHandle.focus();
      }
      else
      {
         //alert("caWindow exits - give focus and reload");
         top.CAWindowHandle.focus();
         top.CAWindowHandle.location.reload();
      }
   }


   function reloadCAWindow()
   {
      //alert("in reloadCAWindow()");
      if (top.CAWindowHandle!=null && !top.CAWindowHandle.closed)
      {
         top.CAWindowHandle.location.reload();
      }
   }

   function initializeCAWindowVar() {
      // Create it if it doesn't exist yet, read the value if it does
      if (top.CAWindowVar == null) {
         top.CAWindowVar = "initialized";
         top.CAWindowHandle = null;
      }
   }


	</script>
   <!-- CommandAssistance LI3509-59 end -->

         

</TR>
</TABLE>
<script>
window["collectionFilter"]={"DataSource_1424468790784#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535270147#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1467301112738#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535272857#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535278052#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535318037#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535275480#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535279894#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535377574#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535265056#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1451419195819#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535259668#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535267534#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1428957148512#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"],"DataSource_1416535262256#cells\/OND4C01212175Node05Cell\/nodes\/OND4C01212175Node05\/servers\/server1":["deployer","operator","configurator","monitor","administrator","adminsecuritymanager","auditor"]};
window["roleNLS"]={"deployer":"Deployer","operator":"Operator","configurator":"Configurator","button.disabled.desc":"One of the following authorization levels is required to perform this action:  {0}","monitor":"Monitor","administrator":"Administrator"};
</script>

</body>
</html>

