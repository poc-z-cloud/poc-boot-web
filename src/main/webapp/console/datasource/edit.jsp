<html lang="en">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<META HTTP-EQUIV="Expires" CONTENT="0">
<TITLE>Detail Page</TITLE> 
<LINK href="../css/adminconsole.css" rel="stylesheet" type="text/css"/>
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
var statusIconStarted = '../images/running.gif';        
var statusIconStopped = '../images/stop.gif';
var statusIconUnavailable = '../images/unknown.gif';
var statusIconUnknown = '../images/unknown.gif';
var statusIconPartialStart = '../images/part_start.gif';
var statusIconPartialStop = '../images/part_stop.gif';
var statusIconSynchronized = '../images/synch.gif';
var statusIconNotSynchronized = '../images/not_synch.gif';                
statusIconArray = new Array(statusIconStarted,statusIconStopped,statusIconUnavailable,statusIconUnknown,statusIconPartialStart,statusIconPartialStop,statusIconSynchronized,statusIconNotSynchronized);

var moveInListError = "You must select an entry to be moved.";
var noInfoAvailable = "For field help information, select a field label or list marker when the help cursor is displayed.";

var lookInPageHelp = "";

var selectText = "Select";

var helpImage = "../images/title_help.gif";
var minimizeImage = "../images/title_minimize.gif";
var maximizeImage = "../images/title_maximize.gif";
//F04026-42139                      
var csrfURLParameter = "&csrfid=-303026363&";


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



<SCRIPT LANGUAGE="javascript" SRC="scripts/menu_functions.js"></script>
</head>
                                  
<body CLASS="content"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"> 

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
			<a href="/ibm/help/index.jsp?topic=/com.ibm.ws.console.resources/udat_jdbcdatsordet.html" tabindex="100" target='WAS_help'><img src="../images/title_help.gif" border="0" alt="View more information about this page" align="texttop"></a>
		</TH>
	
	<TH class="wpsPortletTitleControls">
		<A href="javascript:showHidePortlet('wasUniPortlet')">
			<img id="wasUniPortletImg" SRC="../images/title_minimize.gif" alt="Expand or collapse" border="0" align="texttop" tabindex="1"/>
		</A> 
	</TH>
	
	
</TR>




  <TBODY ID="wasUniPortlet">
  <TR>   
  <TD CLASS="wpsPortletArea" COLSPAN="3" >
    
         <a name="important"></a> 
        
        <h1 id="title-bread-crumb"><a href='https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=DataSource.content.main&WSC=true'>Data sources</a> > ImageAFADataSource</h1>
	




        

  
        
        
             <p class="instruction-text">
             Use this page to edit the settings of a datasource that is associated with your selected JDBC provider. The datasource object supplies your application with connections for accessing the database.
             </p>
        
  
     
     





<a name="main"></a>






























 






<!-- gets all the tab list items which matches with the contextType and 
     compatibilty criteria using plugin registry API -->










<table border="0" cellpadding="0" cellspacing="0"  width="100%" >
<tr valign="top"> 




    	
    <td class="tabs-on" width="1%" nowrap height="12">
        Configuration
    </td>
    
     



    <td class="blank-tab" width="99%" nowrap height="12">
        <img src="../images/onepix.gif" width="1" height="10" align="absmiddle" alt="">
    </td>

</tr>
</table>

<table border="0" cellpadding="10" cellspacing="0" valign="top" width="100%" summary="Framing Table">
<tr> 
<td class="layout-manager">



















  
          
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="5" cellspacing="10">
    
        


   <TR><TD VALIGN="top" COLSPAN="2">
    
        
    



























  




























  


