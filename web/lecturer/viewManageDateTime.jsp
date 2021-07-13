<%-- 
    Document   : viewManageDateTime
    Created on : May 9, 2020, 3:47:25 PM
    Author     : Teoh
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
        <title>E-Appointment - Manage DateTime</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - DateTime</h1>
        <div class='navbar'>
            <nav>
                <ul>
                    <li><a href='dashboardLect.jsp'>Homepage</a></li>
                    <li><a href='processViewProfile'>Profile</a></li>
                    <li class='dropdown'>
                        <a id='active' class='dropdownbtm' href='#'>Appointment</a>
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
        <center><h2>Manage DateTime</h2></center>
        <center><small>*Office hours are 8am to 5pm</small></center>
        <center><small>*Leave slot as default if not available</small></center>
        <br>
        
        <form action="processDateTime.jsp" method="post">
            <table border="1" style="margin: auto">
                <tr>
                    <th colspan="2">Slot 1<input type="hidden" name="slot1" value="1"/></th>
                    <th colspan="2">Slot 2<input type="hidden" name="slot2" value="2"/></th>
                    <th colspan="2">Slot 3<input type="hidden" name="slot3" value="3"/></th>
                </tr>
                <tr>
                    <th>Date: </th>
                    <td><input type="date" name="date1" size="20" value="2000-01-01"/></td>
                    <th>Date: </th>
                    <td><input type="date" name="date2" size="20" value="2000-01-01"/></td>
                    <th>Date: </th>
                    <td><input type="date" name="date3" size="20" value="2000-01-01"/></td>
                </tr>
                <tr>
                    <th>Start Time: </th>
                    <td><input type="time" name="time1" size="20" min="8:00" max="17:00" value="00:00"></td>
                    <th>Start Time: </th>
                    <td><input type="time" name="time2" size="20" min="8:00" max="17:00" value="00:00"></td>
                    <th>Start Time: </th>
                    <td><input type="time" name="time3" size="20" min="8:00" max="17:00" value="00:00"></td>
                </tr>
                <tr>
                    <th>End Time: </th>
                    <td><input type="time" name="times1" size="20" min="8:00" max="17:00" value="00:00"></td>
                    <th>End Time: </th>
                    <td><input type="time" name="times2" size="20" min="8:00" max="17:00" value="00:00"></td>
                    <th>End Time: </th>
                    <td><input type="time" name="times3" size="20" min="8:00" max="17:00" value="00:00"></td>
                <tr>
                    <th colspan="2">Slot 4<input type="hidden" name="slot4" value="4"/></th>
                    <th colspan="2">Slot 5<input type="hidden" name="slot5" value="5"/></th>                   
                    <th colspan="2">Misc<input type="hidden"/></th>                   
                </tr>
                <tr>
                    <th>Date: </th>
                    <td><input type="date" name="date4" size="20" value="2000-01-01"/></td>
                    <th>Date: </th>
                    <td><input type="date" name="date5" size="20" value="2000-01-01"/></td>
                    <th rowspan="3">Input: </th>
                    <td rowspan="3"><textarea name="misc" cols='20' rows="6" style="resize: none" placeholder="Input misc here."></textarea></td>
                </tr>
                <tr>
                    <th>Start Time: </th>
                    <td><input type="time" name="time4" size="20" min="8:00" max="17:00" value="00:00"></td>
                    <th>Start Time: </th>
                    <td><input type="time" name="time5" size="20" min="8:00" max="17:00" value="00:00"></td>
                </tr>
                <tr>
                    <th>End Time: </th>
                    <td><input type="time" name="times4" size="20" min="8:00" max="17:00" value="00:00"></td>
                    <th>End Time: </th>
                    <td><input type="time" name="times5" size="20" min="8:00" max="17:00" value="00:00"></td>
                </tr>
            </table>
            <br>
            <center><input type="submit" value="Next"/></center>
        </form>
    </body>
</html>
