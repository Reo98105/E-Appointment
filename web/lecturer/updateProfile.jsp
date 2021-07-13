<%-- 
    Document   : updateProfile
    Created on : May 21, 2020, 9:56:08 AM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' type='text/css' href='..//rsc/util/css/mainStyle.css'/>
        <link rel='stylesheet' type='text/css' href='..//rsc/util/css/navbar.css'/>
        <style>
            body{
                margin: 0px
            }
        </style>
        <title>E-Appointment - Profile</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment Profile Update</h1>
         <div class='navbar'>
            <nav>
                <ul>
                    <li><a href='dashboardLect.jsp'>Homepage</a></li>
                    <li><a href='processViewProfile.jsp'>Profile</a></li>
                    <li class='dropdown'>
                        <a class='dropdownbtm' href='#'>Appointment</a>
                        <div id='dropdownbtm-content'>
                            <a href='viewManageDateTime.jsp'> Manage datetime</a>
                            <a href='viewDateTime.jsp'> View appointment slot</a>
                            <a href='viewHistoryLect.jsp'> Appointment history</a>
                        </div>
                    </li>
                    <li class='logout'><a href='..//processLogout.jsp'>Logout</a></li>
                </ul>
            </nav>
        </div>
        
        <center><h2>Profile Detail Update</h2></center>
        <center><small>*Contact admin for future detail updates</small></center>
        <br>
        <form action="/etjgroup12/processUpDetail" method="post" enctype="multipart/form-data">
            <table border="0" style="margin: auto">
                <input type="hidden" name="lectID" value="<c:out value="${sessionScope.sessionUn}"/>"/>
                <tr>
                    <th align="left">Photo: </th>
                    <td><input type="file" name="photo" size="40"/></td>
                </tr>
                <tr>
                    <th align="left">Qualification: </th>
                    <td><textarea name="qualification" cols='26' rows="5" style="resize: none" ></textarea></td>
                </tr>
                <tr>
                    <th align="left">Address: </th>
                    <td><textarea name="addr" cols='26' rows="5" style="resize: none" ></textarea></td>
                </tr>
                <tr>
                    <th align="left">Contact: </th>
                    <td><input type="text" name="contact" size="25"/></td>
                </tr>
            </table>
            <br>
            <center><input type="submit" value="Update"/></center>
        </form>
    </body>
</html>
