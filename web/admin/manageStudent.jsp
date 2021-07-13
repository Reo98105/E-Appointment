<%-- 
    Document   : manageStudent
    Created on : Apr 27, 2020, 10:33:42 PM
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
        <title>E-Appointment - Manage Student</title>
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
                <th>Date Of Birth</th>
                <th>Delete</th>
            </tr>
            
            <jsp:useBean id="admin" class="com.eappoint.dao.AdminDao" scope="page"/>
            
            
            <%--loop used to loop through available lecturer info--%>            
            <c:forEach items="${admin.getStdById()}" var="userStudent">                   
                <tr>
                    <td align='center'>
                        <c:out value="${userStudent.getUsername()}"/>
                    </td>
                    <td align='center'>
                        <c:out value="${userStudent.getName()}"/>
                    </td>
                    <td align='center'>
                        <c:out value="${userStudent.getDoB()}"/>
                    </td>
                    <td align='center'>
                        <a href='adDeleteStd.jsp?id=<c:out value="${userStudent.getUsername()}"/>'>Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
