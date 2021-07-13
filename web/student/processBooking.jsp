<%-- 
    Document   : processBooking
    Created on : May 7, 2020, 6:58:45 PM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processBooking</title>
    </head>
    <body>
        <c:set var="lect" value="${param.id}"/>   <%--get id of lecturer--%>
        <c:set var="std" value="${sessionScope.sessionUn}"/> <%--get id of current student--%>
        <c:set var="reason" value="${param.reason}"/> <%--get reason from last page--%>
        <c:set var="slot" value="${param.slot}"/> <%--get slot value from last page--%>
        
        <%--set slot info into slot bean--%>
        <jsp:useBean id="slotBean" class="com.eappoint.bean.userSlot">
            <jsp:setProperty name="slotBean" property="lect" value="${lect}"/>
            <jsp:setProperty name="slotBean" property="slot" value="${slot}"/>
        </jsp:useBean>
        
        <%--get all slots info--%>
        <jsp:useBean id="slotDao" class="com.eappoint.dao.SlotDao"/>
        <c:set var="slotinfo" value="${slotDao.getSlot(slotBean)}"/>
        
        
        <%--check which slot the student pick--%>
        <c:choose>
            <c:when test="${slot eq 1}">
                <c:set var="date" value="${slotinfo.getDate()}"/>
            </c:when>
            <c:when test="${slot eq 2}">
                <c:set var="date" value="${slotinfo.getDate()}"/>
            </c:when>
            <c:when test="${slot eq 3}">
                <c:set var="date" value="${slotinfo.getDate()}"/>
            </c:when>
            <c:when test="${slot eq 4}">
                <c:set var="date" value="${slotinfo.getDate()}"/>
            </c:when>
            <c:when test="${slot eq 5}">
                <c:set var="date" value="${slotinfo.getDate()}"/>
            </c:when>
        </c:choose>
        
        <c:out value="${date}"/>
        
        <jsp:useBean id="appoint" class="com.eappoint.bean.userAppoint">
            <jsp:setProperty name="appoint" property="lect" value="${lect}"/>
            <jsp:setProperty name="appoint" property="std" value="${std}"/>
            <jsp:setProperty name="appoint" property="date" value="${date}"/>
            <jsp:setProperty name="appoint" property="slot" value="${slot}"/>
            <jsp:setProperty name="appoint" property="reason" value="${reason}"/>
        </jsp:useBean>
        
        <jsp:useBean id="appointDao" class="com.eappoint.dao.AppointDao" scope="page"/>
        <c:set var="status" value="${appointDao.save(appoint)}"/>
        
        <%--check if info registered into database--%>
        <c:choose>                                        
            <c:when test="${status > 0}">
                <c:set var="appID" value="${appointDao.getAppointID(std)}"/>
                <script type='text/javascript'>
                    alert('Successfully book! Please wait for approval!');
                    location = 'viewConfirmation.jsp?id=<c:out value="${appID.getId()}"/>';
                </script>
            </c:when>
            <c:otherwise>
                <script type='text/javascript'>
                    alert('Something got wrong! Please retry!');
                    location = 'viewBookAppoint.jsp?id=<c:out value="${lect}"/>';
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>
