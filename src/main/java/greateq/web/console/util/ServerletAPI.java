package greateq.web.console.util;

/**
 * Title:        genWeb
 * Description:  This is a general web infomation distributing system
 * Copyright:    Copyright (c) 2001
 * Company:      worldmetal
 * @author sandy
 * @version 1.0
 */

import javax.servlet.http.*;

public class ServerletAPI {

  public ServerletAPI() {
  }

  public static String getListCondition(HttpServletRequest request,
                                        HttpSession session,
                                        String varName,
                                        String defaultValue )
  {
    String sRet=null;
    sRet=GenAPI.x_toString(request.getParameter(varName),"");
    if(sRet.equals(""))
    {
      sRet=GenAPI.x_toString(session.getAttribute(varName),"");
      sRet=sRet.equals("")?defaultValue:sRet;
    }
    session.setAttribute(varName,sRet);

    return sRet;

  }



  public static void main(String[] args) {
    ServerletAPI serverletAPI1 = new ServerletAPI();
  }
}