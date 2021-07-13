/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eappoint.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Teoh
 */
public class DBConnection implements java.io.Serializable{
    
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String myUrl = "jdbc:mysql://localhost:3306/kumpulan12?useTimeZone=true&serverTimezone=UTC";
            con = DriverManager.getConnection(myUrl, "kump12", "_Kumpulan12");
        }
        catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return con;
    }
    
    public void closeConnection(){
        Connection con = null;
        try{
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
}
