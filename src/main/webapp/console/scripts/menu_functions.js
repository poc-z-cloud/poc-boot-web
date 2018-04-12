
//Licensed Materials - Property of IBM
//
//5724-I63, 5724-H88, 5724-H89, 5655-N02, 5724-J08
// 
//Copyright IBM Corp. 2005, 2007 All Rights Reserved.
//
//US Government Users Restricted Rights - Use, duplication or
//disclosure restricted by GSA ADP Schedule Contract with
//IBM Corp.
	
var enableDisableArray=new Array();
var currentField="";
var cellwide=false;
var scrollHeight;
var isNav4=false;
var isIE=false;
var isDom=false;
document.onclick=setTopVarOff;
document.onmouseover=whatObjectOn;
document.onmouseout=whatObjectOff;
document.onmouseup=setTopVarOff;
window.onload=assignTabIndex;
window.onscroll=floatHelpPortlet;
window.onresize=doResize;
try{
pleaseWait=pleaseWait;
}
catch(e){
pleaseWait=top.pleaseWait;
}
var foropera=window.navigator.userAgent.toLowerCase();
var itsopera=foropera.indexOf("opera",0)+1;
var itsgecko=foropera.indexOf("gecko",0)+1;
var itsmozillacompat=foropera.indexOf("mozilla",0)+1;
var itsmsie=foropera.indexOf("msie",0)+1;
if(itsopera>0){
isNav4=true;
}
if(itsmozillacompat>0){
if(itsgecko>0){
isIE=true;
isDom=true;
document.all=document.getElementsByTagName("*");
}else{
if(itsmsie>0){
isIE=true;
}else{
if(parseInt(navigator.appVersion)<5){
isNav4=true;
}else{
isIE=true;
}
}
}
}
if(isDom){
showIt="table-row-group";
}else{
showIt="inline";
}
var com_ibm_ws_inlineMessages="inline";
var com_ibm_ws_scopeTable="none";
var com_ibm_ws_prefsTable="none";
var com_ibm_ca_prefsTable="none";
function arrayContains(_1e8,_1e9){
len=_1e8.length;
for(i=0;i<len;i++){
if(_1e8[i]==_1e9){
return true;
}
}
return false;
}
function setTopVarOn(e){
top.isloaded=0;
if(isNav4){
routeEvent(e);
}
}
function doResize(e){
var _1ec=scrollHeight;
scrollHeight=document.body.scrollHeight;
if(document.body.scrollHeight<_1ec){
floatHelpPortlet(e);
}
}
function setTopVarOff(e){
top.isloaded=1;
showAlt(e);
}
function showPleaseWaitButton(){
document.all["progress"].style.top=200+document.body.scrollTop+"px";
document.all["progress"].style.left=200+document.body.scrollLeft+"px";
document.all["progress"].style.display="block";
}
function whatObjectOn(e){
if(isDom){
obj=e.target;
}else{
e=event;
obj=e.srcElement;
}
if(obj!=null){
if((obj.tagName=="LI")&&(obj.className=="nav-bullet")&&(document.getElementById("fieldHelpPortlet")!=null)){
obj.style.cursor="help";
}else{
if((obj.parentNode.parentNode!=null)&&(obj.parentNode.parentNode.tagName=="LI")&&(obj.tagName=="A")&&(document.getElementById("fieldHelpPortlet")!=null)){
obj.parentNode.style.cursor="help";
}else{
if(((obj.tagName=="LABEL")||(obj.tagName=="LEGEND"))&&(document.getElementById("fieldHelpPortlet")!=null)){
if((obj.getAttribute("TITLE"))||(obj.getAttribute("DESC"))||(obj.getAttribute("title"))||(obj.getAttribute("desc"))){
if(obj.getAttribute("TITLE").indexOf(selectText+":")<0){
obj.style.cursor="help";
}
}
}
}
}
}
}
function whatObjectOff(e){
if(isDom){
obj=e.target;
}else{
e=event;
obj=e.srcElement;
}
if(obj!=null){
if((obj.tagName=="LI")&&(obj.className=="nav-bullet")){
obj.style.color="#BCBCBC";
}
}
}
var ProgressImage=new Image();
ProgressImage.src="../images/appInstall_animated.gif";
document.write("<div id='progress' style=\"position:absolute;display:none;top:200;left:200;border: 1px black solid;padding:3px 3px 3px 3px;background-color:#FFFFFF;font-family: sans-serif;font-size: 80%;z-index:2\"><NOBR><img src='../images/appInstall_animated.gif' align='texttop' alt='"+pleaseWait+"'>"+pleaseWait+"</NOBR></div>");
function floatHelpPortlet(e){
var _1f1=document.getElementById("wasHelpPortletPos");
var _1f2;
if(_1f1!=null){
var _1f3=_1f1.scrollHeight;
if(isDom){
_1f2=parseInt(_1f1.style.top);
if(_1f2!=document.body.scrollTop){
_1f1.style.visibility="hidden";
}
if(isNaN(_1f2)){
_1f2=0;
}
if((_1f3+document.body.scrollTop+federationAdder)<scrollHeight){
_1f1.style.top=document.body.scrollTop+federationAdder;
}
if(document.body.scrollTop>20){
_1f1.style.position="relative";
}
setTimeout("document.getElementById(\"wasHelpPortletPos\").style.visibility = \"visible\"",750);
}else{
_1f2=_1f1.style.pixelTop;
if(_1f2!=document.body.scrollTop){
_1f1.style.visibility="hidden";
}
if((_1f3+document.body.scrollTop+federationAdder)<scrollHeight){
_1f1.style.pixelTop=document.body.scrollTop+federationAdder;
}
setTimeout("document.getElementById(\"wasHelpPortletPos\").style.visibility = \"visible\"",750);
}
}
}
function appInstallWaitShow(){
if(isDom){
document.all["progress"].style.display="block";
}else{
if(isNav4){
document.layers["progress"].visibility="show";
}else{
document.all["progress"].style.display="block";
}
}
}
function appInstallWaitHide(){
if(isDom){
document.all["progress"].style.display="none";
}else{
if(isNav4){
document.layers["progress"].visibility="hide";
}else{
document.all["progress"].style.display="none";
}
}
}
function findPageHelpLink(_1f4){
linkLength=document.links.length;
fallout=true;
for(t=0;t<linkLength;t++){
if(document.links[t].getAttribute("target")=="WAS_help"){
document.write("<a href=\""+document.links[t].getAttribute("href")+"\" target=\"WAS_help\">");
document.write(_1f4);
document.write("</a>");
fallout=false;
break;
}
}
if(fallout){
document.write(statusUnavailable);
}
}
function findTaskHelpLink(_1f5,_1f6){
if(document.getElementById("taskHelpDiv")!=null){
if(document.getElementById("taskHelpDivImg").src.indexOf("collapsed")>-1){
document.getElementById("taskHelpDiv").style.display=showIt;
if(document.getElementById("taskHelpDivImg")){
document.getElementById("taskHelpDivImg").src="../images/arrow_expanded.gif";
}
document.getElementById("taskHelpDiv").style.height="200";
document.getElementById("taskHelpIFrame").height="100%";
state="inline";
}else{
document.getElementById("taskHelpDiv").style.display="none";
if(document.getElementById("taskHelpDivImg")){
document.getElementById("taskHelpDivImg").src="../images/arrow_collapsed.gif";
}
document.getElementById("taskHelpDiv").style.height="50";
document.getElementById("taskHelpIFrame").height="1%";
state="none";
}
}
}
function findtheLabel(_1f7){
var _1f8=false;
if((_1f7.parentNode.getAttribute("TITLE"))||(_1f7.parentNode.getAttribute("DESC"))){
_1f7=_1f7.parentNode;
}else{
if(_1f7.parentNode.childNodes){
if(_1f7.parentNode.childNodes.length>1){
for(q=0;q<_1f7.parentNode.childNodes.length;q++){
if(_1f7.parentNode.childNodes[q].tagName=="LABEL"){
_1f7=_1f7.parentNode.childNodes[q];
_1f8=true;
break;
}
}
}
}
}
if(!_1f8){
var _1f9=document.getElementsByTagName("label");
var _1fa=_1f7.getAttribute("id");
var _1fb=_1f7.getAttribute("name");
for(i=0;i<_1f9.length;++i){
var _1fc=_1f9[i].getAttribute("for");
if(_1fc!=null){
if(_1fa!=null){
try{
if(_1fc.equals(_1fa)){
return _1f9[i];
}
}
catch(ex){
if(_1fc==_1fa){
return _1f9[i];
}
}
}
if(_1fb!=null){
try{
if(_1fc.equals(_1fb)){
return _1f9[i];
}
}
catch(ex){
if(_1fc==_1fb){
return _1f9[i];
}
}
}
}
}
}
return _1f7;
}
var titleText="";
var setTitleText="no";
function showAlt(e){
var oT,oL,thisWin,thisWinscroll,visibleWin=0;
var obj="";
if(isDom){
oT=e.clientY+document.body.scrollTop;
oL=e.clientX;
obj=e.target;
thisWin=document.body.clientHeight;
thisWinscroll=document.body.scrollTop;
visibleWin=thisWinscroll+thisWin;
}else{
e=event;
oT=e.clientY+document.body.scrollTop;
oL=e.clientX;
obj=e.srcElement;
thisWin=document.body.clientHeight;
thisWinscroll=document.body.scrollTop;
visibleWin=thisWinscroll+thisWin;
}
oT=oT+thisWinscroll;
labelList=document.getElementsByTagName("LABEL");
for(q=0;q<labelList.length;q++){
if(labelList[q].getAttribute("htmlFor")!=null&&labelList[q].getAttribute("htmlFor")!=""){
if(labelList[q].getAttribute("htmlFor")==obj.id){
obj=labelList[q];
break;
}
}
}
specSlashRE=/(\/)/g;
specColonRE=/:/g;
specUnderRE=/_/g;
if((obj.tagName!="IMG")&&(obj.name!="selectedObjectIds")&&(!isDom||!(obj instanceof XULElement))){
try{
if((obj.getAttribute("TITLE"))||(obj.getAttribute("DESC"))||(obj.getAttribute("title"))||(obj.getAttribute("desc"))){
if(obj.getAttribute("TITLE").indexOf(selectText+":")<0){
writeOutHelpPortlet(obj);
}
}else{
obj=findtheLabel(obj);
writeOutHelpPortlet(obj);
}
}
catch(err){
return;
}
}
if((obj.name=="reset")&&(e.type!="focus")){
for(u=0;u<enableDisableArray.length;u++){
enableDisable(enableDisableArray[u],"reset");
}
obj.click();
}
}
function writeOutHelpPortlet(obj){
try{
if(obj.id==""&&obj.tagName=="A"){
return;
}
if((obj.getAttribute("TITLE"))||(obj.getAttribute("DESC"))){
titleText=obj.getAttribute("TITLE");
addPageText=" "+lookInPageHelp;
if(titleText==""){
titleText=obj.getAttribute("DESC");
}else{
obj.setAttribute("DESC",titleText);
}
scriptLabel=document.createTextNode(titleText);
if(document.getElementById("fieldHelpPortlet")!=null){
document.getElementById("fieldHelpPortlet").innerHTML="";
document.getElementById("fieldHelpPortlet").appendChild(scriptLabel);
document.getElementById("fieldHelpPortlet").parentNode.parentNode.parentNode.width="20%";
if(!isDom){
if(document.getElementById("fieldHelpPortlet").offsetHeight>=200){
document.getElementById("fieldHelpPortlet").style.height=200;
}else{
document.getElementById("fieldHelpPortlet").style.height="";
}
}else{
document.getElementById("fieldHelpPortlet").style.display="none";
document.getElementById("fieldHelpPortlet").style.display="block";
}
floatHelpPortlet();
}
}else{
if((obj.getAttribute("title"))||(obj.getAttribute("desc"))){
titleText=obj.getAttribute("title");
addPageText=" "+lookInPageHelp;
if(titleText==""){
titleText=obj.getAttribute("desc");
}else{
obj.setAttribute("desc",titleText);
}
scriptLabel=document.createTextNode(titleText);
if(document.getElementById("fieldHelpPortlet")!=null){
document.getElementById("fieldHelpPortlet").innerHTML="";
document.getElementById("fieldHelpPortlet").appendChild(scriptLabel);
document.getElementById("fieldHelpPortlet").parentNode.parentNode.parentNode.width="20%";
if(!isDom){
document.getElementById("fieldHelpPortlet").style.height="";
if(document.getElementById("fieldHelpPortlet").offsetHeight>=200){
document.getElementById("fieldHelpPortlet").style.height=200;
}
}else{
document.getElementById("fieldHelpPortlet").style.display="none";
document.getElementById("fieldHelpPortlet").style.display="block";
}
floatHelpPortlet();
}
}else{
secondParId=obj.parentNode.parentNode.id;
thirdParId=obj.parentNode.parentNode.parentNode.id;
if((obj.id!="fieldHelpPortlet")&&(secondParId!="wasHelpPortlet")&&(thirdParId!="wasHelpPortlet")){
if(!noInfoAvailable){
titleText="No information available";
}else{
titleText=noInfoAvailable;
}
titleText=noInfoAvailable;
scriptLabel=document.createTextNode(titleText);
if(document.getElementById("fieldHelpPortlet")!=null){
document.getElementById("fieldHelpPortlet").innerHTML="";
document.getElementById("fieldHelpPortlet").innerHTML=titleText;
document.getElementById("fieldHelpPortlet").parentNode.parentNode.parentNode.width="20%";
if(!isDom){
document.getElementById("fieldHelpPortlet").style.height="";
}
}
floatHelpPortlet();
}
}
}
titleText="";
}
catch(err){
return;
}
}
function changeObjectVisibility(_201){
document.getElementById(_201).style.visibility="visible";
}
function hideAlt(e){
var o,oT,oL,obj="";
if(isIE){
if(isDom){
obj=e.target;
}else{
e=event;
obj=e.srcElement;
}
}
if(isDom){
document.all["bubbleHelp"].style.visibility="hidden";
return false;
}
}
function assignTabIndex(){
scrollHeight=document.body.scrollHeight;
if(isIE){
var _204=document.forms.length;
var _205,elIndex;
document.body.tabIndex=1;
for(_205=0;_205<_204;_205++){
elIndex=document.forms[_205].length;
for(elmIndex=0;elmIndex<elIndex;elmIndex++){
document.forms[_205].elements[elmIndex].onfocus=showAlt;
}
}
var _206=document.links.length;
for(_205=0;_205<_206;_205++){
if(((document.links[_205].parentNode.tagName=="TH")||(document.links[_205].parentNode.tagName=="TD"))&&(document.links[_205].target!="WAS_help")){
document.links[_205].tabIndex=1;
}
}
var _207=document.getElementsByTagName("P");
var _208=_207.length;
for(pIndex=0;pIndex<_208;pIndex++){
if(_207[pIndex].className=="readOnlyElement"){
content=_207[pIndex].firstChild.nodeValue;
aLen=content.length;
if(content.length<10){
_207[pIndex].style.width="25%";
}else{
if(content.length<35){
_207[pIndex].style.width="50%";
}else{
if(content.length<55){
_207[pIndex].style.width="75%";
}
}
}
_207[pIndex].tabIndex=1;
}
}
var _209=document.images;
var _20a=_209.length;
for(iIndex=0;iIndex<_20a;iIndex++){
if(!_209[iIndex].alt){
_209[iIndex].alt="";
}else{
if(!_209[iIndex].title){
_209[iIndex].title=_209[iIndex].alt;
}
}
}
determinePortletPrefs("com_ibm_ws_inlineMessages");
var _20b=document.getElementsByTagName("DIV");
var _20c=_20b.length;
for(dIndex=0;dIndex<_20c;dIndex++){
if(_20b[dIndex].className=="main-category"){
if(_20b[dIndex].offsetWidth<100){
_20b[dIndex].style.width="100px";
}
break;
}
}
}
runtimeMessageLookup();
}
function runtimeMessageLookup(){
if(document.getElementById("messageName")!=null){
try{
TmpMsg=document.getElementById("messageName").innerHTML;
var _20d=TmpMsg.match("(([A-Z][A-Z][A-Z][A-Z])[0-9][0-9][0-9][0-9][I|W|E])(:)");
var _20e=TmpMsg.match("(([A-Z][A-Z][A-Z][A-Z][A-Z])[0-9][0-9][0-9][0-9][I|W|E])(:)");
if(_20e!=null){
searchText="<a target='support' href='http://www-1.ibm.com/support/search.wss?rs=180&tc=SSEQTP&q="+_20e[1]+"%20OR%20"+_20e[2]+"*'>"+_20e[0]+"</a>";
rege=new RegExp(_20e[0]);
str=TmpMsg.replace(rege,searchText);
document.getElementById("messageName").innerHTML=str;
}else{
if(_20d!=null){
searchText="<a target='support' href='http://www-1.ibm.com/support/search.wss?rs=180&tc=SSEQTP&q="+_20d[1]+"%20OR%20"+_20d[2]+"'>"+_20d[0]+"</a>";
rege=new RegExp(_20d[0]);
str=TmpMsg.replace(rege,searchText);
document.getElementById("messageName").innerHTML=str;
}
}
}
catch(e){
}
}
}
function resizeInputField(el,_210){
if(_210=="up"){
el.style.width="90%";
}else{
el.size="30";
}
}
function determinePortletPrefs(_211){
if(document.getElementById(_211)!=null){
if(_211=="com_ibm_ws_inlineMessages"){
uriState="secure/javascriptToSession.jsp?req=get&sessionVariable=com_ibm_ws_inlineMessages";
setState=doXmlHttpRequest(uriState);
js_state=setState.substring(0,setState.indexOf("+endTransmission"));
}
if(js_state=="none"){
document.getElementById(_211).style.display="none";
if(document.getElementById(_211+"Img")){
document.getElementById(_211+"Img").src="../images/arrow_collapsed.gif";
}
}else{
document.getElementById(_211).style.display=showIt;
if(document.getElementById(_211+"Img")){
document.getElementById(_211+"Img").src="../images/arrow_expanded.gif";
}
}
if(_211=="com_ibm_ws_inlineMessages"){
numErr=document.getElementById(_211).innerHTML.split("Error.gif").length-1;
if(numErr>0){
js_state="inline";
document.getElementById(_211).style.display=showIt;
if(document.getElementById(_211+"Img")){
document.getElementById(_211+"Img").src="../images/arrow_expanded.gif";
}
}
if(js_state=="none"){
theMess=document.getElementById(_211).innerHTML;
numE=0;
numW=0;
numI=0;
Es=theMess.match(/Error.gif/g);
if(Es!=null){
numE=Es.length;
}
Ws=theMess.match(/Warning.gif/g);
if(Ws!=null){
numW=Ws.length;
}
Is=theMess.match(/Information.gif/g);
if(Is!=null){
numI=Is.length;
}
createSummary(numE,numW,numI,_211);
}else{
removeSummary();
}
}
}
}
function showHideSection(_212){
if(document.getElementById(_212)!=null){
var _213="none";
if(document.getElementById(_212).style.display=="none"){
document.getElementById(_212).style.display=showIt;
if(document.getElementById(_212+"Img")){
document.getElementById(_212+"Img").src="../images/arrow_expanded.gif";
}
_213="inline";
}else{
document.getElementById(_212).style.display="none";
if(document.getElementById(_212+"Img")){
document.getElementById(_212+"Img").src="../images/arrow_collapsed.gif";
}
_213="none";
}
if(_212=="com_ibm_ws_scopeTable"){
uriState="secure/javascriptToSession.jsp?req=set&sessionVariable=com_ibm_ws_scopeTable&variableValue="+_213;
setState=doXmlHttpRequest(uriState);
setState=setState.substring(0,setState.indexOf("+endTransmission"));
}else{
uriState="secure/javascriptToSession.jsp?req=set&sessionVariable="+_212+"&variableValue="+_213;
setState=doXmlHttpRequest(uriState);
setState=setState.substring(0,setState.indexOf("+endTransmission"));
}
if(_212=="com_ibm_ws_inlineMessages"){
if(_213=="none"){
theMess=document.getElementById(_212).innerHTML;
numE=0;
numW=0;
numI=0;
Es=theMess.match(/Error.gif/g);
if(Es!=null){
numE=Es.length;
}
Ws=theMess.match(/Warning.gif/g);
if(Ws!=null){
numW=Ws.length;
}
Is=theMess.match(/Information.gif/g);
if(Is!=null){
numI=Is.length;
}
createSummary(numE,numW,numI,_212);
}else{
removeSummary();
}
}
}
}
function showHidePreferences(_214,_215,_216){
if(document.getElementById(_214)!=null){
var _217="none";
if(document.getElementById(_214).style.display=="none"){
document.getElementById(_214).style.display=showIt;
if(document.getElementById(_214+"Img")){
document.getElementById(_214+"Img").src="../images/arrow_expanded.gif";
document.getElementById(_214+"Img").alt=_216;
document.getElementById(_214+"Img").title=_216;
}
_217="inline";
}else{
document.getElementById(_214).style.display="none";
if(document.getElementById(_214+"Img")){
document.getElementById(_214+"Img").src="../images/arrow_collapsed.gif";
document.getElementById(_214+"Img").alt=_215;
document.getElementById(_214+"Img").title=_215;
}
_217="none";
}
uriState="secure/javascriptToSession.jsp?req=set&sessionVariable="+_214+"&variableValue="+_217;
setState=doXmlHttpRequest(uriState);
setState=setState.substring(0,setState.indexOf("+endTransmission"));
}
}
function showHideNavigation(item){
taskSet=document.getElementById("child_"+item);
taskImg=document.getElementById("img_"+item);
if(taskSet.style.display=="block"){
taskSet.style.display="none";
taskImg.src="../images/arrow_collapsed.gif";
}else{
taskSet.style.display="block";
taskImg.src="../images/arrow_expanded.gif";
}
}
function showHideChanges(){
if(document.getElementById("changesTableImg").src.indexOf("arrow_collapsed")>0){
document.getElementById("changesTableImg").src="../images/arrow_expanded.gif";
document.getElementById("changesTable").style.display=showIt;
}else{
document.getElementById("changesTableImg").src="../images/arrow_collapsed.gif";
document.getElementById("changesTable").style.display="none";
}
}
function createSummary(numE,numW,numI,_21c){
myMessagespan=document.createElement("SPAN");
myMessagespan.setAttribute("id","com_ibm_ws_MessageBox");
myMessagespan.setAttribute("style","padding-left: 2em");
myPad1=document.createTextNode("      ");
myPad2=document.createTextNode("      ");
myPad3=document.createTextNode("      ");
targ=document.getElementById(_21c).parentNode;
targ2=targ.getElementsByTagName("TD")[0];
targ2.appendChild(myPad1);
targ2.appendChild(myMessagespan);
if(numE>0){
myImgE=document.createElement("IMG");
myImgE.setAttribute("src","../images/Error.gif");
myImgE.setAttribute("border","0");
myImgE.setAttribute("align","absmiddle");
myImgE.setAttribute("alt","Error messages");
myImgE.setAttribute("style","margin-left:2em");
numtxtE=document.createTextNode(": "+numE);
myMessagespan.appendChild(myImgE);
myMessagespan.appendChild(numtxtE);
myMessagespan.appendChild(myPad2);
}
if(numW>0){
myImgW=document.createElement("IMG");
myImgW.setAttribute("src","../images/Warning.gif");
myImgW.setAttribute("border","0");
myImgW.setAttribute("align","absmiddle");
myImgW.setAttribute("alt","Warning messages");
myImgW.setAttribute("style","margin-left:2em");
numtxtW=document.createTextNode(": "+numW);
myMessagespan.appendChild(myImgW);
myMessagespan.appendChild(numtxtW);
myMessagespan.appendChild(myPad3);
}
if(numI>0){
myImgI=document.createElement("IMG");
myImgI.setAttribute("src","../images/Information.gif");
myImgI.setAttribute("border","0");
myImgI.setAttribute("align","absmiddle");
myImgI.setAttribute("alt","Information messages");
myImgI.setAttribute("style","margin-left:2em");
numtxtI=document.createTextNode(": "+numI);
myMessagespan.appendChild(myImgI);
myMessagespan.appendChild(numtxtI);
}
}
function removeSummary(_21d){
var _21e=document.getElementById("com_ibm_ws_MessageBox");
if(_21e!=null){
var _21f=_21e.parentNode;
_21f.removeChild(_21e);
}
}
function inspect(elm){
var str="";
for(var i in elm){
str+=i+": "+elm.getAttribute(i)+"\t";
}
alert(str);
}
function showHidePortlet(_223){
if(document.getElementById(_223)!=null){
var _224;
if(document.getElementById(_223).style.display=="none"){
if(document.getElementById(_223+"Img")){
if(_223=="wasHelpPortlet"&&federationAdder=="10"){
document.getElementById(_223+"Img").src="../images/IRU_title_minimize.gif";
}else{
document.getElementById(_223+"Img").src=minimizeImage;
}
}
document.getElementById(_223).style.display=showIt;
_224=showIt;
}else{
if(document.getElementById(_223+"Img")){
if(_223=="wasHelpPortlet"&&federationAdder=="10"){
document.getElementById(_223+"Img").src="../images/IRU_title_restore.gif";
}else{
document.getElementById(_223+"Img").src=maximizeImage;
}
}
document.getElementById(_223).style.display="none";
_224="none";
}
if(_223=="wasHelpPortlet"){
if(_224=="none"){
document.getElementById(_223).parentNode.parentNode.parentNode.width="1%";
}else{
document.getElementById(_223).parentNode.parentNode.parentNode.width="20%";
}
uriState="secure/javascriptToSession.jsp?req=set&sessionVariable=wasHelpPortlet&variableValue="+_224;
setState=doXmlHttpRequest(uriState);
setState=setState.substring(0,setState.indexOf("+endTransmission"));
}
if(_223=="wasPDPortlet"){
uriState="secure/javascriptToSession.jsp?req=set&sessionVariable=wasPDPortlet&variableValue="+_224;
setState=doXmlHttpRequest(uriState);
setState=setState.substring(0,setState.indexOf("+endTransmission"));
}
}
}
function enableDisable(_225,_226){
if(_226!="reset"){
enableDisableArray[enableDisableArray.length]=_225;
}
controlArray=_225.split(",");
disStatus=false;
textStyle="textEntry";
textColor="#000000";
textAreaStyle="textAreaEntry";
for(i=0;i<controlArray.length;i++){
tmp=controlArray[i];
cArray=tmp.split(":");
if(cArray.length>1){
masterControlId=cArray[0];
var flip=false;
if(masterControlId.substr(0,1)=="!"){
masterControlId=masterControlId.substr(1);
flip=true;
}
if(document.getElementById(masterControlId)){
masterControlStatus=document.getElementById(masterControlId).checked;
masterControlStatusdisabled=document.getElementById(masterControlId).disabled;
if(flip){
masterControlStatus=!masterControlStatus;
}
}
if(masterControlStatus&&(!masterControlStatusdisabled)){
disStatus=false;
textStyle="textEntry";
textColor="#000000";
textAreaStyle="textAreaEntry";
}else{
disStatus=true;
textStyle="textEntryReadOnly";
textColor="#CCCCCC";
textAreaStyle="textAreaEntryReadOnly";
}
for(j=1;j<cArray.length;j++){
if(document.getElementById(cArray[j])){
rcArray=cArray[j].split("+");
if(rcArray.length>1){
textStyle=textStyle+rcArray[1];
cArray[j]=rcArray[0];
}
if((document.getElementById(cArray[j]).type=="text")||(document.getElementById(cArray[j]).type=="password")){
document.getElementById(cArray[j]).className=textStyle;
}
if(document.getElementById(cArray[j]).type=="textarea"){
document.getElementById(cArray[j]).className=textAreaStyle;
}
if(isDom){
document.getElementById(cArray[j]).parentNode.style.color=textColor;
}else{
document.getElementById(cArray[j]).parentElement.style.color=textColor;
}
document.getElementById(cArray[j]).disabled=disStatus;
}
}
}
}
}
function enableDisableImage(_228,_229,_22a,_22b){
if(document.getElementById(_228)!=null){
var _22c=document.images[_229];
if(_22c!=null){
if(document.getElementById(_228).checked==true){
_22c.src=_22a;
}else{
_22c.src=_22b;
}
}
}
}
function moveInList(_22d,_22e){
theList=document.getElementById(_22d);
if(theList.length==-1){
return;
}else{
var sel=theList.selectedIndex;
if(sel==-1){
alert(moveInListError);
}else{
if(theList.length==0){
return;
}else{
if(sel==theList.length-1){
return;
}else{
if(_22e=="up"){
if(sel==0){
return;
}else{
offsetNum=sel-1;
}
}else{
if(sel==(theList.length-1)){
return;
}else{
offsetNum=sel+1;
}
}
var _230=theList[offsetNum].text;
var _231=theList[sel].text;
var _232=theList[offsetNum].value;
var _233=theList[sel].value;
theList[sel].text=_230;
theList[sel].value=_232;
theList[offsetNum].text=_231;
theList[offsetNum].value=_233;
theList.selectedIndex=offsetNum;
}
}
}
}
}
function sortList(_234){
theList=document.getElementById(_234);
var _235=new Array();
var _236=new Array();
for(i=0;i<theList.length;i++){
_235[i]=theList.options[i].text;
}
_235.sort();
for(i=0;i<_235.length;i++){
theList.options[i].text=_235[i];
}
}
function sendListToHidden(_237,_238){
var _239="";
theList=document.getElementById(_237);
for(i=0;i<theList.options.length;i++){
_239=_239+"\n"+theList.options[i].value;
}
document.getElementById(_238).value=_239;
}
function moveBetweenLists(_23a,_23b,_23c){
if(isIE){
if(document.getElementById(_23a)!=null){
fromList=document.getElementById(_23a);
toList=document.getElementById(_23b);
for(y=0;y<fromList.options.length;y++){
var _23d=fromList.options[y];
if(_23d.selected){
sel=true;
text=_23d.text;
val=_23d.value;
toList.options[toList.length]=new Option(text,val);
fromList.options[y]=null;
y--;
}
}
if(!sel){
alert("Please select an option");
}else{
sortList(_23a);
sortList(_23b);
if(_23c!=null){
sendListToHidden(_23b,_23c);
}
}
}
}
}
function doXmlHttpRequest(sUri){
isMoz=false;
mozLoaded=false;
xmlhttp=null;
xmlDoc=null;
if(window.ActiveXObject){
xmlhttp=new ActiveXObject("MSXML2.XMLHTTP");
}else{
xmlhttp=new XMLHttpRequest();
}
if(xmlhttp){
xmlhttp.open("GET",sUri,false);
xmlhttp.send(null);
xmlDoc=xmlhttp.responseText;
mozLoaded=true;
}
return xmlDoc;
}
function doXmlHttpRequestPost(sUri,data){
isMoz=false;
mozLoaded=false;
xmlhttp=null;
xmlDoc=null;
if(window.ActiveXObject){
xmlhttp=new ActiveXObject("MSXML2.XMLHTTP");
}else{
xmlhttp=new XMLHttpRequest();
}
if(xmlhttp){
xmlhttp.open("POST",sUri,false);
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.setRequestHeader("Content-length",data.length);
xmlhttp.setRequestHeader("Connection","close");
xmlhttp.setRequestHeader("csrfid",getCookie("com.ibm.ws.console.CSRFToken"));
xmlhttp.send(data);
xmlDoc=xmlhttp.responseText;
mozLoaded=true;
}
return xmlDoc;
}
function getObjectStatus(sUri,_242){
_242.alt=pleaseWait;
_242.title=pleaseWait;
tmpsrc=_242.src;
var _243=new Date();
sUri=sUri+"&time="+_243.getTime();
xmlDoc=doXmlHttpRequest(sUri);
xmlDoc.replace(/\n/,"");
for(j=xmlDoc.length-1;j>=0&&xmlDoc.charAt(j)<=" ";j--){
}
xmlDoc=xmlDoc.substring(0,j+1);
for(i=0;i<statusArray.length;i++){
if(xmlDoc==statusArray[i]){
xmlDoc=statusArray[i];
tmpsrc=statusIconArray[i];
break;
}
}
_242.alt=xmlDoc;
_242.title=xmlDoc;
_242.src=tmpsrc;
}
function iscSelectAll(_244,_245){
theForm=document.getElementById(_244);
if(!_245){
for(i=0;i<theForm.length;i++){
if(theForm[i].type=="checkbox"){
theForm[i].checked=true;
quickChecks(theForm[i]);
findParentRow(theForm.elements[i],"table-row-selected");
}
}
}else{
for(i=0;i<theForm.length;i++){
if((theForm[i].type=="checkbox")&&(theForm[i].id==_245)){
theForm[i].checked=true;
quickChecks(theForm[i]);
findParentRow(theForm.elements[i],"table-row-selected");
}
}
}
checkChecks();
}
function iscDeselectAll(_246,_247){
theForm=document.getElementById(_246);
if(!_247){
for(i=0;i<theForm.length;i++){
if(theForm[i].type=="checkbox"){
theForm[i].checked=false;
quickChecks(theForm[i]);
findParentRow(theForm.elements[i],"table-row");
}
}
}else{
for(i=0;i<theForm.length;i++){
if((theForm[i].type=="checkbox")&&(theForm[i].id==_247)){
theForm[i].checked=false;
quickChecks(theForm[i]);
findParentRow(theForm.elements[i],"table-row");
}
}
}
checkChecks();
}
function findParentRow(el,st){
par=el.parentNode;
if(par.tagName=="TR"){
par.className=st;
}else{
findParentRow(par,st);
}
}
function updateStatusImage(_24a,_24b){
if(document.getElementById(_24a)!=null){
if(_24b!="info"){
if(_24b=="warning"){
if(document.getElementById(_24a).src.indexOf("Error.gif")<0){
document.getElementById(_24a).src="../images/Warning.gif";
}
}else{
if(_24b=="error"){
document.getElementById(_24a).src="../images/Error.gif";
}else{
if((document.getElementById(_24a).src.indexOf("Warning.gif")<0)&&(document.getElementById(_24a).src.indexOf("Error.gif")<0)){
document.getElementById(_24a).src="../images/complete.gif";
}
}
}
}
}
}
function intersect(_24c,_24d){
var _24e=[];
for(var i1=0;i1<_24c.length;i1++){
var _250=false;
for(var i2=0;i2<_24d.length;i2++){
if(_24c[i1]==_24d[i2]){
_250=true;
break;
}
}
if(_250){
_24e.push(_24c[i1]);
}
}
return _24e;
}
function enableAllButtons(){
if(window.buttonsFilter){
for(var b in buttonsFilter){
var _253=buttonsFilter[b];
var _254;
for(var b2 in _253){
_254=b2;
}
var _256=findButton(_254);
if(_256){
enableButton(_256);
}
}
}
}
function quickChecks(chk){
if(!window.checkedRows){
checkedRows={};
}
if(chk.checked==true){
findParentRow(chk,"table-row-selected");
checkedRows[chk.value]=true;
}else{
findParentRow(chk,"table-row");
delete checkedRows[chk.value];
}
}
function checkChecks(chk){
if(chk){
quickChecks(chk);
}
if(!window.checkedRows){
return;
}
enableAllButtons();
for(var _259 in checkedRows){
if(window.buttonsFilter){
for(var b in buttonsFilter){
var _25b=buttonsFilter[b];
var _25c;
for(var b2 in _25b){
_25c=b2;
}
var _25e=_25b[b2];
var _25f=collectionFilter[_259];
if(_25f){
if(intersect(_25e,_25f).length==0){
var _260=findButton(_25c);
if(_260){
var _261=window["roleNLS"]["button.disabled.desc"];
var _262="";
for(var r=0;r<_25e.length;r++){
_262+=window["roleNLS"][_25e[r]];
if(r<_25e.length-1){
_262+=", ";
}
}
_261=_261.replace("{0}",_262);
disableButton(_260,_261);
}
}
}
}
}
}
}
function disableButton(_264,_265){
_264.setAttribute("disabled","disabled");
var div=document.createElement("div");
div.setAttribute("id",_264.getAttribute("value")+".div");
div.setAttribute("title",_265);
_264.parentNode.appendChild(div);
div.style.position="absolute";
div.style.width=_264.offsetWidth;
div.style.height=_264.offsetHeight;
div.style.top=_264.offsetTop;
div.style.left=_264.offsetLeft;
div.style["z-index"]=10;
}
function enableButton(_267){
var div=document.getElementById(_267.getAttribute("value")+".div");
if(div){
_267.parentNode.removeChild(div);
}
_267.disabled=null;
}
function findButton(name){
var _26a=document.forms;
for(var i=0;i<_26a.length;i++){
if(_26a[i][name]){
return _26a[i][name];
}
}
return null;
}
ROElementValue=null;
function captureRO(el){
ROElementValue=el.value;
}
function returnRO(el){
el.value=ROElementValue;
}
function saveFormState(){
try{
var data="{";
for(var i=0;i<document.forms[0].elements.length;i++){
var _270=document.forms[0].elements[i];
if(_270.type=="radio"&&!_270.disabled&&_270.checked){
data+="\""+_270.name+"\":"+"{\"type\":\"radio\",\"value\":\""+_270.id+"\"}";
data+=",";
}else{
if(_270.type=="text"&&!_270.disabled){
data+="\""+_270.name+"\":"+"{\"type\":\"text\",\"value\":\""+escape(_270.value)+"\"}";
data+=",";
}else{
if(_270.type=="checkbox"&&!_270.disabled){
data+="\""+_270.name+"\":"+"{\"type\":\"checkbox\",\"value\":"+_270.checked+"}";
data+=",";
}else{
if(_270.type=="select-one"&&!_270.disabled){
data+="\""+_270.name+"\":"+"{\"type\":\"select\",\"value\":"+_270.selectedIndex+"}";
data+=",";
}
}
}
}
}
data+="\"_form\":\""+document.getElementById("name").getAttribute("value")+"\"}";
var _271="secure/javascriptToSession.jsp";
var _272="req=set&sessionVariable=formstate_data&variableValue="+escape(data);
doXmlHttpRequestPost(_271,_272);
}
catch(err){
}
return true;
}
function clearFormState(){
uriState="secure/javascriptToSession.jsp?req=set&sessionVariable=formstate_data&variableData=";
var data=doXmlHttpRequest(uriState);
return true;
}
function restoreFormState(){
addSaveStateOnclickToAnchor("customPropsLink");
if(!document.forms[0]){
return;
}
uriState="secure/javascriptToSession.jsp?req=get&sessionVariable=formstate_data";
var data=doXmlHttpRequest(uriState);
if(data.substring(0,6)=="inline"){
return;
}
data=data.substring(0,data.indexOf("+endTransmission"));
data=eval("("+data+")");
if(data["_form"]!=document.getElementById("name").getAttribute("value")){
return;
}
for(var i=0;i<document.forms[0].elements.length;i++){
var _276=document.forms[0].elements[i];
if(data[_276.name]&&data[_276.name].type=="radio"){
var _277=document.getElementById(data[_276.name].value);
_277.checked=true;
_277.click();
}else{
if(data[_276.name]&&data[_276.name].type=="text"){
_276.value=unescape(data[_276.name].value);
}else{
if(data[_276.name]&&data[_276.name].type=="checkbox"){
if(!_276.checked==data[_276.name].value){
_276.click();
}
}else{
if(data[_276.name]&&data[_276.name].type=="select"){
_276.selectedIndex=data[_276.name].value;
}
}
}
}
}
var _278=document.getElementsByTagName("a");
for(var i=0;i<_278.length;i++){
if(_278[i].getAttribute("onclick")==null){
if(_278[i].childNodes.length==1&&_278[i].childNodes[0].nodeType==3){
if(_278[i].getAttribute("target")!="WAS_help"&&_278[i].getAttribute("id")!="customPropsLink"){
_278[i].setAttribute("onclick","return clearFormState();");
_278[i].onclick=function(){
return clearFormState();
};
}
}
}
}
clearFormState();
}
function addSaveStateOnclickToAnchor(id){
var _27a=document.getElementsByTagName("a");
for(var i=0;i<_27a.length;i++){
if(_27a[i].childNodes.length==1&&_27a[i].childNodes[0].nodeType==3){
if(_27a[i].getAttribute("id")==id){
_27a[i].setAttribute("onclick","return saveFormState();");
_27a[i].onclick=function(){
return saveFormState();
};
}
}
}
}
function getCookie(_27c){
if(null===_27c||""===_27c){
return "";
}
var _27d=window.document.cookie;
var _27e=_27d.lastIndexOf(_27c+"=");
if(_27e==-1){
return "";
}
var _27f=_27e+_27c.length+1;
var _280=_27d.indexOf(";",_27f);
if(_280==-1){
_280=_27d.length;
}
var _281=_27d.substring(_27f,_280);
return _281;
}