<!-- gets all the action list items which matches with the contextType and 
     compatibilty criteria using plugin registry API -->




        


        <table border="0" cellpadding="3" cellspacing="0" valign="top" width="100%" summary="Framing Table" CLASS="button-section">

        <tr valign="top">
        <td class="table-button-section"  nowrap> 
        
        
              
    <form method="POST" action="toolbar.do" class="nopad">
    <input type=hidden name="csrfid" value="-303026363">
    

    
    
    
    <table style="display: inline; font-size: 95%;" cellspacing="0" cellpadding="0" border="0"><tr>
    
    
              <td>
              
              <div style="position:relative;">
                   <input type="submit" name="button.testConnection" value="Test connection" onclick="showPleaseWaitButton()"" class="buttons" id="functions"/>
           </div>
           </td>
   
    
    
      
        <input type="submit" name="hiddenButton1128301087016331" value="hiddenButton" style="display:none" class="buttons" id="hiddenButton1128301087016331"/>
        
    </tr></table>    
    

    <input type="hidden" name="definitionName" value="DataSource.detail.buttons.panel"/>
    <input type="hidden" name="buttoncontextType" value="DataSource"/>
    <input type="hidden" name="buttoncontextId" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1"/>
    <input type="hidden" name="buttonperspective" value="tab.configuration"/> 
     <input type="hidden" name="formAction" value="null"/>  
    

     
      </form>
    
    
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






   </TD></TR>

      <TR><TD VALIGN="top">
        








  

















                                                                                      









































 
   <a name="general"></a>
   
   
   
       
              <h2>General Properties</H2>  
            
   
	
    
    
    
    
    
    
    
    
    
    
    
    
