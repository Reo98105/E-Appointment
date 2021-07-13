<%-- 
    Document   : profileAd
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
                    <li><a id='active' href='dashboardAd.jsp'>Homepage</a></li>
                    <li><a href='processViewProfile.jsp'>Profile</a></li>
                    <li class='dropdown'>
                        <a class='dropdownbtm' href='#'>Manage User</a>
                        <div id='dropdownbtm-content'>
                            <a href='manageLecturer.jsp'>Lecturer</a>
                            <a href='manageStudent.jsp'>Student</a>
                        </div>
                    </li>
                    <li class='logout'><a href='..//processLogout.jsp'>Logout</a></li>
                </ul>
            </nav>
        </div>
       
       <%--get current userID--%>
       <c:set var="userID" value="${sessionScope.sessionUn}"/>
       <jsp:useBean id="adDao" class="com.eappoint.dao.AdminDao"/>
       <c:set var="ad" value="${adDao.getUser(userID)}"/>
        <center><h2>Profile Details</h2></center>
       <table id='noBorder' align="center" style="border: 1px solid black">
           <tr>
               <th align="left">User ID:</th>
               <td>${userID}</td>               
           </tr>
           <tr >
               <th align="left">Name: </th>
               <td>${ad.getName()}</td>               
           </tr>
       </table>
           <br>
       <form action="updatePass.jsp?id=<c:out value="${userID}"/>" method="post">
           <center><input type="submit" value="Change password"/></center>
       </form>
    </body>
</html>
