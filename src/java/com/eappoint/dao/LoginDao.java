/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eappoint.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.eappoint.bean.userLecturer;
import com.eappoint.dbconnection.DBConnection;
import java.sql.SQLException;
/**
 *
 * @author Teoh
 */
public class LoginDao {
        
    //validate admin info
    public static boolean validateAd(String un, String pass){
        boolean status = false;
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from admin where ADMIN_ID=? and ADMIN_PASSWORD=?");
            ps.setString(1, un);
            ps.setString(2, pass);
            
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return status;
    }
    
    //validate lecturer info
    public static boolean validateLect(String un, String pass){
        boolean status = false;
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lecturer where Lecturer_ID=? and L_password=?");
            ps.setString(1, un);
            ps.setString(2, pass);
            
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return status;
    }
    
    //validate activation key
    public static userLecturer getActivationKey(String un){
        userLecturer lect = new userLecturer();
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select Active_Key from lecturer where Lecturer_ID=?");
            
            ps.setString(1, un);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                lect.setActivation(rs.getInt("Active_Key"));
            }
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return lect;
    }
    
    //validate student info
    public static boolean validateStd(String un, String pass){
        boolean status = false;
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from student where Student_ID=? and Student_password=?");
            ps.setString(1, un);
            ps.setString(2, pass);
            
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return status;
    }
}