<form name="com.ibm.ws.console.resources.database.DataSourceDetailForm" method="post" action="/ibm/console/dataSourceDetail.do" onreset=""><input type=hidden name='csrfid' value='822Kp_T9dUBSckdR5TYWiTL'/>
<input type="hidden" name="action" value="Edit">
<input type="hidden" name="contextType" value="DataSource">
<table class="framing-table" border="0" cellpadding="5" cellspacing="0" width="100%" summary="Properties Table" >
    <tbody>
             
            
    
    
    
        
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                    
                    
                        
        
        
        
        
        
        
        
        
        
        















   
   
   
   
   
   
   
   
   
   
   
   
   
   

   
   

   

    
        <td class="table-text"  scope="row" valign="top">
    


            
              <span class="requiredField">
               <label  for="contextId" title="Specifies the highest topological level at which application servers can use this resource object.">
                
                <img id="requiredImage" src="../images/attend.gif" width="8" height="8" align="absmiddle" alt="Information required">
                Scope
                
                </label>
              </span>
            


            
            	<BR/>
            

            
        	      <table border="0" cellpadding="0" cellspacing="0" width="60%">
                        <tr>
                           <td class="table-text" scope="row" valign="top">
			                 <DIV CLASS="readOnlyElement">
			                   cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1&nbsp;
			                   <input TYPE="hidden" name="contextId" id="contextId" value="cells:OND4C01212175Node05Cell:nodes:OND4C01212175Node05:servers:server1" DISABLED/>			            
			                 </DIV>
			               </td>
			               <td class="table-text">
			        	   
			        	   </td>
			        	</tr>
			         </table>
		             
          

    
        </td>
    





                    
                    
                    
       
                    
            
                    
            
                    
                    
                    
                    
                    
                    
                    
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                    
                    
                        
        
        
        
        
        
        
        
        
        
        















   
   
   
   
   
   
   
   
   
   
   
   
   
   

   
   

   

    
        <td class="table-text"  scope="row" valign="top">
    


            
              <span class="requiredField">
               <label  for="provider" title="The provider that created the resource factory.">
                
                <img id="requiredImage" src="../images/attend.gif" width="8" height="8" align="absmiddle" alt="Information required">
                Provider
                
                </label>
              </span>
            


            
            	<BR/>
            

            
        	      <table border="0" cellpadding="0" cellspacing="0" width="60%">
                        <tr>
                           <td class="table-text" scope="row" valign="top">
			                 <DIV CLASS="readOnlyElement">
			                   Oracle JDBC Driver&nbsp;
			                   <input TYPE="hidden" name="provider" id="provider" value="Oracle JDBC Driver" DISABLED/>			            
			                 </DIV>
			               </td>
			               <td class="table-text">
			        	   
			        	   </td>
			        	</tr>
			         </table>
		             
          

    
        </td>
    





                    
                    
                    
       
                    
            
                    
            
                    
                    
                    
                    
                    
                    
                    
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                    
                    
                        
        
        
        
        
        
        
        
        
        
        















   
   
   
   
   
   
   
   
   
   
   
   
   
   

   
   

   

    
        <td class="table-text"  scope="row" valign="top">
    


            
              <span class="requiredField">
               <label  for="name" title="The required display name for the resource.">
                
                <img id="requiredImage" src="../images/attend.gif" width="8" height="8" align="absmiddle" alt="Information required">
                Name
                
                </label>
              </span>
            


            
            	<BR/>
            

            
                    <input type="text" name="name" size="60" value="ImageAFADataSource" onmouseout="" onkeyup="" class="textEntryRequired" id="name" title="The required display name for the resource.">

    
        </td>
    





                    
                    
                    
       
                    
            
                    
            
                    
                    
                    
                    
                    
                    
                    
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                    
                    
                        
        
        
        
        
        
        
        
        
        
        















   
   
   
   
   
   
   
   
   
   
   
   
   
   

   
   

   

    
        <td class="table-text"  scope="row" valign="top">
    


            
                <label  for="jndiName" title="The JNDI name for the resource.">
                
                JNDI name
                
                </label>
            


            
            	<BR/>
            

                 <input type="text" name="jndiName" size="60" value="jdbc/ImageAFADataSource" onmouseout="" onkeyup="" class="textEntry" id="jndiName" title="The JNDI name for the resource.">

    
        </td>
    





                    
                    
                    
       
                    
            
                    
            
                    
                    
                    
                    
                    
                    
                    
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                    
                    
                    
                    
       
                    
            
                    
                        
        
        
        
        
        
        
        
        
        
        













   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

   

  
    
    
    
    
    
        <td class="table-text"  scope="row" >
    
        
             
            <div class="chkbox-div" title="Specifies that the datasource is used for container-managed persistence (CMP) of enterprise beans. This option triggers creation of a CMP connection factory, which corresponds to the datasource, for the relational resource adapter.">
            <label  for="isUsedByCmp" title="Specifies that the datasource is used for container-managed persistence (CMP) of enterprise beans. This option triggers creation of a CMP connection factory, which corresponds to the datasource, for the relational resource adapter.">
            
            
                
    	        <input type="checkbox" name="isUsedByCmp" value="on" onclick="" onkeypress="" class="chkbox" id="isUsedByCmp">
            
            
            <div class="hidden">
            	Use this data source in container managed persistence (CMP)	
            </div>
            </label>
            Use this data source in container managed persistence (CMP)&nbsp;
            </div>
            
    
        </td>
    

   
    

   
   
 

                    
            
                    
                    
                    
                    
                    
                    
                    
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                    
                    
                    
                    
       
                    
                        
        
        
        
        
        
        
        
        
        
        
        














   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

   
   
    
        <td class="table-text"  scope="row" valign="top">
    
                      
                         
                <label  for="description" title="An optional description for the resource.">
                
                Description
                
                </label>
            
            
          

            
            	<BR/>
            
            
              
            
             <textarea name="description" cols="60" rows="5" id="description" title="An optional description for the resource.">Data source template</textarea>
        
        
        
    
        </td>
    
       

    

   
   
 

                    
            
                    
            
                    
                    
                    
                    
                    
                    
                    
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                        
        
        
        
        
        
        
        
        
        
        















   
   
   
   
   
   
   
   
   
   
   
   
   
   

   
   

   

    
        <td class="table-text"  scope="row" valign="top">
    


            
                <label  for="category" title="An optional category string to use when classifying or grouping the resource.">
                
                Category
                
                </label>
            


            
            	<BR/>
            

                 <input type="text" name="category" size="30" value="" onmouseout="" onkeyup="" class="textEntry" id="category" title="An optional category string to use when classifying or grouping the resource.">

    
        </td>
    





                    
                    
                    
                    
                    
       
                    
            
                    
            
                    
                    
                    
                    
                    
                    
                    
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                    
                    
                    
                    
       
                    
            
                    
            
                    
                    
                    
                    
                    
                        
        
        
        
        
        
        
        
        
        
        
        
        













                    
   
   
   
   
   
   
   
   
   
   

   
   
   

   

        
        <td class="table-text"  scope="row" valign="top" nowrap>
            <fieldset id="datasourceHelperClassname" title="Specifies the data store helper class, an interface through which a datasource is triggered by a database to perform functions specific to that database vendor.">
            <legend  for="datasourceHelperClassname" title="Specifies the data store helper class, an interface through which a datasource is triggered by a database to perform functions specific to that database vendor."> Data store helper class name</legend>                                
        
			            
	            
	            	
                        
                        
                        
                        
                        
	           	
















   
   
   
   
   

   
   
   
   



    
    



           <table  border="0" cellspacing="0" cellpadding="3">
               <tr valign="top"> 
                   <td class="table-text"> 
                       <label for="dsSELECT" TITLE="Specifies the data store helper class, an interface through which a datasource is triggered by a database to perform functions specific to that database vendor.">
                       <input type="radio" name="datasourceHelperChoice" value="SELECT" checked="checked" onclick="enableDisable('dsSELECT:datasourceHelperSelect,dsMANUAL:datasourceHelperManual')" id="dsSELECT">Select a data store helper class
                       </LABEL>
                   </td>
               </tr>
               <tr valign="top"> 
                   <td class="complex-property"> 
                       <LABEL FOR="datasourceHelperSelect" TITLE="Specifies the data store helper class, an interface through which a datasource is triggered by a database to perform functions specific to that database vendor.">Data store helper classes provided by WebSphere Application Server</LABEL>
                       <br>
                       <select name="datasourceHelperSelect" size="4" id="datasourceHelperSelect"><option value="com.ibm.websphere.rsadapter.Oracle10gDataStoreHelper">Oracle10g data store helper</option>

							<option value="com.ibm.websphere.rsadapter.Oracle10gDataStoreHelper" disabled>&nbsp;&nbsp;&nbsp;&nbsp;(com.ibm.websphere.rsadapter.Oracle10gDataStoreHelper)</option>

            				<option value="com.ibm.websphere.rsadapter.Oracle11gDataStoreHelper" selected>Oracle11g data store helper</option>
            		
							<option value="com.ibm.websphere.rsadapter.Oracle11gDataStoreHelper" disabled>&nbsp;&nbsp;&nbsp;&nbsp;(com.ibm.websphere.rsadapter.Oracle11gDataStoreHelper)</option></select>
                   </td>
               </tr>

               <tr valign="top"> 
                   <td class="table-text"> 

                       <LABEL for="dsMANUAL" TITLE="Specifies the data store helper class, an interface through which a datasource is triggered by a database to perform functions specific to that database vendor."><input type="radio" name="datasourceHelperChoice" value="MANUAL" onclick="enableDisable('dsSELECT:datasourceHelperSelect,dsMANUAL:datasourceHelperManual')" id="dsMANUAL">Specify a user-defined data store helper</LABEL>
                   </td>
               </tr>

               <tr valign="top"> 
                   <td class="complex-property"> 
                      <LABEL for="datasourceHelperManual" TITLE="Specifies the data store helper class, an interface through which a datasource is triggered by a database to perform functions specific to that database vendor.">Enter a package-qualified data store helper class name</LABEL>
                      <br>
                      <input type="text" name="datasourceHelperManual" size="70" value="" class="textEntry" id="datasourceHelperManual">
                   </td>
               </tr>

           </table>
