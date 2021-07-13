/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eappoint.dao;

/**
 *
 * @author Teoh
 */
import java.sql.*;
import com.eappoint.bean.userStudent;
import com.eappoint.dbconnection.DBConnection;

public class StudentDao {
    
    private static Connection con;
    
    //get connection from DBConnection
    public static Connection getConnection(){
        con = DBConnection.getConnection();
        return con;
    }
    
    //create
    public static int save(userStudent std){
        int status = 0;
        try{
            con = StudentDao.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into student(Student_ID, Student_name, Student_DoB, Student_password) values(?,?,?,?)");
            
            ps.setString(1, std.getUsername());
            ps.setString(2, std.getName());
            ps.setString(4, std.getPassword());
            ps.setString(3, std.getDoB());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return status;
    }
    
    //retrieve
    public static userStudent getUser(String un){
        userStudent std = new userStudent();
        try{
            con = StudentDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from student where Student_ID = ?");
            
            ps.setString(1, un);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                std.setUsername(rs.getString(1));
                std.setName(rs.getString("Student_name"));                
                std.setDoB(rs.getString("Student_DoB"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return std;
    }
    
    //update
    public static int updatePass(userStudent std){
        int status = 0;
        try{
            con = StudentDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update student set Student_password=? where Student_ID=?");
            ps.setString(1, std.getPassword());
            ps.setString(2, std.getUsername());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
}