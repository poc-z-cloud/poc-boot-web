package greateq.web.console.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/**
 * Title:        TestJsp
 * Description:  Test jsp
 * Copyright:    Copyright (c) 2001
 * Company:      Worldmetal.com
 * @author
 * @version 1.0
 */
import java.util.*;

public class GenAPI {

  public GenAPI() {
  }

  public static String x_toString(Object o,String sDefault)
  {
    if(sDefault==null) sDefault="";

    if (o==null) return sDefault;
    try
    {
      return new String(o.toString().getBytes("ISO8859_1"));
    }
    catch(Exception e)
    {
      return sDefault;
    }
  }

  public static String[] x_toString(String[] o)
  {
    try
    {
      for(int i=0;i<o.length;i++)
        o[i]=x_toString(o[i],"");
      return o;
    }
    catch(Exception e)
    {
      return null;
    }
  }
  
  public static Long[] string2Long(String[] strArray){
	  if (strArray==null) return new Long[0];
	  
	  Long[] ret = new Long[strArray.length];
	  for(int i=0;i<strArray.length;i++){
		  ret[i]=Long.parseLong(strArray[i]);
	  }

	  return ret;
	
	
  }
  
  public static long encrypt(String password)
  {
	long lPWD;
        int i;

	if(password == null)	return -1;
	if(password.equals(""))	return 0;

	lPWD=0;
	for(i=0;i<password.length();i++)
		lPWD=lPWD+(int) password.charAt(i)*7*(password.length()-i);

	return lPWD;
  }

  //HTML UI
  public static String getSelectHtml(String selectName,String [][] aSelect,String selected,int rowCount)
  {
    if(aSelect==null) return "";

    String keyword="";
    StringBuffer sHtml=new StringBuffer("<SELECT name=\"");

    sHtml.append(selectName);
    sHtml.append("\" size=");
    sHtml.append(rowCount);
    sHtml.append(">");

    for(int i=0;i<aSelect.length;i++)
    {
      keyword=aSelect[i][0];
      if(keyword.equals(selected))
        sHtml.append("<OPTION selected value=\"");
      else
        sHtml.append("<OPTION value=\"");

      sHtml.append(keyword);
      sHtml.append("\">");
      sHtml.append(aSelect[i][1]);
      sHtml.append("</OPTION>");

    }
    sHtml.append("</SELECT>") ;


    return sHtml.toString();
  }

  public static String getSelectHtml(String selectName,String [][] aSelect,int rowCount)
  {
    if(aSelect==null) return "";

    String keyword="";
    StringBuffer sHtml=new StringBuffer("<SELECT name=\"");

    sHtml.append(selectName);
    sHtml.append("\" multiple size=");
    sHtml.append(rowCount);
    sHtml.append(">");

    for(int i=0;i<aSelect.length;i++)
    {
      if(aSelect[i].length==3)
      {
        keyword=aSelect[i][2];
        if(keyword.equals("1"))
          sHtml.append("<OPTION selected value=\"");
        else
          sHtml.append("<OPTION value=\"");
      }
      else
        sHtml.append("<OPTION value=\"");

      keyword=aSelect[i][1];
      sHtml.append(keyword);
      sHtml.append("\">");
      sHtml.append(aSelect[i][1]);
      sHtml.append("</OPTION>");

    }
    sHtml.append("</SELECT>") ;


    return sHtml.toString();
  }

  public static String getOptionsHtml(String[][] aOption,String selected)
  {
    if(aOption==null) return "";

    StringBuffer sHtml=new StringBuffer("");
    String keyword;
    for(int i=0;i<aOption.length;i++)
    {
      keyword=aOption[i][0];
      if(keyword.equals(selected))
        sHtml.append("<OPTION selected value=\"");
      else
        sHtml.append("<OPTION value=\"");

      sHtml.append(keyword);
      sHtml.append("\">");
      sHtml.append(aOption[i][1]);
      sHtml.append("</OPTION>");

    }
    return sHtml.toString();
  }

  public static String getOptionsHtml(String[][] aOption)
  {
    if(aOption==null) return "";

    StringBuffer sHtml=new StringBuffer("");
    String keyword;
    for(int i=0;i<aOption.length;i++)
    {
      if(aOption[i].length==3)
      {
        keyword=aOption[i][2];
        if(keyword.equals("1"))
          sHtml.append("<OPTION selected value=\"");
        else
          sHtml.append("<OPTION value=\"");
      }
      else
        sHtml.append("<OPTION value=\"");

      keyword=aOption[i][0];
      sHtml.append(keyword);
      sHtml.append("\">");
      sHtml.append(aOption[i][1]);
      sHtml.append("</OPTION>");

    }
    return sHtml.toString();
  }

