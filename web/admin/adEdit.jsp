<%-- 
    Document   : adEdit
    Created on : May 6, 2020, 6:59:54 PM
    Author     : Teoh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - Admin Edit</title>
        <link rel='stylesheet' type='text/css' href='..//rsc/util/css/mainStyle.css'/>
        <link rel='stylesheet' type='text/css' href='..//rsc/util/css/navbar.css'/>
        <style>
            body{
                margin: 0px
            }
        </style>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment Update Lecturer</h1>
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
        <br><br>
        <form action='processAdUpdate.jsp' method='post'>
            <table border='0' align='center'>
                <tr>
                    <th align='left'>User ID: </th>
                    <td><input type='hidden' name='un' value='${param.uname}'/>${param.uname}</td>
                </tr>
                <tr>
                    <th align='left'>User name: </th>
                    <td><input type='text' name='name' value='${param.name}'/></td>
                </tr>
                <tr>
                    <th align='left'>User speciality: </th>
                    <td><input type='text' name='sp' value='${param.sp}'/></td>
                </tr>
                <tr>
                    <th align='left'>Account Status: </th>
                    <td>
                        <select id='key' name='key'>
                            <option value='1'>Active</option>
                            <option value='0' selected="selected">Not active</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <center><input type='submit' name='BtnSubmit' value='Save' size='50'/></center>
        </form>
    </body>
</html>
