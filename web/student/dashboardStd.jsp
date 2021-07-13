<%-- 
    Document   : dashboardStd
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
        <title>E-Appointment Dashboard</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment Dashboard</h1>
        <div class='navbar'>
            <nav>
                <ul>
                    <li><a id='active' href='dashboardStd.jsp'>Homepage</a></li>
                    <li><a href='processViewProfile.jsp'>Profile</a></li>
                    <li class='dropdown'>
                        <a class='dropdownbtm' href='#'>Appointment</a>
                        <div id='dropdownbtm-content'>
                            <a href='searchAppoint.jsp'> Search</a>
                            <a href='viewHistoryStd.jsp'> Appointment history</a>
                        </div>
                    </li>
                    <li class='logout'><a href='..//processLogout.jsp'>Logout</a></li>
                </ul>
            </nav>
        </div>
        <br>
        <c:set var="userID" value="${sessionScope.sessionUn}"/>
        <jsp:useBean id="stdDao" class="com.eappoint.dao.StudentDao"/>
        <c:set var="std" value="${stdDao.getUser(userID)}"/>
        <h2>Welcome, <c:out value="${std.getName()}"/></h2>
        <br><br><br>
        <center><a href="searchAppoint.jsp"><img border="0" alt="search appointment" src="..//rsc/img/search_icon.png" width="15%" height="15%"></a></center>
    </body>
</html>
