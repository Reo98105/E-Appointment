<%-- 
    Document   : dashboardAd
    Created on : Apr 26, 2020, 4:46:35 PM
    Author     : Teoh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='..//rsc/util/css/mainStyle.css'/>
        <link rel='stylesheet' type='text/css' href='..//rsc/util/css/navbar.css'/>
        <style>
            body{
                margin: 0px
            }
        </style>
        <title>Dashboard</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment Admin Dashboard</h1>
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
        <br>
        <c:set var="userID" value="${sessionScope.sessionUn}"/>
        <jsp:useBean id="adDao" class="com.eappoint.dao.AdminDao"/>
        <c:set var="ad" value="${adDao.getUser(userID)}"/>
        <h2>Welcome, <c:out value="${ad.getName()}"/></h2>
        <center><h2 style = 'font-size:300%'>Work-In-Progress</h1></center>
    </body>
</html>