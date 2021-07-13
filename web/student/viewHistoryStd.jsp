<%-- 
    Document   : ViewHistoryStd
    Created on : May 8, 2020, 10:50:44 PM
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
        <title>E-Appointment - View History</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - History</h1>
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
        
        <center><h2>List of Appointment History</h2></center>
        
        <table id="result" border="1">
            <tr>
                <th>Lecturer name</th>
                <th>Book Date</th>
                <th>Slot</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <c:set var="std" value="${sessionScope.sessionUn}"/>    <%--get current std id by using session--%>
            <jsp:useBean id="appDao" class="com.eappoint.dao.AppointDao"/>
            <c:forEach items="${appDao.getStdAppoint(std)}" var="appoint">
                <c:choose>
                    <c:when test="${appoint.getStatus() eq 0}">  <%--pending--%>
                        <tr>
                            <td><c:out value="${appoint.getLect()}"/></td>
                            <td><c:out value="${appoint.getDate()}"/></td>
                            <td><c:out value="${appoint.getSlot()}"/></td>
                            <td><c:out value="Pending"/></td>
                            <td>
                                <a href='viewDetailStd.jsp?id=<c:out value="${appoint.getId()}"/>'>Detail</a> &nbsp;
                                <a href='processCancel.jsp?id=<c:out value="${appoint.getId()}"/>'>Cancel</a>
                            </td>                            
                        </tr>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${appoint.getStatus() eq 1}"> <%--Accepted w/o fb or rating--%>
                        <tr>
                            <td><c:out value="${appoint.getLect()}"/></td>
                            <td><c:out value="${appoint.getDate()}"/></td>
                            <td><c:out value="${appoint.getSlot()}"/></td>
                            <td><c:out value="Accepted"/></td>
                            <td><a href='viewDetailStd.jsp?id=<c:out value="${appoint.getId()}"/>'>Detail</a></td>
                        </tr>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${appoint.getStatus() eq 2}"> <%--Accepted w fb--%>
                        <tr>
                            <td><c:out value="${appoint.getLect()}"/></td>
                            <td><c:out value="${appoint.getDate()}"/></td>
                            <td><c:out value="${appoint.getSlot()}"/></td>
                            <td><c:out value="Accepted"/></td>
                            <td><a href='viewDetailFeed.jsp?id=<c:out value="${appoint.getId()}"/>'>Detail</a></td>
                        </tr>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${appoint.getStatus() eq 3}"> <%--accepted w rating & fb--%>
                        <tr>
                            <td><c:out value="${appoint.getLect()}"/></td>
                            <td><c:out value="${appoint.getDate()}"/></td>
                            <td><c:out value="${appoint.getSlot()}"/></td>
                            <td><c:out value="Accepted"/></td>
                            <td><a href='viewDetailRate.jsp?id=<c:out value="${appoint.getId()}"/>'>Detail</a></td>
                        </tr>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${appoint.getStatus() eq 4}"> <%--rejected--%>
                        <tr>
                            <td><c:out value="${appoint.getLect()}"/></td>
                            <td><c:out value="${appoint.getDate()}"/></td>
                            <td><c:out value="${appoint.getSlot()}"/></td>
                            <td><c:out value="Rejected"/></td>
                            <td><a href='viewDetailStd.jsp?id=<c:out value="${appoint.getId()}"/>'>Detail</a></td>
                        </tr>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${appoint.getStatus() eq 5}"> <%--Canceled--%>
                        <tr>
                            <td><c:out value="${appoint.getLect()}"/></td>
                            <td><c:out value="${appoint.getDate()}"/></td>
                            <td><c:out value="${appoint.getSlot()}"/></td>
                            <td><c:out value="Canceled"/></td>
                            <td><a href='viewDetailStd.jsp?id=<c:out value="${appoint.getId()}"/>'>Detail</a></td>
                        </tr>
                    </c:when>
                </c:choose>
            </c:forEach>
        </table>
    </body>
</html>
