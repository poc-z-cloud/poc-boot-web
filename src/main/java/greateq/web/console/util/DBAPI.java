package greateq.web.console.util;

/**
 * Title:        TestJsp
 * Description:  Test jsp
 * Copyright:    Copyright (c) 2001
 * Company:      Worldmetal.com
 * @author
 * @version 1.0
 */
import java.util.*;
import java.sql.*;
import javax.sql.*;
import java.io.*;
import javax.naming.*;

public class DBAPI
{

    static String driver="";

    static boolean hasRefreshed=false;
    static String runMode="debug";

    static String dbProvider = "MSSQL";
    public static int typeScroll = ResultSet.TYPE_SCROLL_SENSITIVE;
    static String drv="com.microsoft.jdbc.sqlserver.SQLServerDriver";
    static String url="jdbc:microsoft:sqlserver://127.0.0.1:1433";
    static String uid="linkwin";
    static String pwd="linkwin";

    static String jndiName="jdbc/mssqlserver4Pool";
    static String providerUrl="t3://192.9.200.250:7001";
    static String contextFactory="weblogic.jndi.WLInitialContextFactory";
    static String securityPrincipal="chinasteel";
    static String securityCredentials="chinasteel";

    static
        {
        refreshProperties();
    }

    public DBAPI()
    {
    }
    public static boolean refreshProperties()
    {
        try
        {
            //get the properties file
            InitProperties p=new InitProperties();

            runMode=p.getProperty("runMode",runMode);
            dbProvider = p.getProperty("dbProvider",dbProvider);
            typeScroll = Integer.parseInt(p.getProperty("typeScroll",
                                                        String.valueOf(typeScroll)));
            drv=p.getProperty("drv",drv);
            url=p.getProperty("url",url);
            uid=p.getProperty("uid",uid);
            pwd=p.getProperty("pwd",pwd);
            jndiName=p.getProperty("jndiName",jndiName);
            providerUrl=p.getProperty("providerUrl",providerUrl);
            contextFactory=p.getProperty("contextFactory",contextFactory);
            securityPrincipal=p.getProperty("securityPrincipal",
                                            securityPrincipal);
            securityCredentials=p.getProperty("securityCredentials",
                                              securityCredentials);

        }
        catch(Exception e)
        {
            System.out.println("refreshProperties Error"+e.toString());
        }
        return true;
    }

    public static Connection getCnByDriver()
    {

        System.out.println("drv="+DBAPI.drv);
        System.out.println("url="+DBAPI.url);
        System.out.println("uid="+DBAPI.uid);
        System.out.println("pwd="+DBAPI.pwd);
        Connection cn=null;
        try
        {
            Class.forName(drv).newInstance();
            cn=DriverManager.getConnection(url,uid,pwd);
        }
        catch (Exception e)
        {
            System.out.println("Connection Error:"+e.getMessage());
        }
        return cn;
    }

    public static Connection getCnByPool()
    {
        DataSource ds=null;
        Connection cn=null;

        ds=(DataSource)getResourceByNaming(jndiName,providerUrl);
        try
        {
            cn=ds.getConnection();
        }
        catch (SQLException sqle)
        {
            sqle.printStackTrace();
            //           sqle.getMessage();
        }
        return cn;
    }

    public static Connection getCn()
    {

        if(runMode.equals("debug"))
        {

            return getCnByDriver();
        }
        else
            return getCnByPool();
    }