  public static String  getCheckHtml(String checkName,String value,String text,int checked)
  {
    StringBuffer sHtml=new StringBuffer("");
    sHtml.append("<INPUT type=checkbox  name=\"");
    sHtml.append(checkName);
    sHtml.append("\"");

    if (checked==1)
      sHtml.append(" checked ");

    sHtml.append(" value=\"");
    sHtml.append(value);
    sHtml.append("\">");
    sHtml.append(text);

    return sHtml.toString();
  }

  //URL
  public static String  getPath(String URL)
  {
    int i=0;
    if(URL==null) return "/";
    if(URL.equals("")) return "/";

    i=URL.lastIndexOf("/");
    if(i>0)
    {
      return URL.substring(0,i+1);
    }
    return "/";
  }

  /*
  @deprecation
  */
  public static String  arrayToString(String[] arrStr)
  {
    String str = "0";
    if (arrStr!=null)
    {
        for (int i=0;i<arrStr.length;i++)
        {
            str +=","+arrStr[i];
        }
    }
    return str;
  }
  public static String[] stringToArray(String str)
  {
    //added by  xiesheng,change string as "0,1,4,6" to array aList[0]=1;
    //aList[1]=4,aList[2]=6,etc.
    String[] resultStr=new String[0];
    ArrayList al=new ArrayList();
    StringTokenizer st=new StringTokenizer(str,",");
    String temp="";
    while (st.hasMoreTokens())
    {
        temp=st.nextToken();
        if (!temp.equals("0"))
            al.add(temp);
    }
    resultStr=(String[])al.toArray(resultStr);
    return resultStr;
  }

  public static String[] stringToArray(String str,boolean includeZero)
  {
    //added by  xiesheng,change string as "0,1,4,6" to array aList[0]=1;
    //aList[1]=4,aList[2]=6,etc.
    String[] resultStr=new String[0];
    ArrayList al=new ArrayList();
    StringTokenizer st=new StringTokenizer(str,",");
    String temp="";
    while (st.hasMoreTokens())
    {
        temp=st.nextToken();
        if (includeZero)
        {
            al.add(temp);
        }else
        {
            if (!temp.equals("0"))
                al.add(temp);
        }
    }
    resultStr=(String[])al.toArray(resultStr);
    return resultStr;
  }

  public static String  getPageHtml(String sFileName,int lTotal,int lPageSize,int lCurrentPage)
  {
	  return getPageHtml(sFileName,lTotal,lPageSize,lCurrentPage,null,"E");
  }
  public static String  getPageHtml(String sFileName,int lTotal,int lPageSize,int lCurrentPage,String sWhere)
  {
	  return getPageHtml(sFileName,lTotal,lPageSize,lCurrentPage,sWhere,"E");
//    StringBuffer sPage=new StringBuffer(200);
//    int n;
//    n=(lTotal % lPageSize == 0)?(lTotal / lPageSize):((lTotal / lPageSize)+1);
//    if(lCurrentPage>n) lCurrentPage=n;
//
//    sPage.append("共");
//    sPage.append(n);
//    sPage.append("页" );
//    sPage.append(lTotal);
//    sPage.append("条记录，当前第" );
//    sPage.append(lCurrentPage);
//    sPage.append("页" );
//
//
//    if(lCurrentPage==1)
//    {
//      sPage.append("   <font color=darkgray>首页   前页</font>");
//    }
//    else
//    {
//      sPage.append(" <a href=\"");
//      sPage.append(sFileName);
//      sPage.append("?adminCurrentPage=1");
//      sPage.append("&adminPageSize="+lPageSize);
//      sPage.append("&"+sWhere);
//      sPage.append("\">首页</a>  <a href=\"" );
//      sPage.append(sFileName);
//      sPage.append("?adminCurrentPage="+(lCurrentPage-1));
//      sPage.append("&adminPageSize="+lPageSize);
//      sPage.append("&"+sWhere);
//      sPage.append("\">前页</a> ");
//    }
//    if(lCurrentPage==n)
//    {
//            sPage.append( "  <font color=darkgray>后页  尾页</font>");
//    }
//    else
//    {
//            sPage.append( "  <a href=\""+ sFileName + "?adminCurrentPage=" + (lCurrentPage+1) + "&adminPageSize="+lPageSize+"&" + sWhere + "\">后页</a>  <a href=\"" + sFileName + "?adminCurrentPage=" + n + "&adminPageSize="+lPageSize+"&" + sWhere +"\">尾页</a>");
//    }
//    return sPage.toString();
  }