<script type="text/javascript" language="JavaScript">
enableDisable('dsSELECT:datasourceHelperSelect,dsMANUAL:datasourceHelperManual');
</script>


           
            </fieldset>
        </td>
       
      
    

   
   
 

                    
                    
                    
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                    
                    
                    
                    
       
                    
            
                    
            
                    
                    
                    
                    
                    
                        
        
        
        
        
        
        
        
        
        
        
        
        













                    
   
   
   
   
   
   
   
   
   
   

   
   
   

   

        
        <td class="table-text"  scope="row" valign="top" nowrap>
            <fieldset id="componentManagedAlias" title="Select the authentication values for this resource.">
            <legend  for="componentManagedAlias" title="Select the authentication values for this resource."> Security settings</legend>                                
        
			            
	            
	            	
                        
                        
                        
                        
                        
	           	

































<table border="0" cellspacing="2" cellpadding="3">
     <tr valign="top"> 
        <td class="table-text" valign="top" scope="row">            
           Select the authentication values for this resource.
		   <BR>
        </td>
     </tr>
     





						<!-- Component managed alias -->
						<TR>
                        <TD CLASS="table-text">
                           <label for='authDataAlias' title="Specifies an authentication alias for use when the component resource reference res-auth value is Application. See Related Items -> J2EE Connector Architecture (J2C) authentication data entries to define a new alias.">
                            Component-managed authentication alias
                           </label> 
                           <BR>
							<select name="authDataAlias" id="authDataAlias"><option value="">(none)</option>
							
							   <option value="osapsysadmin_weblogin">osapsysadmin_weblogin</option>
                             
							   <option value="osapsfaweb_weblogin">osapsfaweb_weblogin</option>
                             
							   <option value="osapfaoweb_weblogin">osapfaoweb_weblogin</option>
                             
							   <option value="osapawweb_weblogin">osapawweb_weblogin</option>
                             
							   <option value="osapafaweb_weblogin">osapafaweb_weblogin</option>
                             
							   <option value="commonuser_weblogin">commonuser_weblogin</option>
                             
							   <option value="imageafaweb_weblogin" selected="selected">imageafaweb_weblogin</option>
                             
							   <option value="imagefaoweb_weblogin">imagefaoweb_weblogin</option>
                             
							   <option value="OND2C01062695Node02/os400db2">OND2C01062695Node02/os400db2</option>
                             
							   <option value="OND4C01212175Node02/ucmlogin">OND4C01212175Node02/ucmlogin</option></select>    
     
                        </TD>
                        </TR>



						<!-- Mapping config alias -->
						<TR>
                        <TD CLASS="table-text">
                           <label for='mappingConfigAlias' title="This field will be used only in the absence of a loginConfiguration on the component resource reference. The specification of a login configuration and associated properties on the component resource reference is the preferred way to define the authentication strategy when the res-auth value is Container. If the 'DefaultPrincipalMapping' login configuration is specified, the associated property will be a JAAS - J2C authentication data entry alias. See related item JAAS - J2C authentication data entry to define a new alias.">
                            Mapping-configuration alias
                           </label> 
                           <BR>
                            <select name="mappingConfigAlias" onchange="enableDisableContainerManaged()" id="mappingConfigAlias"><option value="">(none)</option>
                             
                                  <option value="ClientContainer">ClientContainer</option>
                             
                                  <option value="WSLogin">WSLogin</option>
                             
                                  <option value="DefaultPrincipalMapping" selected="selected">DefaultPrincipalMapping</option></select>  
    
                        </TD>
                        </TR>



		                <!-- Container managed alias -->
						<TR>
                        <TD CLASS="table-text">
                           <label for='containerManagedAlias' title="This field will be used only in the absence of a loginConfiguration on the component resource reference. The specification of a login configuration and associated properties on the component resource reference determines the container-managed authentication strategy when the res-auth value is Container.">
                               
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               
                               Container-managed authentication alias
                           </label> 
                           <BR>
                           
                           
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           
                           
                            <select name="containerManagedAlias" id="containerManagedAlias"><option value="">(none)</option>
							
							   <option value="osapsysadmin_weblogin">osapsysadmin_weblogin</option>
                             
							   <option value="osapsfaweb_weblogin">osapsfaweb_weblogin</option>
                             
							   <option value="osapfaoweb_weblogin">osapfaoweb_weblogin</option>
                             
							   <option value="osapawweb_weblogin">osapawweb_weblogin</option>
                             
							   <option value="osapafaweb_weblogin">osapafaweb_weblogin</option>
                             
							   <option value="commonuser_weblogin">commonuser_weblogin</option>
                             
							   <option value="imageafaweb_weblogin" selected="selected">imageafaweb_weblogin</option>
                             
							   <option value="imagefaoweb_weblogin">imagefaoweb_weblogin</option>
                             
							   <option value="OND2C01062695Node02/os400db2">OND2C01062695Node02/os400db2</option>
                             
							   <option value="OND4C01212175Node02/ucmlogin">OND4C01212175Node02/ucmlogin</option></select>    
     
                        </TD>
                        </TR>




