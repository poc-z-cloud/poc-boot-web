<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="greateq.web.console.util.*"%>
<%@ page import="greateq.web.console.vo.MenuBar"%>
<%@ page import="greateq.web.console.vo.MenuItem"%>
<%@ page import="greateq.web.console.domain.AdminLogin"%>
<%@ page import="greateq.web.console.service.AuthenticationService"%>

<%
Connection cn=ConnPool.getInstance().getConnection();

AdminLogin adminLogin=(AdminLogin)session.getAttribute("adminLogin");
if (adminLogin==null){
    response.sendRedirect("logon.jsp");
}
AuthenticationService service = new AuthenticationService(cn);
List<MenuBar> menuBars = service.retrieveMenu(adminLogin.getSystemIds());

%>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- saved from url=(0041)https://localhost:9046/ibm/console/nsc.do -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Styles.css"
	rel="styleSheet" type="text/css">
<title>menu</title>


</head>



<body dir="ltr" onload="initAll();" class="navtree"
	style="background-color: #FFFFFF;" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0">
	<div dir="ltr">

		<script language="javascript">
		<!--
			var com_ibm_isclite_currentModuleRef = "";
			var com_ibm_isclite_currentPageRef = "";
			var com_ibm_isclite_currentNodeType = "";
			var com_ibm_isclite_currentNodeTitle = "";

			function setkookie(key, value) {
				var cokie = getwholekookie();
				if (cokie == null) {// first time
					document.cookie = "TE3=" + key + ":" + value + " ; path=/";
				} else {
					var start = cokie.indexOf(key + ":");
					if (start == -1) // not in list, so just append
					{
						document.cookie = "TE3=" + cokie + " " + key + ":"
								+ value + " ; path=/";
					} else { // replace
						var end = cokie.indexOf(" ", start);
						if (end == -1)
							end = cokie.length;
						document.cookie = "TE3="
								+ cokie.substring(0, start - 1) + " " + key
								+ ":" + value + " "
								+ cokie.substring(end + 1, cokie.length)
								+ " ; path=/";
					}

				}
			}

			function getwholekookie() {
				var len = 4; // TE3=
				var start = document.cookie.indexOf("TE3=");
				if (start == -1) {
					return null;
				}
				var end = document.cookie.indexOf(";", start);
				if (end == -1)
					end = document.cookie.length;
				// this should return N1=E N2=C ....
				return unescape(document.cookie.substring(start + len, end));
			}

			function getkookie(key) {
				var cookiestr = getwholekookie();
				if (cookiestr == null)
					return null;

				var start = cookiestr.indexOf(key + ":"); // start of the key
				if (start == -1)
					return null; // never found <key>
				var value = start + key.length + 1; //begin of the value
				var end = cookiestr.indexOf(" ", value); //end of the value
				if (end == -1)
					end = cookiestr.length;
				return cookiestr.substring(value, end);
			}

			var dgeid = document.getElementById;
			function expandCollapse(n) {
				N = new String("N");
				I = new String("I");
				a = N.concat(n);
				g = I.concat(n);

				if (!dgeid)
					return;
				if (document.getElementById(a).style.display == 'none') {
					document.getElementById(a).style.display = 'block';
					document.getElementById(g).src = 'images/arrow_expanded.gif';
					document.getElementById(g).title = 'Collapse';
					document.getElementById(g).alt = 'Collapse';
					setkookie(a, "E");
				} else {
					document.getElementById(a).style.display = 'none';
					document.getElementById(g).src = 'images/arrow_collapsed.gif';
					document.getElementById(g).title = 'Expand';
					document.getElementById(g).alt = 'Expand';
					setkookie(a, "C");
				}
			}

			function Collapse(n) {
				N = new String("N");
				I = new String("I");
				a = N.concat(n);
				g = I.concat(n);

				document.getElementById(a).style.display = 'none';
				document.getElementById(g).src = 'images/arrow_collapsed.gif';
				document.getElementById(g).title = 'Expand';
				document.getElementById(g).alt = 'Expand';
				setkookie(a, "C");
			}

			function Expand(n) {
				N = new String("N");
				I = new String("I");
				a = N.concat(n);
				g = I.concat(n);

				document.getElementById(a).style.display = 'block';
				document.getElementById(g).src = 'images/arrow_expanded.gif';
				document.getElementById(g).title = 'Collapse';
				document.getElementById(g).alt = 'Collapse';
				setkookie(a, "E");
			}

			function initAll() {
				base = new String("N");
				for (i = 0; document.getElementById(base.concat(i)); i++) {
					if (getkookie(base.concat(i)) == "E")
						Expand(i);
					else
						Collapse(i);
				}
			}

			function CollapseAll() {
				base = new String("N");
				for (i = 0; document.getElementById(base.concat(i)); i++)
					Collapse(i);
			}

			function ExpandAll() {
				base = new String("N");
				for (i = 0; document.getElementById(base.concat(i)); i++)
					Expand(i);
			}

			function determineAction(e) {
				if (document.layers) {
					document.captureEvents(Event.KEYPRESS);
					document.captureEvents(Event.onClick);
				}

				document.onkeypress = function(evt) {
					var key = document.all ? event.keyCode
							: evt.which ? evt.which : evt.keyCode;

					if (key == 13)
						document.navFilter.submit();
				};

				document.onclick = function(evt) {
					document.navFilter.submit();
				};
			}

			//3365 show/hide navTree

			// end 3365 show/hide navTree
		// -->
		</script>





		<div class="navBody" style="background-color: #FFFFFF;">
			<table height="26" width="100%" cellspacing="0" cellpadding="0"
				style="background-color: #FFFFFF;">
				<tbody>
					<tr>
						<td align="left" colspan="2" class="navtree"
							style="background-color: #FFFFFF">

							<ul class="nav-child" dir="ltr">
								<li class="navigation-bullet"><a
									style="text-decoration: none" dir="ltr"
									href="welcome.jsp"
									target="detail" title="Welcome">Welcome </a><%=adminLogin.getUser().getFullName() %></li>
							</ul>
							<div nowrap="" class="main-task" style="margin-left: 0.3em;">
								<a style="color: #000000; text-decoration: none;"
									href="javascript:expandCollapse(&#39;0&#39;);"
									title="Guided Activities"><img
									src="images/arrow_collapsed.gif"
									title="Expand" alt="Expand" id="I0" border="0"
									align="absmiddle">Console Static</a>
							</div>
							<div class="nav-child-container"
								style="margin-left: 0.3em; display: none;" id="N0">
								<ul class="nav-child" dir="ltr">
									<li class="navigation-bullet"><a
										style="text-decoration: none" dir="ltr"
										href="auth/role/list.jsp"
										target="detail" title="Connecting to a database">Role Management</a></li>
								</ul>
								<ul class="nav-child" dir="ltr">
									<li class="navigation-bullet"><a
										style="text-decoration: none" dir="ltr"
										href="auth/user/list.jsp"
										target="detail"
										title="User Management">User Management</a></li>
								</ul>
								<ul class="nav-child" dir="ltr">
									<li class="navigation-bullet"><a
										style="text-decoration: none" dir="ltr"
										href="auth/system/list.jsp"
										target="detail"
										title="System Management">System Management</a></li>
								</ul>
								<ul class="nav-child" dir="ltr">
									<li class="navigation-bullet"><a
										style="text-decoration: none" dir="ltr"
										href="auth/systemCategory/list.jsp"
										target="detail"
										title="System Category Management">System Category Management</a></li>
								</ul>
							</div>

