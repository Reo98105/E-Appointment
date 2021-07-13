/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eappoint.process;

import com.eappoint.dbconnection.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Teoh
 */

@MultipartConfig(maxFileSize = 16177215)    //upload file's size up to 16MB
public class processUpDetail extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        //get value of textfields
        String lectID = request.getParameter("lectID");
        String qualification = request.getParameter("qualification");
        String addr = request.getParameter("addr");
        String contact = request.getParameter("contact");
        int key = 2;
        
        InputStream iS = null;  //input stream of the upload file
        
        //obtain the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        //print info for debugging
        if(filePart != null){
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            
            //obtains input stream of the upload file
            iS = filePart.getInputStream();
        }
        
        //connect to database
        try{
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("update lecturer set L_qualification = ?, L_address = ?, L_Contact = ?, L_photo = ?, Active_Key = ? where Lecturer_ID = ?");
            ps.setString(1, qualification);
            ps.setString(2, addr);
            ps.setString(3, contact);
            ps.setInt(5, key);
            ps.setString(6, lectID);
            
            if(iS != null){
                //fetch input stream of the uploaded file for the blob column
                ps.setBlob(4, iS);
            }
            
            //send the statement to the database server
            int row = ps.executeUpdate();
            if(row > 0){
                out.println("<script>");
                out.println("alert(File successfully uploaded and details saved into database!)");
                out.println("</script>");
            }
            
            con.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        response.sendRedirect("lecturer/profileLect.jsp");
    }
}
