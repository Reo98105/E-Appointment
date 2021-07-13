/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eappoint.dao;

import java.sql.Connection;
import com.eappoint.dbconnection.DBConnection;
import com.eappoint.bean.userLecturer;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author Teoh
 */
public class LecturerDao {
    private static Connection con;
    
    //get connection from DBConnection
    public static Connection getConnection(){
        con = DBConnection.getConnection();
        return con;
    }
    
    //add lecturer into database
    public static int save(userLecturer lect){
        int status = 0;
        try{
            con = LecturerDao.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into lecturer(Lecturer_ID, L_name, L_password, L_speciality) values(?,?,?,?)");
            
            ps.setString(1, lect.getUsername());
            ps.setString(2, lect.getName());
            ps.setString(3, lect.getPassword());
            ps.setString(4, lect.getSpeciality());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return status;
    }
    
    //retrieve lecturer info
    public static userLecturer getUser(String un){
        userLecturer lect = new userLecturer();
        try{
            con = LecturerDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lecturer where Lecturer_ID = ?");
            
            ps.setString(1, un);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                lect.setUsername(rs.getString(1));
                lect.setPhoto(rs.getString("L_photo"));                
                lect.setName(rs.getString("L_name"));                
                lect.setSpeciality(rs.getString("L_speciality"));
                lect.setQualification(rs.getString("L_qualification")); 
                lect.setLocation(rs.getString("L_address"));
                lect.setContact(rs.getString("L_contact"));                
            }
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return lect;
    }
    
    //retrieve lecturer photo
    public static userLecturer getLectPhoto(String un){
        userLecturer ulect = new userLecturer();
        try{
            con = LecturerDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select L_photo from lecturer where Lecturer_ID = ?");
            
            ps.setString(1, un);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                Blob blob = rs.getBlob("L_photo");
                
                InputStream iS = blob.getBinaryStream();
                ByteArrayOutputStream oS = new ByteArrayOutputStream();
                byte[] buffer  = new byte[4096];
                int bytesRead = -1;
                
                while((bytesRead = iS.read(buffer)) != -1){
                    oS.write(buffer, 0, bytesRead);
                }
                
                byte[] imageBytes = oS.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                
                iS.close();
                oS.close();
                
                ulect.setPhoto(base64Image);
            }
            con.close();
        }
        catch(SQLException | IOException e){
            e.printStackTrace();
        }
        return ulect;
    }
    
    //retrieve key info
    public static userLecturer getActiveKey(String un){
        userLecturer lect = new userLecturer();
        try{
            con = LecturerDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select Active_Key from lecturer where Lecturer_ID = ?");
            
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
    
    //update lecturer info
    public static int updatePass(userLecturer lect){
        int status = 0;
        try{
            con = LecturerDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update lecturer set L_password=? where Lecturer_ID=?");
            ps.setString(1, lect.getPassword());
            ps.setString(2, lect.getUsername());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return status;
    }
    
    //retrieve lecturer info with speciality and location
    public static List<userLecturer> getUserRs(userLecturer ulect){
        List<userLecturer> lect = new ArrayList<userLecturer>();
        try{
            con = LecturerDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lecturer where L_speciality = ? or L_address = ?");
            
            ps.setString(1, ulect.getSpeciality());
            ps.setString(2, ulect.getLocation());
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){ 
                userLecturer l = new userLecturer();
                l.setUsername(rs.getString("Lecturer_ID"));
                l.setName(rs.getString("L_name"));
                l.setQualification(rs.getString("L_qualification"));
                l.setLocation(rs.getString("L_address"));
                l.setSpeciality(rs.getString("L_speciality"));
                lect.add(l);
                
                Blob blob = rs.getBlob("L_photo");
                
                InputStream iS = blob.getBinaryStream();
                ByteArrayOutputStream oS = new ByteArrayOutputStream();
                byte[] buffer  = new byte[4096];
                int bytesRead = -1;
                
                while((bytesRead = iS.read(buffer)) != -1){
                    oS.write(buffer, 0, bytesRead);
                }
                
                byte[] imageBytes = oS.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                
                iS.close();
                oS.close();
                
                l.setPhoto(base64Image);
            }
            con.close();
        }
        catch(IOException | SQLException e){
            e.printStackTrace();
        }
        return lect;
    }
    
    //retrieve lecturer info for result
    public static userLecturer getUserResult(String un){
        userLecturer lect = new userLecturer();
        try{
            con = LecturerDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from lecturer where Lecturer_ID = ?");
            
            ps.setString(1, un);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                lect.setUsername(rs.getString(1));
                lect.setName(rs.getString("L_name"));
                lect.setQualification(rs.getString("L_qualification"));                
                lect.setContact(rs.getString("L_contact"));
                lect.setLocation(rs.getString("L_address"));
                lect.setMisc(rs.getString("L_Misc"));
                
                Blob blob = rs.getBlob("L_photo");
                
                InputStream iS = blob.getBinaryStream();
                ByteArrayOutputStream oS = new ByteArrayOutputStream();
                byte[] buffer  = new byte[4096];
                int bytesRead = -1;
                
                while((bytesRead = iS.read(buffer)) != -1){
                    oS.write(buffer, 0, bytesRead);
                }
                
                byte[] imageBytes = oS.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                
                iS.close();
                oS.close();
                
                lect.setPhoto(base64Image);
            }
            con.close();
        }
        catch(SQLException | IOException e){
            e.printStackTrace();
        }
        return lect;
    }
    
    //retrieve misc by lecturer ID
    public static userLecturer getMisc(String un){
        userLecturer lect = new userLecturer();
        try{
            con = LecturerDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select L_Misc from lecturer where Lecturer_ID = ?");
            
            ps.setString(1, un);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                lect.setMisc(rs.getString("L_Misc"));
            }
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return lect;
    }
    
    //update lecturer misc
    public static int updateMisc(userLecturer lect){
        int status = 0;
        try{
            con = LecturerDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update lecturer set L_Misc = ? where Lecturer_ID = ?");
            ps.setString(1, lect.getMisc());
            ps.setString(2, lect.getUsername());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return status;
    }
}