  public static String  getPageHtml(String sFileName,int lTotal,int lPageSize,int lCurrentPage,String sWhere,String language)
  {
    String sFirst,sPrevious,sNext,sLast;
    if(language.equalsIgnoreCase("C"))
    {
        sFirst="首页";
        sPrevious="前页";
        sNext="后页";
        sLast="尾页";
    }
    else
    {
        sFirst="First";
        sPrevious="Previous";
        sNext="Next";
        sLast="Last";
    }
    StringBuffer sPage=new StringBuffer(200);
    int n;
    n=(lTotal % lPageSize == 0)?(lTotal / lPageSize):((lTotal / lPageSize)+1);
    if(lCurrentPage>n) lCurrentPage=n;

    if(language.equalsIgnoreCase("C"))
    {
        sPage.append("共");
        sPage.append(n);
        sPage.append("页" );
        sPage.append(lTotal);
        sPage.append("条记录，当前第" );
        sPage.append(lCurrentPage);
        sPage.append("页" );
    }
    else
    {
        sPage.append("Total Records:" );
        sPage.append(lTotal);
        sPage.append("&nbsp;&nbsp;&nbsp;    Total Page:");
        sPage.append(n);
        sPage.append("&nbsp;&nbsp;&nbsp;    Current Page:" );
        sPage.append(lCurrentPage);
        sPage.append("&nbsp;&nbsp;&nbsp;" );
    }

    if(lCurrentPage==1)
    {
      sPage.append("   <font color=darkgray>"+sFirst+"   "+sPrevious+"</font>");
    }
    else
    {
      sPage.append(" <a href=\"");
      sPage.append(sFileName);
      sPage.append("?adminCurrentPage=1");
      sPage.append("&adminPageSize="+lPageSize);
      sPage.append("&"+sWhere);
      sPage.append("\">"+sFirst+"</a>  <a href=\"" );
      sPage.append(sFileName);
      sPage.append("?adminCurrentPage=" );
      sPage.append((lCurrentPage-1));
      sPage.append("&adminPageSize="+lPageSize);
      sPage.append("&");
      sPage.append(sWhere);
      sPage.append("\">"+sPrevious+"</a> ");
    }
    if(lCurrentPage==n)
    {
            sPage.append( "  <font color=darkgray>"+sNext+"  "+sLast+"</font>");
    }
    else
    {
            sPage.append( "  <a href=\""+ sFileName + "?adminCurrentPage=" + (lCurrentPage+1) + "&adminPageSize="+lPageSize+"&" + sWhere + "\">"+sNext+"</a>  <a href=\"" + sFileName + "?adminCurrentPage=" + n + "&adminPageSize="+lPageSize+"&" + sWhere +"\">"+sLast+"</a>");
    }
    return sPage.toString();
  }


  public static String getPageSelectHtml(String selectName,int totalRecord,int lPageSize,int lCurrentPage)
  {

    int n;
    n=(totalRecord % lPageSize == 0)?(totalRecord / lPageSize):((totalRecord / lPageSize)+1);
    if(lCurrentPage>n) lCurrentPage=n;

    StringBuffer sHtml=new StringBuffer("Goto Page <SELECT name=\"");
    sHtml.append(selectName);
    sHtml.append("\"  onchange=\"return btnPageDown_onclick()\">");

    for(int i=1;i<=n;i++)
    {
      if(lCurrentPage==i)
        sHtml.append("<OPTION selected value=\"");
      else
        sHtml.append("<OPTION value=\"");

      sHtml.append(i);
      sHtml.append("\">");
      sHtml.append(i);
      sHtml.append("</OPTION>");

    }
    sHtml.append("</SELECT>") ;
    return sHtml.toString();
  }