</table>

<script type="text/javascript" language="JavaScript">

    enableDisableContainerManaged();    

    function enableDisableContainerManaged(){

      var showMappingConfigAlias = true;
      var showContainerManagedAlias = true;
      var disabled = false;

      if(showMappingConfigAlias && showContainerManagedAlias && !disabled) {

         var mappingConfig = document.forms[0].mappingConfigAlias;
		 var containerManaged = document.forms[0].containerManagedAlias;
		 var browseButton = document.forms[0].browseForContainerManagedAuth;

		 if(mappingConfig==undefined) {
            mappingConfig = document.forms[1].mappingConfigAlias;
		    containerManaged = document.forms[1].containerManagedAlias;
			browseButton = document.forms[1].browseForContainerManagedAuth;
		 }

         mappingConfigSelected = mappingConfig.options[mappingConfig.selectedIndex].value;
         
		 if(mappingConfigSelected=="ClientContainer" || mappingConfigSelected=="WSLogin" || mappingConfigSelected=="WSKRB5Login" ){
            containerManaged.disabled = true;
			containerManaged.selectedIndex = 0;
			if(browseButton){              
			   browseButton.disabled = true;
			}
	     } else {
            containerManaged.disabled = false;
		    if(browseButton){
			   browseButton.disabled = false;
			}
	     }
	  }
    }

