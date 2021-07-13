/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eappoint.dao;

import com.eappoint.bean.userAppoint;
import com.eappoint.dbconnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Teoh
 */
public class AppointDao {
    
    private static Connection con;
    
    //get connection from DBConnection
    public static Connection getConnection(){
        con = DBConnection.getConnection();
        return con;
    }
    
    //add appointment into database
    public static int save(userAppoint appoint){
        int status = 0;
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into appointment(Student_ID, Lecturer_ID, A_Date, A_Slot, A_Reason) values(?,?,?,?,?)");
            
            ps.setString(1, appoint.getStd());
            ps.setString(2, appoint.getLect());
            ps.setString(3, appoint.getDate());
            ps.setString(4, appoint.getSlot());
            ps.setString(5, appoint.getReason());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return status;
    }
    
    //retrieve particular appointment from database for student view
    public static userAppoint getAppointById(int id){
        userAppoint appoint = new userAppoint();
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select lecturer.L_name, lecturer.L_address, appointment.A_Date, appointment.A_slot, appointment.A_Reason, appointment.A_Feedback, appointment.A_Rating from appointment inner join lecturer on appointment.Lecturer_ID = lecturer.Lecturer_ID where Appointment_ID = ?");
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                appoint.setLect(rs.getString("L_name"));
                appoint.setAddress(rs.getString("L_Address"));                
                appoint.setDate(rs.getString("A_Date"));
                appoint.setSlot(rs.getString("A_Slot"));
                appoint.setReason(rs.getString("A_Reason"));
                appoint.setFeedback(rs.getString("A_Feedback"));
                appoint.setRate(rs.getInt("A_Rating"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return appoint;
    }
    
    //retrieve particular appointment from database for lecturer view
    public static userAppoint getAppointByStd(int id){
        userAppoint appoint = new userAppoint();
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select student.Student_name, appointment.A_Date, appointment.A_slot, appointment.A_Reason from appointment inner join student on appointment.Student_ID = student.Student_ID where Appointment_ID = ?");
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                appoint.setStd(rs.getString("Student_name"));               
                appoint.setDate(rs.getString("A_Date"));
                appoint.setSlot(rs.getString("A_Slot"));
                appoint.setReason(rs.getString("A_Reason"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return appoint;
    }
    
    //retrieve particular appointment from database for lecturer view with feedback
    public static userAppoint getAppointByStdFb(int id){
        userAppoint appoint = new userAppoint();
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select student.Student_name, appointment.A_Date, appointment.A_slot, appointment.A_Reason, appointment.A_Feedback from appointment inner join student on appointment.Student_ID = student.Student_ID where Appointment_ID = ?");
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                appoint.setStd(rs.getString("Student_name"));               
                appoint.setDate(rs.getString("A_Date"));
                appoint.setSlot(rs.getString("A_Slot"));
                appoint.setReason(rs.getString("A_Reason"));
                appoint.setFeedback(rs.getString("A_Feedback"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return appoint;
    }
    
    //retrieve most recent appointment ID from database
    public static userAppoint getAppointID(String std){
        userAppoint appoint = new userAppoint();
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select MAX(Appointment_ID) from appointment where Student_ID = ?");
            ps.setString(1, std);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                appoint.setId(rs.getInt("MAX(Appointment_ID)"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return appoint;
    }
    
    //get all appointment that related to the student
    public static List<userAppoint> getStdAppoint(String std){
        List<userAppoint> listAppoint = new ArrayList<userAppoint>();
        
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select appointment.Appointment_ID, lecturer.L_name, appointment.A_Date, appointment.A_Slot, appointment.A_Feedback, appointment.A_Status from appointment inner join lecturer on lecturer.Lecturer_ID = appointment.Lecturer_ID where Student_ID = ?");
            ps.setString(1, std);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                userAppoint appoint = new userAppoint();  //create object to fill with user data
                appoint.setId(rs.getInt("Appointment_ID"));
                appoint.setLect(rs.getString("L_name"));
                appoint.setDate(rs.getString("A_Date"));
                appoint.setSlot(rs.getString("A_Slot"));
                appoint.setFeedback(rs.getString("A_Feedback"));
                appoint.setStatus(rs.getInt("A_Status"));
                listAppoint.add(appoint);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return listAppoint;
    }
    
    //get all appointment that related to the lecturer
    public static List<userAppoint> getLectAppoint(String lect){
        List<userAppoint> listAppoint = new ArrayList<userAppoint>();
        
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select appointment.Appointment_ID, student.Student_name, appointment.A_Date, appointment.A_Slot, appointment.A_Feedback, appointment.A_Status from appointment inner join student on student.Student_ID = appointment.Student_ID where Lecturer_ID = ?");
            ps.setString(1, lect);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                userAppoint appoint = new userAppoint();  //create object to fill with user data
                appoint.setId(rs.getInt("Appointment_ID"));
                appoint.setStd(rs.getString("Student_name"));
                appoint.setDate(rs.getString("A_Date"));
                appoint.setSlot(rs.getString("A_Slot"));
                appoint.setFeedback(rs.getString("A_Feedback"));
                appoint.setStatus(rs.getInt("A_Status"));
                listAppoint.add(appoint);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return listAppoint;
    }
    
    //update appointment status
    public static int updateStatus(userAppoint appoint){
        int status = 0;
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update appointment set A_Status = ? where Appointment_ID = ?");
            ps.setInt(1, appoint.getStatus());
            ps.setInt(2, appoint.getId());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
    
    //update appointment feedback
    public static int updateFeedback(userAppoint appoint){
        int status = 0;
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update appointment set A_Feedback = ? where Appointment_ID = ? and A_Feedback IS NULL");
            ps.setString(1, appoint.getFeedback());
            ps.setInt(2, appoint.getId());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
    
    //update appointment rating
    public static int updateRate(userAppoint appoint){
        int status = 0;
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("update appointment set A_Rating = ? where Appointment_ID = ? and A_Rating = 0");
            ps.setInt(1, appoint.getRate());
            ps.setInt(2, appoint.getId());
            
            status = ps.executeUpdate();
            
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
    
    //retrieve average rating score
    public static userAppoint avgRate(String lect){
        userAppoint appoint = new userAppoint();
        try{
            con = AppointDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select AVG(A_Rating) from appointment where Lecturer_ID = ? and A_Status = 3");
            ps.setString(1, lect);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                    appoint.setRate(rs.getInt("AVG(A_Rating)"));
                }
                con.close();
            }
            catch(Exception e){
                e.printStackTrace();
            }
            return appoint;
    }
}
