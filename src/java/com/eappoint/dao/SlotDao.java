/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eappoint.dao;

import com.eappoint.bean.userSlot;
import com.eappoint.dbconnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Teoh
 */
public class SlotDao {
    
    private static Connection con;
    
    //get connection from DBConnection
    public static Connection getConnection(){
        con = DBConnection.getConnection();
        return con;
    }
    
    //add appointment into database
    public static int[] save(userSlot slot){
        int[] status = null;
        try{
            con = SlotDao.getConnection();
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("insert into slot(S_Date, S_Start, S_End, Lecturer_ID, S_number) values(?,?,?,?,?)");
            
            //slot 1 info
            ps.setString(1, slot.getDate1());
            ps.setString(2, slot.getTime1());
            ps.setString(3, slot.getTimes1());
            ps.setString(4, slot.getLect());
            ps.setString(5, slot.getSlot1());
            ps.addBatch();
            
            //slot 2 info
            ps.setString(1, slot.getDate2());
            ps.setString(2, slot.getTime2());
            ps.setString(3, slot.getTimes2());
            ps.setString(4, slot.getLect());
            ps.setString(5, slot.getSlot2());
            ps.addBatch();
            
            //slot 3 info
            ps.setString(1, slot.getDate3());
            ps.setString(2, slot.getTime3());
            ps.setString(3, slot.getTimes3());
            ps.setString(4, slot.getLect());
            ps.setString(5, slot.getSlot3());
            ps.addBatch();
            
            //slot 4 info
            ps.setString(1, slot.getDate4());
            ps.setString(2, slot.getTime4());
            ps.setString(3, slot.getTimes4());
            ps.setString(4, slot.getLect());
            ps.setString(5, slot.getSlot4());
            ps.addBatch();
            
            //slot 5 info
            ps.setString(1, slot.getDate5());
            ps.setString(2, slot.getTime5());
            ps.setString(3, slot.getTimes5());
            ps.setString(4, slot.getLect());
            ps.setString(5, slot.getSlot5());
            ps.addBatch();
            
            //create int[] to hold returned values
            status = ps.executeBatch();
            
            //explicitly commit statements to apply changes
            con.commit();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return status;
    }
    
    //update existing appointment in database by Lecturer_ID
    public static int[] update(userSlot slot){
        int[] status = null;
        try{
            con = SlotDao.getConnection();
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("update slot set S_Date = ?, S_Start = ?, S_End = ? where Lecturer_ID = ? and S_Number = ?");
            
            //slot 1 info
            ps.setString(1, slot.getDate1());
            ps.setString(2, slot.getTime1());
            ps.setString(3, slot.getTimes1());
            ps.setString(5, slot.getSlot1());
            ps.setString(4, slot.getLect());
            ps.addBatch();
            
            //slot 2 info
            ps.setString(1, slot.getDate2());
            ps.setString(2, slot.getTime2());
            ps.setString(3, slot.getTimes2());
            ps.setString(5, slot.getSlot2());
            ps.setString(4, slot.getLect());
            ps.addBatch();
            
            //slot 3 info
            ps.setString(1, slot.getDate3());
            ps.setString(2, slot.getTime3());
            ps.setString(3, slot.getTimes3());
            ps.setString(5, slot.getSlot3());
            ps.setString(4, slot.getLect());
            ps.addBatch();
            
            //slot 4 info
            ps.setString(1, slot.getDate4());
            ps.setString(2, slot.getTime4());
            ps.setString(3, slot.getTimes4());
            ps.setString(5, slot.getSlot4());
            ps.setString(4, slot.getLect());
            ps.addBatch();
            
            //slot 5 info
            ps.setString(1, slot.getDate5());
            ps.setString(2, slot.getTime5());
            ps.setString(3, slot.getTimes5());
            ps.setString(5, slot.getSlot5());
            ps.setString(4, slot.getLect());
            ps.addBatch();
            
            //create int[] to hold returned values
            status = ps.executeBatch();
            
            //explicitly commit statements to apply changes
            con.commit();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return status;
    }
    
    //retrieve all slots info by lecturer ID
    public static List<userSlot> getAllByLect(String lect){
        List<userSlot> listSlot = new ArrayList<userSlot>();
        
        try{
            con = SlotDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from slot where Lecturer_ID = ?");
            ps.setString(1, lect);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                userSlot slot = new userSlot();  //create object to fill with user data
                slot.setSlot(rs.getString("S_Number"));
                slot.setDate(rs.getString("S_Date"));
                slot.setStime(rs.getString("S_Start"));
                slot.setEtime(rs.getString("S_End"));
                listSlot.add(slot);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return listSlot;
    }
    
    //retrieve Lecturer_ID
    public static userSlot getLectID(String id){
        userSlot slot = new userSlot();
        
        try{
            con = SlotDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select Lecturer_ID from slot where Lecturer_ID = ?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                slot.setLect(rs.getString("Lecturer_ID"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return slot;
    }
    
    //retrieve slot info
    public static userSlot getSlot(userSlot slot){
        userSlot uslot = new userSlot();
        try{            
            con = SlotDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from slot where Lecturer_ID = ? and S_Number = ?");
            ps.setString(1, slot.getLect());
            ps.setString(2, slot.getSlot());
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                uslot.setDate(rs.getString("S_Date"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return uslot;
    }
    
    //retrieve slot1 info
    public static userSlot getSlot1(userSlot slot){
        userSlot uslot = new userSlot();
        try{            
            con = SlotDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from slot where Lecturer_ID = ? and S_Number = ?");
            ps.setString(1, slot.getLect());
            ps.setString(2, slot.getSlot1());
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                uslot.setDate1(rs.getString("S_Date"));
                uslot.setTime1(rs.getString("S_Start"));
                uslot.setTimes1(rs.getString("S_End"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return uslot;
    }
    
    //retrieve slot2 info
    public static userSlot getSlot2(userSlot slot){
        userSlot uslot = new userSlot();
        try{            
            con = SlotDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from slot where Lecturer_ID = ? and S_Number = ?");
            ps.setString(1, slot.getLect());
            ps.setString(2, slot.getSlot2());
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                uslot.setDate2(rs.getString("S_Date"));
                uslot.setTime2(rs.getString("S_Start"));
                uslot.setTimes2(rs.getString("S_End"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return uslot;
    }
    
    //retrieve slot2 info
    public static userSlot getSlot3(userSlot slot){
        userSlot uslot = new userSlot();
        try{            
            con = SlotDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from slot where Lecturer_ID = ? and S_Number = ?");
            ps.setString(1, slot.getLect());
            ps.setString(2, slot.getSlot3());
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                uslot.setDate3(rs.getString("S_Date"));
                uslot.setTime3(rs.getString("S_Start"));
                uslot.setTimes3(rs.getString("S_End"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return uslot;
    }
    
    //retrieve slot4 info
    public static userSlot getSlot4(userSlot slot){
        userSlot uslot = new userSlot();
        try{            
            con = SlotDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from slot where Lecturer_ID = ? and S_Number = ?");
            ps.setString(1, slot.getLect());
            ps.setString(2, slot.getSlot4());
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                uslot.setDate4(rs.getString("S_Date"));
                uslot.setTime4(rs.getString("S_Start"));
                uslot.setTimes4(rs.getString("S_End"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return uslot;
    }
    
    //retrieve slot5 info
    public static userSlot getSlot5(userSlot slot){
        userSlot uslot = new userSlot();
        try{            
            con = SlotDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from slot where Lecturer_ID = ? and S_Number = ?");
            ps.setString(1, slot.getLect());
            ps.setString(2, slot.getSlot5());
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                uslot.setDate5(rs.getString("S_Date"));
                uslot.setTime5(rs.getString("S_Start"));
                uslot.setTimes5(rs.getString("S_End"));
            }
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return uslot;
    }
}