</script>

           
            </fieldset>
        </td>
       
      
    

   
   
 

                    
                    
                    
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
        

        <TR>
        <TD CLASS="table-text">
        
        <FIELDSET>
        <LEGEND>
          Common and required data source properties
        </LEGEND>                        
                                
        <table class="categorizedField" id="DataSource.required.properties" border="0" cellpadding="5" cellspacing="0" width="100%" summary="Properties Category Table" >

        
        

    
    
    
    
    
    
           

           
            <tr valign="top">
           
           
                    
     
                    
                        
                    
                    
                    
                    
                    
       
                    
            
                    
            
                    
                    
                    
                    
                    
                    
                    
                        
        
        
        
        
        
        
        
        
        
        
        























   






<script language="JavaScript" src="/ibm/console/com.ibm.ws.console.resources.database/scripts.js"></script>





   <TD>        
       <TABLE border="0" cellpadding="3" cellspacing="1" width="100%" summary="List table" class="framing-table">
           <TR>
               <TH nowrap valign="TOP" class="column-head-name" scope="col" width="1.5%">
                   Name
               </TH>
               <TH nowrap valign="TOP" class="column-head-name" scope="col" width="1%">
                   Value
               </TH>
           </TR>

           
           

              

              <TR class="table-row">

                 

                      <TD nowrap valign="top"  class="collection-table-text" headers="selectCell">
                         <LABEL for='requiredDBProperties' title="This property corresponds to the database attribute, URL.  Specifies the URL of the database from which the datasource obtains connections, such as jdbc:oracle:thin:@localhost:1521:sample for thin driver and jdbc:oracle:oci8:@sample for thick driver.">
                            
                               <IMG src="../images/attend.gif" width="8" height="8" align="absmiddle" alt="Information required">
                            
                               URL
                            </LABEL>  
                      </TD>
           
                      <TD valign="top"  class="collection-table-text" headers="selectCell">
                           <input type="text" name="dataBasePropertyItem[0].value" size="30" value="jdbc:oracle:thin:@cscbikdcdbora12.cihs.gov.on.ca:15231:ucmdev" class="textEntryRequired" id="dataBasePropertyItem" title="Specifies the URL of the database from which the datasource obtains connections, such as jdbc:oracle:thin:@localhost:1521:sample for thin driver and jdbc:oracle:oci8:@sample for thick driver.">
                      </TD>
              </TR>
           
           

       </TABLE>
   </TD>


