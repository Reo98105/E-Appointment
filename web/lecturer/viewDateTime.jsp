<%-- 
    Document   : viewDateTime
    Created on : May 11, 2020, 10:50:06 PM
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
        <title>E-Appointment - View Slot</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - View Appointment Slot</h1>
        <div class='navbar'>
            <nav>
                <ul>
                    <li><a href='dashboardLect.jsp'>Homepage</a></li>
                    <li><a href='processViewProfile.jsp'>Profile</a></li>
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
        
        <h2 align="center">Appointment slot</h2>
        
        <%--get current user ID--%>
        <c:set var="lectID" value="${sessionScope.sessionUn}"/>
        
        <%--set value for slots number--%>
        <c:set var="s1" value="1"/>
        <c:set var="s2" value="2"/>
        <c:set var="s3" value="3"/>
        <c:set var="s4" value="4"/>
        <c:set var="s5" value="5"/>
        
        <%--set value into userSlot bean--%>
        <jsp:useBean id="slot" class="com.eappoint.bean.userSlot">
            <jsp:setProperty name="slot" property="lect" value="${lectID}"/>
            <jsp:setProperty name="slot" property="slot1" value="${s1}"/>
            <jsp:setProperty name="slot" property="slot2" value="${s2}"/>
            <jsp:setProperty name="slot" property="slot3" value="${s3}"/>
            <jsp:setProperty name="slot" property="slot4" value="${s4}"/>
            <jsp:setProperty name="slot" property="slot5" value="${s5}"/>
        </jsp:useBean>
        
        <%--get all slots info by using slotDao--%>
        <jsp:useBean id="slotDao" class="com.eappoint.dao.SlotDao"/>
        <c:set var="slot1" value="${slotDao.getSlot1(slot)}"/>
        <c:set var="slot2" value="${slotDao.getSlot2(slot)}"/>
        <c:set var="slot3" value="${slotDao.getSlot3(slot)}"/>
        <c:set var="slot4" value="${slotDao.getSlot4(slot)}"/>
        <c:set var="slot5" value="${slotDao.getSlot5(slot)}"/>
        
        <%--get misc value--%>
        <jsp:useBean id="lectDao" class="com.eappoint.dao.LecturerDao"/>
        <c:set var="lect" value="${lectDao.getMisc(lectID)}"/>
        
        <table border="1" style="margin: auto">
            <tr>
                <th colspan="2">Slot 1</th>
                <th colspan="2">Slot 2</th>
                <th colspan="2">Slot 3</th>
            </tr>
            <tr>
                <th>Date: </th>
                <td><c:out value="${slot1.getDate1()}"/></td>
                <th>Date: </th>
                <td><c:out value="${slot2.getDate2()}"/></td>
                <th>Date: </th>
                <td><c:out value="${slot3.getDate3()}"/></td>
            </tr>
            <tr>
                <th>Start Time: </th>
                <td><c:out value="${slot1.getTime1()}"/></td>
                <th>Start Time: </th>
                <td><c:out value="${slot2.getTime2()}"/></td>
                <th>Start Time: </th>
                <td><c:out value="${slot3.getTime3()}"/></td>
            </tr>
            <tr>
                <th>End Time: </th>
                <td><c:out value="${slot1.getTimes1()}"/></td>
                <th>End Time: </th>
                <td><c:out value="${slot2.getTimes2()}"/></td>
                <th>End Time: </th>
                <td><c:out value="${slot3.getTimes3()}"/></td>
            <tr>
                <th colspan="2">Slot 4</th>
                <th colspan="2">Slot 5</th>
                <th colspan="2">Misc.</th>
            </tr>
            <tr>
                <th>Date: </th>
                <td><c:out value="${slot4.getDate4()}"/></td>
                <th>Date: </th>
                <td><c:out value="${slot5.getDate5()}"/></td> 
                <td colspan="2" rowspan="3" style="text-align: center"><c:out value="${lect.getMisc()}"/></td>                   
            </tr>
            <tr>
                <th>Start Time: </th>
                <td><c:out value="${slot4.getTime4()}"/></td>
                <th>Start Time: </th>
                <td><c:out value="${slot5.getTime5()}"/></td>
            </tr>
            <tr>
                <th>End Time: </th>
                <td><c:out value="${slot4.getTimes4()}"/></td>
                <th>End Time: </th>
                <td><c:out value="${slot5.getTimes5()}"/></td>
            </tr>
        </table>
        <br>
        <form action="viewManageDateTime.jsp">
            <center><input type="submit" value="Manage"/></center>
        </form>
    </body>
</html>
