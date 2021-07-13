<%-- 
    Document   : viewBookAppoint
    Created on : May 8, 2020, 2:06:16 PM
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
        <title>E-Appointment - Booking</title>
    </head>
    <body>
        <h1 id='DashTitle'>E-Appointment - Booking</h1>
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
        <center><h2>Appointment reason and time</h2></center>
        <br><br>
        
        <c:set var="lectID" value="${param.id}"/>
        
        <%--set value for slots number--%>
        <c:set var="s1" value="1"/>
        <c:set var="s2" value="2"/>
        <c:set var="s3" value="3"/>
        <c:set var="s4" value="4"/>
        <c:set var="s5" value="5"/>
        
        <%--set value into userSlot bean--%>
        <jsp:useBean id="slot" class="com.eappoint.bean.userSlot">
            <jsp:setProperty name="slot" property="lect" value="${lectID}"/>
            <jsp:setProperty name="slot" property="slot1" value="${Integer.parseInt(s1)}"/>
            <jsp:setProperty name="slot" property="slot2" value="${Integer.parseInt(s2)}"/>
            <jsp:setProperty name="slot" property="slot3" value="${Integer.parseInt(s3)}"/>
            <jsp:setProperty name="slot" property="slot4" value="${Integer.parseInt(s4)}"/>
            <jsp:setProperty name="slot" property="slot5" value="${Integer.parseInt(s5)}"/>
        </jsp:useBean>
        
        <%--get all slots info by using slotDao--%>
        <jsp:useBean id="slotDao" class="com.eappoint.dao.SlotDao"/>
        <c:set var="slot1" value="${slotDao.getSlot1(slot)}"/>
        <c:set var="slot2" value="${slotDao.getSlot2(slot)}"/>
        <c:set var="slot3" value="${slotDao.getSlot3(slot)}"/>
        <c:set var="slot4" value="${slotDao.getSlot4(slot)}"/>
        <c:set var="slot5" value="${slotDao.getSlot5(slot)}"/>
        
        <form action="processBooking.jsp?id=<c:out value="${lectID}"/>" method="post">
            <table id='result'>
                <tr>
                    <th align="left">Visit reason: </th>
                    <td><textarea name="reason" cols='30' rows="3" style="resize: none" placeholder="State your reason."></textarea></td>
                </tr>
                <tr>
                    <th align="left">Appointment slot: </th>
                    <td>
                        <select id="slot" name="slot">
                            <option value="1">Slot1 - <c:out value="${slot1.getDate1()}"/>, <c:out value="${slot1.getTime1()}"/> - <c:out value="${slot1.getTimes1()}"/></option>
                            <option value="2">Slot2 - <c:out value="${slot2.getDate2()}"/>, <c:out value="${slot2.getTime2()}"/> - <c:out value="${slot2.getTimes2()}"/></option>
                            <option value="3">Slot3 - <c:out value="${slot3.getDate3()}"/>, <c:out value="${slot3.getTime3()}"/> - <c:out value="${slot3.getTimes3()}"/></option>
                            <option value="4">Slot4 - <c:out value="${slot4.getDate4()}"/>, <c:out value="${slot4.getTime4()}"/> - <c:out value="${slot4.getTimes4()}"/></option>
                            <option value="5">Slot5 - <c:out value="${slot5.getDate5()}"/>, <c:out value="${slot5.getTime5()}"/> - <c:out value="${slot5.getTimes5()}"/></option>
                        </select>                        
                    </td>
                </tr>
            </table>
            <br><br>
            <center><input type="submit" value="Submit"/></center>
        </form>
    </body>
</html>
