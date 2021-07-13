<%-- 
    Document   : dashboardLect
    Created on : Apr 26, 2020, 12:11:47 PM
    Author     : Teoh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>E-Appointment</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment Dashboard</h1>
         <div class='navbar'>
            <nav>
                <ul>
                    <li><a id='active' href='dashboardLect.jsp'>Homepage</a></li>
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
        <c:set var="lectID" value="${sessionScope.sessionUn}"/>
        <jsp:useBean id="lectDao" class="com.eappoint.dao.LecturerDao"/>
        <c:set var="lect" value="${lectDao.getUser(lectID)}"/>
        <h2>Welcome, <c:out value="${lect.getName()}"/></h2>
        <br>
        <center><h2 style = 'font-size:300%'>Work-In-Progress</h1></center>
    </body>
</html>
