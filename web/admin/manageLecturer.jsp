<%-- 
    Document   : manageLecturer
    Created on : Apr 26, 2020, 11:51:47 PM
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
        <title>E-Appointment - Manage Lecturer</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - Manage Lecturer</h1>
        <div class='navbar'>
            <nav>
                <ul>
                    <li><a href='dashboardAd.jsp'>Homepage</a></li>
                    <li><a href='processViewProfile.jsp'>Profile</a></li>
                    <li class='dropdown'>
                        <a id='active' class='dropdownbtm' href='#'>Manage User</a>
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
        <table id='manager' border='1' align='center' width='40%'>
            <tr>
                <th>Username</th>
                <th>Name</th>
                <th>Speciality</th>
                <th>Status</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <jsp:useBean id="admin" class="com.eappoint.dao.AdminDao" scope="page"/>
            
            <%--loop used to loop through available lecturer info--%>            
            <c:forEach items="${admin.getLectById()}" var="userLecturer">
                <c:choose>
                    <c:when test="${userLecturer.getActivation() eq '1' || userLecturer.getActivation() eq '2'}">
                        <tr>
                            <td align='center'>
                                <c:out value="${userLecturer.getUsername()}"/>
                            </td>
                            <td align='center'>
                                <c:out value="${userLecturer.getName()}"/>
                            </td>
                            <td align='center'>
                                <c:out value="${userLecturer.getSpeciality()}"/>
                            </td>
                            <td align='center'>
                                <c:out value="Active"/>
                            </td>
                            <td align='center'>
                                <a href='processAdEdit.jsp?id=<c:out value="${userLecturer.getUsername()}"/>'>Edit</a>
                            </td>
                            <td align='center'>
                                <a href='adDeleteLect.jsp?id=<c:out value="${userLecturer.getUsername()}"/>'>Delete</a>
                            </td>
                        </tr>
                    </c:when>
                    <c:when test="${userLecturer.getActivation() eq 0}">
                        <tr>
                            <td align='center'>
                                <c:out value="${userLecturer.getUsername()}"/>
                            </td>
                            <td align='center'>
                                <c:out value="${userLecturer.getName()}"/>
                            </td>
                            <td align='center'>
                                <c:out value="${userLecturer.getSpeciality()}"/>
                            </td>
                            <td align='center'>
                                <c:out value="Inactive"/>
                            </td>
                            <td align='center'>
                                <a href='processAdEdit.jsp?id=<c:out value="${userLecturer.getUsername()}"/>'>Edit</a>
                            </td>
                            <td align='center'>
                                <a href='adDeleteLect.jsp?id=<c:out value="${userLecturer.getUsername()}"/>'>Delete</a>
                            </td>
                        </tr>
                    </c:when>
                </c:choose>
            </c:forEach>
        </table>
    </body>
</html>