<!-- Special case scenerio for DB2UNIVERSAL -->
<SCRIPT type="text/javascript" language="JavaScript">
  

    function reloadJSP(){  
        var formNum=0;
        var done=false;
        while(!done) {
            try {
                var test = document.forms[formNum].dataBasePropertyItem[0];
                done=true;
            } catch (e) {
                formNum++;
            }
        }
        reload('dataSourceDetail.do?reloadTable=true&csrfid=-303026363', document.forms[formNum]);
    }

</SCRIPT>


                
            
                    
                    
                    
                    

                    
    
            
    

             
             
             </TR>
             

    
    
    
    
       
    </TABLE>
    </FIELDSET>
    </TD>
    </TR>
    
    
    
    
    

    <tr>
        <td class="navigation-button-section" nowrap VALIGN="top">
        
            

            <input type="submit" name="apply" value="Apply" class="buttons" id="navigation">
            
            
             
            
            <input type="submit" name="save" value="OK" class="buttons" id="navigation">
            
            
            
            
            
            <input type="reset" name="reset" value="Reset" class="buttons" id="navigation">
            
            
            
            
            
            
            <input type="submit" name="org.apache.struts.taglib.html.CANCEL" value="Cancel" class="buttons" id="navigation">
            
            
            
            
        </td>
    </tr>
    
    

    </tbody>
</table>
</form>
<script type="text/javascript" language="JavaScript">
  <!--
  var focusControl = document.forms["com.ibm.ws.console.resources.database.DataSourceDetailForm"].elements["name"];

  if (focusControl.type != "hidden") {
     focusControl.focus();
  }
  // -->
</script>

    
    
<br>



      </TD><TD VALIGN="top">


      











  






















<!-- gets all the link items which matches with the contextType and 
     compatibilty criteria using plugin registry API -->




             
             




  
         
        

         


        


                            <DIV id="additional.properties" class="main-category" style='margin-left:0.3em;'>
                            
                            Additional Properties
                            </DIV>
                            
                            <DIV id="child_additional.properties" class="main-category-container" style='margin-left:0.3em'>
							








        

							  <UL CLASS="main-child">
						                         
                        
                        
                        
                        
                        <LI CLASS="nav-bullet" TITLE="An optional set of connection pool settings.">
                        
                        
                        <a href="com.ibm.ws.console.resources.forwardCmd.do?forwardName=ConnectionPool.config.view&sfname=connectionPool&lastPage=DataSource.config.view&resourceUri=resources.xml&parentRefId=DataSource_1416535275480&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&perspective=tab.configuration" TITLE="An optional set of connection pool settings.">  
                        
                        Connection pool properties                        
						</a>
                        

                        </LI>

                     
                           
                        








        
                      
                        
                        
                        
                        
                        <LI CLASS="nav-bullet" TITLE="Use this page to set WebSphere(R) Application Server connection management-specific properties that affect a connection pool.">
                        
                        
                        <a href="com.ibm.ws.console.resources.database.forwardCmd.do?forwardName=RRAProperty.config.view&sfname=propertySet&lastPage=DataSource.config.view&resourceUri=resources.xml&parentRefId=DataSource_1416535275480&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&perspective=tab.configuration" TITLE="Use this page to set WebSphere(R) Application Server connection management-specific properties that affect a connection pool.">  
                        
                        WebSphere Application Server data source properties                        
						</a>
                        

                        </LI>

                     
                           
                        








        
                      
                        
                        
                        
                        
                        <LI CLASS="nav-bullet" TITLE="Properties that might be required for resource providers and resource factories. For example, most database vendors require additional custom properties for data sources that access the database.">
                        
                        
                        <a href="com.ibm.ws.console.resources.forwardCmd.do?forwardName=DataSourceProperty.ds.valueEditable.content.main&sfname=propertySet&resourceUri=resources.xml&parentRefId=DataSource_1416535275480&contextId=cells%3AOND4C01212175Node05Cell%3Anodes%3AOND4C01212175Node05%3Aservers%3Aserver1&perspective=tab.configuration" TITLE="Properties that might be required for resource providers and resource factories. For example, most database vendors require additional custom properties for data sources that access the database.">  
                        
                        Custom properties                        
						</a>
                        

                        </LI>

                     
                           
                        






        
