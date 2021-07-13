/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eappoint.bean;

/**
 *
 * @author Teoh
 */
public class userLecturer {
    private String  name, username, password, Speciality, qualification, photo, location, contact, misc;
    private int activation;

    public String getName(){
        return name;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getSpeciality(){
        return Speciality;
    }
    
    public void setSpeciality(String Speciality){
        this.Speciality = Speciality;
    }
    
    //get and set activation key
    public int getActivation(){
        return activation;
    }
    
    public void setActivation(int activation){
        this.activation = activation;
    }
    
    public String getQualification(){
        return qualification;
    }
    
    public void setQualification(String qualification){
        this.qualification = qualification;
    }
    
    public String getPhoto(){
        return photo;
    }
    
    public void setPhoto(String photo){
        this.photo = photo;
    }
    
    public String getLocation(){
        return location;
    }
    
    public void setLocation(String location){
        this.location = location;
    }
    
    public String getContact(){
        return contact;
    }
    
    public void setContact(String contact){
        this.contact = contact;
    }
    
    public String getMisc(){
        return misc;
    }
    
    public void setMisc(String misc){
        this.misc = misc;
    }
}
