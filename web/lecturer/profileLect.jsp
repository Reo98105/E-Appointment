<%-- 
    Document   : profileLect
    Created on : May 21, 2020, 6:50:32 AM
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
       <h1 id='DashTitle'>E-Appointment Profile</h1>
         <div class='navbar'>
            <nav>
                <ul>
                    <li><a href='dashboardLect.jsp'>Homepage</a></li>
                    <li><a id='active' href='processViewProfile.jsp'>Profile</a></li>
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
       
       <%--get current userID--%>
       <c:set var="userID" value="${sessionScope.sessionUn}"/>
       <jsp:useBean id="lectDao" class="com.eappoint.dao.LecturerDao"/>
       <c:set var="lect" value="${lectDao.getUser(userID)}"/>
       <c:set var="lectPhoto" value="${lectDao.getLectPhoto(userID)}"/>
        <center><h2>Profile Details</h2></center>
       <table id='noBorder' align="center" style="border: 1px solid black">
           <tr>
               <td rowspan="7"><img src="data:image/jpg;base64,<c:out value="${lectPhoto.getPhoto()}"/>" width="200px" height="225px"/></td>
           </tr>
           <tr>
               <th align="left">User ID:</th>
               <td>${userID}</td>               
           </tr>
           <tr >
               <th align="left">Name: </th>
               <td>${lect.getName()}</td>               
           </tr>
           <tr>
               <th align="left">Speciality: </th>
               <td>${lect.getSpeciality()}</td>               
           </tr>
           <tr>
               <th align="left">Qualification: </th>
               <td>${lect.getQualification()}</td>               
           </tr>
           <tr>
               <th align="left">Address: </th>
               <td>${lect.getLocation()}</td>               
           </tr>
           <tr>
               <th align="left">Contact: </th>
               <td>${lect.getContact()}</td>
           </tr>
       </table>
           <br>
       <form action="updatePass.jsp?id=<c:out value="${userID}"/>" method="post">
           <center><input type="submit" value="Change password"/></center>
       </form>
    </body>
</html>