</UL></DIV>        

        
        
        
 
        

      
    

      



























<!-- gets all the link items which matches with the contextType and 
     compatibilty criteria using plugin registry API -->







<BR>


      
    <DIV class="main-category" style="margin-left:.30em">
    Related Items
    </DIV>
    
    <DIV id="child_related.items" class="main-category-container" style='margin-left:0.3em'>
     <UL CLASS="main-child">



   
    
    

    
      <LI CLASS="nav-bullet" title="Specifies a list of user identities and passwords for Java(TM) 2 connector security to use.">
          
     <A HREF="com.ibm.ws.console.security.forwardCmd.do?forwardName=JAASAuthData.content.main"  title="Specifies a list of user identities and passwords for Java(TM) 2 connector security to use.">JAAS - J2C authentication data</A>
    </LI>
    
    
   
   
 
</UL></DIV> 

      
    

       </TD>        
 
</TR>   
</TABLE> 

</td> 
</tr>
</table>




<!-- Finishes table started in breadcrumb/title layouts  -->    
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
         top.CAWindowHandle = window.open('com.ibm.ws.console.core.commandassistance.forwardCmd.do?csrfid=-303026363&forwardName=console.commandassistance.main', windowName, 'resizable=yes,scrollbars=yes,width=700,height=350');
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

         

      <TD valign="top" WIDTH="20%" >

      <!--WSC Console Federation-->
     <div class="hpWidth">
     <div class="hpMinWidth">
     <div class="hpLayout">
     <div class="hpContainer">
      <DIV ID="wasHelpPortletPos" style="position:relative">
      <TABLE WIDTH="90%" CELLPADDING="0" CELLSPACING="0" BORDER="0" CLASS="wasPortlet">
      <TR>
      	
        <TH class="wpsPortletTitle">
        
        Help</TH>
      	
        <TH class="wpsPortletTitleControls">
        
        <A href="javascript:showHidePortlet('wasHelpPortlet')">
        <img id="wasHelpPortletImg" SRC="../images/title_minimize.gif" alt="Expand or collapse" border="0" align="texttop" tabindex="1"/>
        </A>
        </TH>
      </TR>


      <TBODY ID="wasHelpPortlet" style="display:table-row-group">
      <TR>
      	
      <TD CLASS="wpsPortletArea" COLSPAN="2" valign="top">
        


      <div class="helpSectionTitles">Field help</div>

      
      <DIV CLASS="table-text-help-portlet" ID="fieldHelpPortlet">
      
         For field help information, select a field label or list marker when the help cursor is displayed.
      </DIV>





      <div STYLE="margin-top:1.25em" class="helpSectionTitles">
           Page help</div>
      
      <DIV CLASS="table-text-help-portlet" id="pageHelpLink">
      

	   <a href="/ibm/help/index.jsp?topic=/com.ibm.ws.console.resources/udat_jdbcdatsordet.html" tabindex="100" target='WAS_help'>More information about this page</a>

      </DIV>



<script language="JavaScript">
  var helpProdVersion = "was-base-dist";
  var helpWASVersion = "pix";

  if (!top.helpProdVersion) {
       top.helpProdVersion = helpProdVersion;
  }

  if (!top.helpWASVersion) {
       top.helpWASVersion = helpWASVersion;
  }
</script>



      
      






      </TD>
      </TR>

      </TBODY>



      </TABLE>

      </DIV>
     </div>
     </div>
     </div>
     </div>


    </TD>

       


 

</TR>
</TABLE>

 </body>
 </html>
