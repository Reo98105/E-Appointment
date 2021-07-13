<%-- 
    Document   : viewResult
    Created on : May 7, 2020, 8:43:25 PM
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
        <title>E-Appointment - Result</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - Result</h1>
        <div class='navbar'>
            <nav>
                <ul>
                    <li><a href='dashboardStd.jsp'>Homepage</a></li>
                    <li><a href='processViewProfile.jsp'>Profile</a></li>
                    <li class='dropdown'>
                        <a id='active' class='dropdownbtm' href='#'>Appointment</a>
                        <div id='dropdownbtm-content'>
                            <a href='searchAppoint.jsp'> Search</a>
                            <a href='viewHistory.jsp'> Appointment history</a>
                        </div>
                    </li>
                    <li class='logout'><a href='..//processLogout.jsp'>Logout</a></li>
                </ul>
            </nav>
        </div>
        
        <c:set var="sp" value="${param.sp}"/>  <%--get value of sp--%>
        <c:set var="location" value="${param.location}"/>  <%--get value of location--%>
        
        <%--set value into lecturerDao--%>
        <jsp:useBean id="ulect" class="com.eappoint.bean.userLecturer">
            <jsp:setProperty name="ulect" property="speciality" value="${sp}"/>
            <jsp:setProperty name="ulect" property="location" value="${location}"/>
        </jsp:useBean>
        <h2 align="center">Search Result</h2>
        <br>
        <table id='result' border="1">
            <tr>
                <th>Lecturer photo</th>
                <th>Name</th>
                <th>Qualification</th>
                <th>Location</th>
                <th>Available slot</th>
                <th>Action</th>
            </tr>
        <jsp:useBean id="lectDao" class="com.eappoint.dao.LecturerDao"/>
        <c:forEach items="${lectDao.getUserRs(ulect)}" var="list">
            <tr>
                <td><img src="data:image/jpg;base64,<c:out value="${list.getPhoto()}"/>" width="100px" height="125px"/></td>
                <td><c:out value="${list.getName()}"/></td>
                <td><c:out value="${list.getQualification()}"/></td>
                <td><c:out value="${list.getLocation()}"/></td>
                <td>
                <jsp:useBean id="slotDao" class="com.eappoint.dao.SlotDao"/>
                    <c:forEach items="${slotDao.getAllByLect(list.getUsername())}" var="slot">
                        <ul>
                            <li>
                                Slot <c:out value="${slot.getSlot()}"/> - <c:out value="${slot.getDate()}"/> (<c:out value="${slot.getStime()}"/> - <c:out value="${slot.getEtime()}"/>)
                            </li>
                        </ul>                
                    </c:forEach>
                </td>
                <td align="center"><a href='viewAppointDetail.jsp?id=<c:out value="${list.getUsername()}"/>'>Detail</a></td>
            </tr>
        </c:forEach>
        </table>
    </body>
</html>
