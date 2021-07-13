/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eappoint.dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.eappoint.bean.userLecturer;
import com.eappoint.dbconnection.DBConnection;
import com.eappoint.bean.userAdmin;
import com.eappoint.bean.userStudent;
import java.sql.SQLException;

/**
 *
 * @author Teoh
 */
public class AdminDao {
    
    private static Connection con;
    
    //get connection from DBConnection
    public static Connection getConnection(){
        con = DBConnection.getConnection();
        return con;
    }
    
    //retrieve admin info
    public static userAdmin getUser(String un){
        userAdmin ad = new userAdmin();
        try{
            con = AdminDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from admin where ADMIN_ID = ?");
            
            ps.setString(1, un);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                ad.setUsername(rs.getString(1));               
                ad.setName(rs.getString("A_NAME"));               
            }
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return ad;
    }
    
    //update admin password
    public static int updatePass(userAdmin ad){
        int status = 0;
        try{
            con = AdminDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update admin set ADMIN_PASSWORD=? where ADMIN_ID=?");
            ps.setString(1, ad.getPassword());
            ps.setString(2, ad.getUsername());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return status;
    }
    
    //update lecturer info
    public static int updateLect(userLecturer lect){
        int status = 0;
        try{
            con = AdminDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update lecturer set L_name=?, L_speciality=?, Active_Key=? where Lecturer_ID=?");
            ps.setString(1, lect.getName());
            ps.setString(2, lect.getSpeciality());
            ps.setInt(3, lect.getActivation());
            ps.setString(4, lect.getUsername());           
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return status;
    }
    
    //get all lecturer
    public static List<userLecturer> getLectById(){
        List<userLecturer> listLect = new ArrayList<userLecturer>();
        
        try{
            con = AdminDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lecturer");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                userLecturer lect = new userLecturer();  //create object to fill with user data
                lect.setUsername(rs.getString("Lecturer_ID"));
                lect.setName(rs.getString("L_name"));
                lect.setSpeciality(rs.getString("L_speciality"));
                lect.setActivation(rs.getInt("Active_Key"));
                listLect.add(lect);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return listLect;
    }
    
    //get all student
    public static List<userStudent> getStdById(){
        List<userStudent> listStd = new ArrayList<userStudent>();
        
        try{
            con = AdminDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from student");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                userStudent std = new userStudent();  //create object to fill with user data
                std.setUsername(rs.getString("Student_ID"));
                std.setName(rs.getString("Student_name"));
                std.setDoB(rs.getString("Student_DoB"));
                listStd.add(std);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return listStd;
    }
    
    //delete lecturer
    public static int deleteLect(String id){
        int status = 0;
        try{
            con = AdminDao.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from lecturer where Lecturer_ID=?");
            ps.setString(1, id);
            
            status = ps.executeUpdate();
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return status;
    }
    
    //delete student
    public static int deleteStd(String id){
        int status = 0;
        try{
            con = AdminDao.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from student where Student_ID=?");
            ps.setString(1, id);
            
            status = ps.executeUpdate();
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return status;
    }    
}