    public static String formatNumber(double numValue, int decplaces,boolean hasComma)
    {
        String minus="";
        if (numValue< 0)
        {
            minus="-";
            numValue = numValue * (-1);
        }

        String str="" + Math.round((numValue) * Math.pow(10, decplaces)) + "";
        while (str.length() <= decplaces)
        {
            str="0" + str;
        }

        int decpoint=str.length() - decplaces;
        double compoint=Math.floor(decpoint/3);
        int beforeComPoint=decpoint%3;
        String returnStr="";
        int i=0;
        for (i =0; i < compoint; i++)
        {
            if (i > 0)
            {
                if (hasComma)
                    returnStr="," + returnStr;
            }
            returnStr=str.substring(decpoint-((i+1)*3), decpoint-(i*3)) + returnStr;
        }
        if (beforeComPoint > 0 && i > 0)
        {
            if (hasComma)
                returnStr="," + returnStr;
        }
        if (decplaces==0)
            return minus + str.substring(0, beforeComPoint) + returnStr;
        else
            return minus + str.substring(0, beforeComPoint) + returnStr + "." + str.substring(decpoint, str.length());

    }

    public static String stringReplace(String str,String source,String target)
    {
        String str1=str;
        String source1=source;
        String target1=target;
        int pos=0;
        int length=0;
        while((pos=str1.indexOf(source1,pos+length))!=-1)
        {
            //System.out.println("pos="+pos);
            if (pos>=0)
            {
                str1=str1.substring(0,pos)+target+str1.substring(pos+source1.length(),str1.length());
                length=target1.length();
            }else
            {
                break;
            }
        }
        return str1;
    }

    public static String textEncode(String s)
    {
        s=stringReplace(s,"<","&lt;");
        s=stringReplace(s,">","&gt;");
        s=stringReplace(s,"\n","<BR>");
        return s;
    }
	// We need a bytesToHex method first. So, from -
	// http://stackoverflow.com/a/9855338/2970947
	final protected static char[] hexArray = "0123456789ABCDEF"
	    .toCharArray();

	public static String bytesToHex(byte[] bytes) {
	  char[] hexChars = new char[bytes.length * 2];
	  int v;
	  for (int j = 0; j < bytes.length; j++) {
	    v = bytes[j] & 0xFF;
	    hexChars[j * 2] = hexArray[v >>> 4];
	    hexChars[j * 2 + 1] = hexArray[v & 0x0F];
	  }
	  return new String(hexChars);
	}

	// Change this to something else.
	private static String SALT = "771216";

	// A password hashing method.
	public static String hashPassword(String in) {
	  try {
	    MessageDigest md = MessageDigest
	        .getInstance("SHA-256");
	    md.update(SALT.getBytes());        // <-- Prepend SALT.
	    md.update(in.getBytes());
	    // md.update(SALT.getBytes());     // <-- Or, append SALT.

	    byte[] out = md.digest();
	    return bytesToHex(out);            // <-- Return the Hex Hash.
	  } catch (NoSuchAlgorithmException e) {
	    e.printStackTrace();
	  }
	  return "";
	}
  public static void main(String[] args) {
    System.out.println("-----Begin Test of GenAPI-----");

    System.out.println("-----Begin Test of encrypt(String password)-----");
    System.out.println(encrypt("aaaa"));
    System.out.println("-----End Test of encrypt(String password)-----");

    System.out.println("-----Begin Test of getPath(String URL)-----");
    System.out.println(getPath("/admin/test/list.jsp"));
    System.out.println("-----End Test of getPath(String URL)-----");

    System.out.println("-----Begin Test of getSelectHtml(String selectName,String [][] aSelect,String selected,int rowCount)-----");
    String[][] aSelect =new String [2][2];
    for(int i=0;i<2;i++)
    {
      aSelect[i][0]=Integer.toString(i);
      aSelect[i][1]="Text"+i;
    }
    String selectHtml=getSelectHtml("cboTest",aSelect,"1",1);

    System.out.println(selectHtml);
    System.out.println("-----End Test of getSelectHtml(String selectName,String [][] aSelect,String selected,int rowCount)-----");

    System.out.println("-----End Test of GenAPI-----");

    System.out.println("---------------Begin test stringToArray---------------");
    String str[]=stringToArray("0,122,222,322,44,922",true);
    for (int i=0;i<str.length;i++)
    {
        System.out.println("str["+i+"]="+str[i]);
    }
    //System.getProperties().list(System.out);
    System.out.println("---------------End test stringToArray---------------");
    System.out.println("getCheckHtml:"+GenAPI.getCheckHtml("FORBID","1","账号禁用",0));
    System.out.println(formatNumber(2334.5555,2,false));
    System.out.println(stringReplace("boy I boy boy am a boy.","boy","hero"));
    System.out.println("encode="+textEncode("<sssss>\n"));
    System.out.println(GenAPI.encrypt("tom1"));
  }
}