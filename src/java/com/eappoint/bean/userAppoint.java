package com.eappoint.bean;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Teoh
 */
public class userAppoint {
    
    private String std, lect, date, slot, feedback, address, reason;
    private int id, status, rate;
    
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public String getStd(){
        return std;
    }
    
    public void setStd(String std){
        this.std = std;
    }
    
    public String getLect(){
        return lect;
    }
    
    public void setLect(String lect){
        this.lect = lect;
    }
    
    public String getDate(){
        return date;
    }
    
    public void setDate(String date){
        this.date = date;
    }
    
    public String getSlot(){
        return slot;
    }
    
    public void setSlot(String slot){
        this.slot = slot;
    }
    
    public String getFeedback(){
        return feedback;
    }
    
    public void setFeedback(String feedback){
        this.feedback = feedback;
    }
    
    public String getAddress(){
        return address;
    }
    
    public void setAddress(String address){
        this.address = address;
    }
    
    public int getStatus(){
        return status;
    }
    
    public void setStatus(int status){
        this.status = status;
    }
    
    public String getReason(){
        return reason;
    }
    
    public void setReason(String reason){
        this.reason = reason;
    }
    
    public int getRate(){
        return rate;
    }
    
    public void setRate(int rate){
        this.rate = rate;
    }
}
