package greateq.web.console.util;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class StringAPI {

    public static String replace(String content,String source,String target)
    {
        String right;
        int loc;
        StringBuffer newString=new StringBuffer(100);
        right=content;

        loc=content.indexOf(source);
        while (loc>-1)
        {
            newString.append(right.substring(0,loc));
            newString.append(target);

            right=right.substring(loc+source.length());
            loc=right.indexOf(source);
        }
        if(right!=null) newString.append(right);
        return newString.toString();
    }
    public StringAPI() {
    }
    public static void main(String[] args) {
        StringAPI stringAPI1 = new StringAPI();
    }
}