<!-- dynamic menu begin -->
<% for (int i=0;i<menuBars.size();i++) {
	MenuBar menuBar=menuBars.get(i);
%>
							<div nowrap="" class="main-task" style="margin-left: 0.3em;">
								<a style="color: #000000; text-decoration: none;"
									href="javascript:expandCollapse('<%= menuBar.getId()%>');"
									title=<%= menuBar.getDescription()%>><img
									src="images/arrow_collapsed.gif"
									title="Expand" alt="Expand" id="I<%= menuBar.getId()%>" border="0"
									align="absmiddle"><%= menuBar.getName()%></a>
							</div>
							<div class="nav-child-container" style="margin-left: 0.3em; display: none;" id="N<%= menuBar.getId()%>">
				<% 
				List<MenuItem> menuItems = menuBar.getSortedItems();
				for (int j=0;j<menuItems.size();j++) {
					MenuItem menuItem= menuItems.get(j);
				%>						
							
								<ul class="nav-child" dir="ltr">
									<li class="navigation-bullet"><a
										style="text-decoration: none" dir="ltr"
										href="<%=request.getContextPath()+menuItem.getUrl() %>"
										target="detail" title="<%=menuItem.getDescription() %>"><%=menuItem.getName() %></a></li>
								</ul>
				<%}%>								
							</div>
<%}%>
<!-- dynamic menu end -->

							<div nowrap="" class="main-task" style="margin-left: 0.3em;">
								<a style="color: #000000; text-decoration: none;"
									href="javascript:expandCollapse(&#39;5&#39;);" title="Services"><img
									src="images/arrow_collapsed.gif"
									title="Expand" alt="Expand" id="I5" border="0"
									align="absmiddle">Services</a>
							</div>
							<div class="nav-child-container"
								style="margin-left: 0.3em; display: none;" id="N5">
								<ul class="nav-child" dir="ltr">
									<li class="navigation-bullet"><a
										style="text-decoration: none" dir="ltr"
										href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=WebservicesAdmin.content.main&amp;wsadminAppCollection=false&amp;attachmentType=application&amp;WSC=true"
										target="detail" title="Service providers">Service
											providers</a></li>
								</ul>
								<ul class="nav-child" dir="ltr">
									<li class="navigation-bullet"><a
										style="text-decoration: none" dir="ltr"
										href="datasource/list.jsp"
										target="detail" title="Data sources">Data sources</a></li>
								</ul>
								<div nowrap="" class="sub-task">
									<a style="color: #000000; text-decoration: none;"
										href="javascript:expandCollapse(&#39;6&#39;);"
										title="Policy sets"><img
										src="images/arrow_collapsed.gif"
										title="Expand" alt="Expand" align="absmiddle" id="I6"
										border="0">Policy sets</a>
								</div>
								<div class="sub-child-container" style="display: none;" id="N6">
									<ul class="nav-child" dir="ltr">
										<li class="navigation-bullet"><a
											style="text-decoration: none" dir="ltr"
											href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=PolicySet.content.main&amp;WSC=true"
											target="detail" title="Application policy sets">Application
												policy sets</a></li>
									</ul>
									<ul class="nav-child" dir="ltr">
										<li class="navigation-bullet"><a
											style="text-decoration: none" dir="ltr"
											href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=SystemPolicySet.content.main&amp;type=system/trust&amp;WSC=true"
											target="detail" title="System policy sets">System policy
												sets</a></li>
									</ul>
									<ul class="nav-child" dir="ltr">
										<li class="navigation-bullet"><a
											style="text-decoration: none" dir="ltr"
											href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=CellDefaultBindings.config.view&amp;WSC=true"
											target="detail" title="Default policy set bindings">Default
												policy set bindings</a></li>
									</ul>
									<ul class="nav-child" dir="ltr">
										<li class="navigation-bullet"><a
											style="text-decoration: none" dir="ltr"
											href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=ProviderBinding.content.main&amp;WSC=true"
											target="detail" title="General provider policy set bindings">General
												provider policy set bindings</a></li>
									</ul>
									<ul class="nav-child" dir="ltr">
										<li class="navigation-bullet"><a
											style="text-decoration: none" dir="ltr"
											href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=ClientBinding.content.main&amp;WSC=true"
											target="detail" title="General client policy set bindings">General
												client policy set bindings</a></li>
									</ul>
								</div>
								<div nowrap="" class="sub-task">
									<a style="color: #000000; text-decoration: none;"
										href="javascript:expandCollapse(&#39;7&#39;);"
										title="Trust service"><img
										src="images/arrow_collapsed.gif"
										title="Expand" alt="Expand" align="absmiddle" id="I7"
										border="0">Trust service</a>
								</div>
								<div class="sub-child-container" style="display: none;" id="N7">
									<ul class="nav-child" dir="ltr">
										<li class="navigation-bullet"><a
											style="text-decoration: none" dir="ltr"
											href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=WSSupportedTokenTypes.content.main&amp;WSC=true"
											target="detail" title="Token providers">Token providers</a></li>
									</ul>
									<ul class="nav-child" dir="ltr">
										<li class="navigation-bullet"><a
											style="text-decoration: none" dir="ltr"
											href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=STSTargets.content.main&amp;attachmentType=system/trust&amp;WSC=true"
											target="detail" title="Targets">Targets</a></li>
									</ul>
									<ul class="nav-child" dir="ltr">
										<li class="navigation-bullet"><a
											style="text-decoration: none" dir="ltr"
											href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=TrustServiceAttachment.content.main&amp;attachmentType=system/trust&amp;WSC=true"
											target="detail" title="Trust service attachments">Trust
												service attachments</a></li>
									</ul>
								</div>
								<ul class="nav-child" dir="ltr">
									<li class="navigation-bullet"><a
										style="text-decoration: none" dir="ltr"
										href="https://localhost:9046/ibm/console/navigatorCmd.do?forwardName=SCClientCache.config.view&amp;WSC=true"
										target="detail" title="Security cache">Security cache</a></li>
								</ul>
								<ul class="nav-child" dir="ltr">
									<li class="navigation-bullet"><a
										style="text-decoration: none" dir="ltr"
										href="https://localhost:9046/ibm/console/com.ibm.ws.console.rm.forwardCmd.do?forwardName=WSRMState.config.view&amp;WSC=true"
										target="detail" title="Reliable messaging state">Reliable
											messaging state</a></li>
								</ul>
							</div>


						</td>
					</tr>
				</tbody>
			</table>
		</div>












	</div>



</body>
</html>
<%cn.close();%>