<%-- 
    Document   : searchAppoint
    Created on : May 7, 2020, 8:26:02 PM
    Author     : type001
--%>

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
        <title>E-Appointment - Search</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - Search</h1>
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
        <br>
        <center><h2>Search lecturer or location</h2></center>
        <br>
        <form action="viewResult.jsp" method="post">
            <table id="result">
                <tr>
                    <th align="left">Lecturer speciality: </th>
                    <td><input type="text" name="sp" size="25" required></td> 
                </tr>
                <tr>
                    <th align="left">Location: </th>
                    <td><input type="text"  name="location" size="25" required></td> 
                </tr>
            </table>
            <br><br>
            <center><input type="submit" value="Search"></center>
        </form>
    </body>
</html>
