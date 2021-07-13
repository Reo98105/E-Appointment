<%-- 
    Document   : viewDetailLect
    Created on : May 7, 2020, 12:22:39 PM
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
        <title>Dashboard - Appointment Detail</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - Appointment Detail</h1>
        <div class='navbar'>
            <nav>
                <ul>
                    <li><a id='active' href='dashboardLect.jsp'>Homepage</a></li>
                    <li><a href='processViewProfile'>Profile</a></li>
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
        <center><h2>Appointment Detail</h2></center>
        
        <c:set var="id" value="${param.id}"/>       <%--get appointment id--%>
        <jsp:useBean id="appDao" class="com.eappoint.dao.AppointDao"/>
        <c:set var="app" value="${appDao.getAppointByStdFb(id)}"/>
        <table align="center" border="1">
            <tr>
                <th align="left">Student name:</th>
                <td><c:out value="${app.getStd()}"/></td>
            </tr>
            <tr>
                <th align="left">Book date:</th>
                <td><c:out value="${app.getDate()}"/></td>
            </tr>
            <tr>
                <th align="left">Slot:</th>
                <td><c:out value="${app.getSlot()}"/></td>
            </tr>
            <tr>
                <th align="left">Visit Reason:</th>
                <td><c:out value="${app.getReason()}"/></td>
            </tr>
            <tr>
                <th align="left">Feedback:</th>
                <td><c:out value="${app.getFeedback()}"/></textarea></td>
            </tr>
        </table>
        <br>
        <form action="viewHistoryLect.jsp">
            <center><input type="submit" value="Back"/></center>
        </form>
    </body>
</html>
