package com.connections;
import java.sql.*;

public class Connections 
{
    static Connection c;
    static Statement st;
    public static Statement makeConnection()
    {
        try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:orcle","system","1234");
        st=c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        }catch(Exception e)
        {
            System.out.println("makeConnection : "+e);
        }
        return st;
    }
    public static void closeConnection()
    {
        try{
        st.close();
        c.close();
        }catch(Exception e)
        {
        	System.out.println("closeConnection : "+e);
        }
    }
}
