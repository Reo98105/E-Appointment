<%-- 
    Document   : updatePass
    Created on : May 21, 2020, 9:31:30 PM
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
        <title>E-Appointment - Update Password</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment Password Update</h1>
         <div class='navbar'>
            <nav>
                <ul>
                    <li><a href='dashboardLect.jsp'>Homepage</a></li>
                    <li><a id="active" href='processViewProfile.jsp'>Profile</a></li>
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
        <center><h2>Change Password</h2></center>
        <c:set var="lectID" value="${sessionScope.sessionUn}"/>
        <jsp:useBean id="lectDao" class="com.eappoint.dao.LecturerDao"/>
        <c:set var="lect" value="${lectDao.getUser(lectID)}"/>
        
        <form action="processUpPass.jsp" method='post'>
            <table border='0' align='center'>
                <tr>
                    <th align='left'>User ID: </th>
                    <td><c:out value="${lectID}"/></td>
                </tr>
                <tr>
                    <th align='left'>User name: </th>
                    <td><c:out value="${lect.getName()}"/></td>
                </tr>
                <tr>
                    <th align='left'>Password: </th>
                    <td><input type='password' name='pass' size='20'/></td></td>
                </tr>
                <tr>
                    <th align='left'>re-type password: </th>
                    <td><input type='password' name='repass' size='20'/></td></td>
                </tr>
            </table>
            <center><input type="submit" value="submit"/></center>
        </form>
    </body>
</html>
