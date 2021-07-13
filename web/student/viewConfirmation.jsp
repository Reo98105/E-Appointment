<%-- 
    Document   : viewConfirmation
    Created on : May 8, 2020, 6:04:33 PM
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
        <title>E-Appointment - Slips Detail</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - Slips</h1>
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
        <div id='prtContent'>
        <center><h2>Appointment slips detail</h2></center>
        <br>
        <c:set var="appID" value="${param.id}"/>
        <jsp:useBean id="appointDao" class="com.eappoint.dao.AppointDao"></jsp:useBean>
        <c:set var="appoint" value="${appointDao.getAppointById(appID)}"/>        
        <table border="1" style="border-collapse: collapse; margin: auto;">
            <tr>
                <th align="left">Lecturer name: </th>
                <td><c:out value="${appoint.getLect()}"/></td>
            </tr>
            <tr>
                <th align="left">Lecturer address: </th>
                <td><c:out value="${appoint.getAddress()}"/></td>
            </tr>
            <tr>
                <th align="left">Appointment date: </th>
                <td><c:out value="${appoint.getDate()}"/></td>
            </tr>
            <tr>
                <th align="left">Appointment slot: </th>
                <td><c:out value="${appoint.getSlot()}"/></td>
            </tr>
            <tr>
                <th align="left">Appointment reason: </th>
                <td><c:out value="${appoint.getReason()}"/></td>
            </tr>
        </table>            
        </div>
        <br><br>
        <center><button type="submit" onclick="printTable()">Print</button></center>
        
        <script type="text/javascript">
            function printTable(){
            var prtTable = document.getElementById("prtContent");
            var WinPrint = window.open('','','left=0,top=0,width=800,height=900,status=0');
            WinPrint.document.write(prtTable.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
        </script>
        
    </body>
</html>
