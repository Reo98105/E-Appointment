<%-- 
    Document   : viewAppointDetail
    Created on : May 7, 2020, 6:25:55 PM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>E-Appointment - viewAppointmentDetail</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - Appointment detail</h1>
        <div class='navbar'>
            <nav>
                <ul>
                    <li><a href='dashboardStd.jsp'>Homepage</a></li>
                    <li><a href='processViewProfile.jsp'>Profile</a></li>
                    <li class='dropdown'>
                        <a id='active' class='dropdownbtm' href='#'>Appointment</a>
                        <div id='dropdownbtm-content'>
                            <a href='searchAppoint.jsp'> Search</a>
                            <a href='viewHistoryStd.jsp'> Appointment history</a>
                        </div>
                    </li>
                    <li class='logout'><a href='..//processLogout.jsp'>Logout</a></li>
                </ul>
            </nav>
        </div>
        
        <c:set var="id" value="${param.id}"/>       <%--get lecturer id from last page--%>
        <jsp:useBean id="lectDao" class="com.eappoint.dao.LecturerDao"/>
        <c:set var="lect" value="${lectDao.getUserResult(id)}"/>
        
        <jsp:useBean id="appointDao" class="com.eappoint.dao.AppointDao"/>
        <c:set var="appoint" value="${appointDao.avgRate(id)}"/>
        
        <center><h2><c:out value="${lect.getName()}"/></h2></center>
        <form action="viewBookAppoint.jsp?id=<c:out value="${lect.getUsername()}"/>" method="post">
            <table id='result' border='1'>
                <tr>
                    <td colspan="2" align="center"><img src="data:image/jpg;base64,<c:out value="${lect.getPhoto()}"/>" width="200px" height="225px"/></td>   <%--get lecturer profile pic here--%>
                </tr>
                <tr>
                    <th align="left">Qualification: </th>
                    <td align="left"><c:out value="${lect.getQualification()}"/></td>
                </tr>
                <tr>
                    <th align="left">Contact details: </th>
                    <td align="left"><c:out value="${lect.getContact()}"/></td>
                </tr>
                <tr>
                    <th align="left">Location: </th>
                    <td align="left"><c:out value="${lect.getLocation()}"/></td>
                </tr>
                <tr>
                    <th align="left">Rating: </th>
                    <td align="left"><c:out value="${appoint.getRate()}"/> of 5</td>
                </tr>
                <tr>
                    <th align="left">Misc: </th>
                    <td align="left"><c:out value="${lect.getMisc()}"/></td>
                </tr>                                
            </table>
            <br><br>
            <center><input type='submit' name='BtnSubmit' value='Book me!' size='50'/></center>
        </form>
    </body>
</html>
