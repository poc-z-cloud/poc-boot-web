package greateq.web.console.util;

/**
 * Title:        ChinaSteel 2nd Edition
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:      Worldmetal
 * @author sandy
 * @version 1.0
 */
import java.util.*;
import java.io.*;

public class InitProperties {

    private static boolean hasRefreshed=false;
    private static String javaHome=System.getProperty("java.home");
    private static String separator=System.getProperty("file.separator");
    private static Properties p=new Properties();

    static
    {
        refreshProperties();
    }

    public InitProperties() {
    }

    public static boolean refreshProperties()
    {
        try
        {
            p.load(new FileInputStream(javaHome+separator+"genweb.properties"));
        }
        catch(Exception e)
        {
            System.out.println("refreshProperties Error:"+e.getMessage());
        }
        return true;
    }

    public static String getProperty(String key,String defaultValue)
    {
/*
        if(!hasRefreshed)
        {
            refreshProperties();
            hasRefreshed=true;
        }
*/
        if(!p.containsKey(key))
        {
            p.setProperty(key,defaultValue);
            try
            {
                p.store(new FileOutputStream(javaHome+separator+"genweb.properties"),"Init properties");
            }
            catch(Exception e)
            {
                System.out.println("getProperty Error:"+e.getMessage());
            }
        }
        return p.getProperty(key);

    }

    public static void main(String[] args)
    {
        System.out.println("drv="+InitProperties.getProperty("drv111","123"));
//        teststatic.refreshProperties();
//        teststatic.getCnByDriver();
    }
}