    public static Object getResourceByNaming(String jndiName,String providerUrl)
    {
        Context ctx=null;
        Hashtable env=new Hashtable();
        Object obj = null;
        try
        {
            env.put(
                    Context.INITIAL_CONTEXT_FACTORY,
                    contextFactory
                );
            env.put(Context.PROVIDER_URL,providerUrl);
            //            System.out.println("providerUrl:"+providerUrl);
            //env.put(Context.SECURITY_PRINCIPAL,securityPrincipal);
            //env.put(Context.SECURITY_CREDENTIALS,securityCredentials);
            ctx = new InitialContext(env);
            obj=ctx.lookup(jndiName);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return obj;
    }

    public static long getPK(Connection cn)
    {
        long thePK=0;
        try
        {
            String sql = "select S_PK.nextval from dual";
            ResultSet rs = cn.createStatement().executeQuery(sql);

            if (rs.next())
            {
                thePK=rs.getLong(1);
                rs.close();
            }
            else
            {
                rs.close();
            }
        }
        catch(Exception e)
        {
            System.out.println("GetPK Error:"+e.toString());
            return -1;
        }

        return thePK;

    }
    public static long getPK(Connection cn,String dbProvider)
    {
        long thePK=0;
        ResultSet rs=null;
        java.sql.CallableStatement cs=null;
        try
        {
            if (dbProvider.equalsIgnoreCase("MSSQL"))
            {
                cs=cn.prepareCall("{call getPK(?)}");
                cs.registerOutParameter(1,Types.INTEGER);
                cs.execute();
                thePK=cs.getLong(1);
            }
            if (dbProvider.equalsIgnoreCase("ORACLE"))
            {
                String sql = "select S_PK.nextval from dual";
                rs = cn.createStatement().executeQuery(sql);

                if (rs.next())  thePK=rs.getLong(1);
            }
        }
        catch(Exception e)
        {
            System.out.println("GetPK Error:"+e.toString());
            return -1;
        }
        finally
        {
            try
            {
                if (rs!=null) rs.close();
                if (cs!=null) cs.close();
            }
            catch (SQLException sqle)
            {
                sqle.printStackTrace();
            }
        }
        return thePK;
    }

    public static String[][] resultSet2Array(ResultSet rs)
    {
        return resultSet2Array(rs,0,0);
    }

    public static String[][] resultSet2Array(ResultSet rs,int begin)
    {
        return resultSet2Array(rs,begin,0);
    }

    public static String[][] resultSet2Array(ResultSet rs,int begin,int count)
    {
        ArrayList ar=new ArrayList();
        String[] tmp=null;
        String sTemp;
        int iCurrent=0;
        int iEnd=0;

        //check begin & count
        if(rs==null) return null;

        if(begin<=0) begin=1;
        if(count<=0) count=Integer.MAX_VALUE;
        if(count<Integer.MAX_VALUE) iEnd=begin+count;
        else iEnd=count;
        try
        {
            int colCount=rs.getMetaData().getColumnCount();
            while(rs.next())
            {
                iCurrent++;
                if(iCurrent>=begin)
                {
                    if(iCurrent<iEnd)
                    {
                        tmp=new String[colCount];

                        for(int j=0;j<colCount;j++)
                        {
                            switch(rs.getMetaData().getColumnType(j+1))
                            {
                            case  (char) Types.CHAR:
                            case  (char) Types.LONGVARCHAR:
                            case  (char) Types.VARCHAR:
                                sTemp=rs.getString(j+1);
                                break;
                            case  (char)Types.DATE:
                            case  (char)Types.TIME:
                            case  (char)Types.TIMESTAMP:
                                java.sql.Timestamp ts=rs.getTimestamp(j+1);
                                if(ts==null) sTemp="";
                                else sTemp = ts.toString();
                                break;
                            default:
                                sTemp=rs.getString(j+1);

                            }
                            tmp[j]=sTemp;
                        }//end of for
                        ar.add(tmp);
                    }//end of if(iCurrent<iEnd)
                    else
                    {
                        break;
                    }
                }//end of if(iCurrent>=begin)

            }//end of while(rs.next())
            return (String[][])ar.toArray(new String[0][0]);
        }
        catch(Exception e)
        {
            System.out.println("resultSet2Array(ResultSet rs,int begin,int count) Error :"+e.toString());
            return new String[0][0];
        }
    }
    public static String[][] getList(ResultSet rs,int rowCount)
    {
        return resultSet2Array(rs,1,rowCount);
    }
    public static int getRows(ResultSet rs)
    {
        int rows=0;
        try
        {
            while (rs.next())
            {
                rows++;
            }
            rs.beforeFirst();
        }
        catch (Exception e)
        {
            rows=0;
        }
        return rows;
    }

    public static String[][] getList(Connection cn, String sql){
    	return getList(cn,sql,0,0);
    }

    public static String[][] getList(Connection cn,
                                     String sql,int begin,int count)
    {
        try
        {

            ResultSet rs = cn.createStatement().executeQuery(sql);

            if(begin==0) begin=1;

            String[][] aList=DBAPI.resultSet2Array(rs,begin,count);
            rs.close();
            return aList;
        }
        catch(Exception e)
        {
            System.out.println("getList(String sql,int begin,int count) Error :"+e.toString()+" sql="+sql);
            return new String[0][0];
        }

    }
    
    public static ResultSet executeQuery(Connection cn,String sql){
    	return executeQuery(cn,sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
    	
    }


    public static ResultSet executeQuery(Connection cn,
                                         String sql,
                                         int scrollType,int concurType)
    {
        try
        {

            return (ResultSet) cn.createStatement(scrollType,
                                                  concurType).executeQuery(sql);

        }
        catch(Exception e)
        {
            System.out.println("executeQuery(String sql,int scrollType,int concurType) Error :"+e.toString()+" sql="+sql);
            return null;
        }
    }

    public static String[][] queryArray(Connection cn,String sql)
    {
        String[][] aList;
        int rowCount=0;
        int colCount=0;
        String sTemp;
        try
        {


            ResultSet rs=cn.createStatement(typeScroll,
                                            ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
            rs.last();
            rowCount=rs.getRow();
            colCount=rs.getMetaData().getColumnCount();
            aList=new String[rowCount][colCount];
            rs.beforeFirst();
            for(int i=0;i<rowCount;i++)
            {
                rs.next();
                for(int j=0;j<colCount;j++)
                {
                    switch(rs.getMetaData().getColumnType(j+1))
                    {
                    case  (char) Types.CHAR:
                    case  (char) Types.LONGVARCHAR:
                    case  (char) Types.VARCHAR:
                        sTemp=rs.getString(j+1);
                        break;
                    case  (char)Types.DATE:
                    case  (char)Types.TIME:
                    case  (char)Types.TIMESTAMP:
                        sTemp = rs.getTimestamp(j+1).toString();
                        break;
                    default:
                        sTemp=rs.getString(j+1);
                    }
                    aList[i][j]=(sTemp==null)?"":sTemp;
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            aList=new String[0][0];
        }

        return aList;
    }

    public static boolean executeUpdate(Connection cn,String sql)
    {
        try
        {
            int ret = cn.createStatement().executeUpdate(sql);
            return true;
        }
        catch(Exception e)
        {
            System.out.println("executeUpdate Error:"+e.toString()+" sql="+sql);
            return false;
        }
    }

    public static int getCount(Connection cn,String sql)
    {

        Statement stmt=null;
        ResultSet rs=null;
        try
        {
            stmt=cn.createStatement();
            rs=stmt.executeQuery(sql);
            if(rs.next())
            {
                return rs.getInt(1);
            }
            else
            {
                return 0;
            }

        }
        catch(Exception e)
        {
            e.printStackTrace();
            return 0;
        }
        finally
        {
            try
            {
                rs.close();stmt.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }

    }
    public static void main(String[] args)
    {
        System.out.println("-----Begin Test of DBAPI-----");

        //Create a Connection
        /*    Connection oracleCn=com.genweb.db.CnPool.getConnection("jdbc/oraclePool","t3://192.9.200.250:7001");
            Connection mssqlCn=com.genweb.db.CnPool.getConnection("jdbc/mssqlserver4Pool","t3://192.9.200.250:7001");
            System.out.println(DBAPI.getPK(oracleCn,"ORACLE"));
            System.out.println(DBAPI.getPK(mssqlCn,"MSSQL"));
        */    //test for getPK
        /*System.out.println("getPK(cn):"+getPK(cn));

        //End Test
        System.out.println("-----End Test of DBAPI-----");
        String[][] strArray=DBAPI.executeQuery(cn,"select property_id,property_name from properties where parent_id=2 and is_menu=1 and show_on_first=1 order by sort_order");
        System.out.println("strArray.length="+strArray.length);
        for (int i=0;i<strArray.length;i++)
        {
            for (int j=0;j<strArray[i].length;j++)
            {
                System.out.print("strArray["+i+"]["+j+"]="+strArray[i][j]+"  |  ");
            }
            System.out.println();
        }*/

        Connection cn=null;
        try
        {
            //            cn=teststatic.getCnByPool();
            cn=DBAPI.getCn();
            /*
                        StringBuffer sql=new StringBuffer(100);
            sql.append("SELECT b.TraderName, b.LogonTime, b.VisitTime, b.VisitSystem,");
            sql.append(" a.EName + '(' + a.CName + ')' AS company");
            sql.append(" FROM Traders b INNER JOIN");
            sql.append(" Companies a ON b.CompanyID = a.CompanyID");
            sql.append(" where dateadd(n,20,visitTime)>=getdate()");
            String aList[][]=DBAPI.getList(cn,sql.toString(),0,0);
                        System.out.println("cn:"+cn);
            */
        }
        catch(Exception e)
        {
            System.out.println("Connection Error:"+e.getMessage());
        }
        finally
        {
            try
            {
                cn.close();
            }
            catch(Exception e)
            {
            }
        }

    }
}
