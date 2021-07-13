<%-- 
    Document   : processDateTime
    Created on : May 9, 2020, 4:44:18 PM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processDateTime</title>
    </head>
    <body>
        <%--get current user id--%>
        <c:set var="lectID" value="${sessionScope.sessionUn}"/>
        
        <%--get all slots value--%>
        <c:set var="slot1" value="${param.slot1}"/>
        <c:set var="date1" value="${param.date1}"/>
        <c:set var="time1" value="${param.time1}"/>
        <c:set var="end1" value="${param.times1}"/>
        
        <c:set var="slot2" value="${param.slot2}"/>
        <c:set var="date2" value="${param.date2}"/>
        <c:set var="time2" value="${param.time2}"/>
        <c:set var="end2" value="${param.times2}"/>
        
        <c:set var="slot3" value="${param.slot3}"/>
        <c:set var="date3" value="${param.date3}"/>
        <c:set var="time3" value="${param.time3}"/>
        <c:set var="end3" value="${param.times3}"/>
        
        <c:set var="slot4" value="${param.slot4}"/>
        <c:set var="date4" value="${param.date4}"/>
        <c:set var="time4" value="${param.time4}"/>
        <c:set var="end4" value="${param.times4}"/>
        
        <c:set var="slot5" value="${param.slot5}"/>
        <c:set var="date5" value="${param.date5}"/>
        <c:set var="time5" value="${param.time5}"/>
        <c:set var="end5" value="${param.times5}"/>
        
        <%--get misc value--%>
        <c:set var="misc" value="${param.misc}"/>
        
        <%--set misc value into lecturer bean--%>
        <jsp:useBean id="lectBean" class="com.eappoint.bean.userLecturer">
            <jsp:setProperty name="lectBean" property="username" value="${lectID}"/>
            <jsp:setProperty name="lectBean" property="misc" value="${misc}"/>            
        </jsp:useBean>
        
        <%--set value into slot bean--%>
        <jsp:useBean id="slot" class="com.eappoint.bean.userSlot">
            <jsp:setProperty name="slot" property="lect" value="${lectID}"/>
            
            <jsp:setProperty name="slot" property="slot1" value="${slot1}"/>
            <jsp:setProperty name="slot" property="date1" value="${date1}"/>
            <jsp:setProperty name="slot" property="time1" value="${time1}"/>
            <jsp:setProperty name="slot" property="times1" value="${end1}"/>
            
            <jsp:setProperty name="slot" property="slot2" value="${slot2}"/>
            <jsp:setProperty name="slot" property="date2" value="${date2}"/>
            <jsp:setProperty name="slot" property="time2" value="${time2}"/>
            <jsp:setProperty name="slot" property="times2" value="${end2}"/>
            
            <jsp:setProperty name="slot" property="slot3" value="${slot3}"/>
            <jsp:setProperty name="slot" property="date3" value="${date3}"/>
            <jsp:setProperty name="slot" property="time3" value="${time3}"/>
            <jsp:setProperty name="slot" property="times3" value="${end3}"/>
            
            <jsp:setProperty name="slot" property="slot4" value="${slot4}"/>
            <jsp:setProperty name="slot" property="date4" value="${date4}"/>
            <jsp:setProperty name="slot" property="time4" value="${time4}"/>
            <jsp:setProperty name="slot" property="times4" value="${end4}"/>
            
            <jsp:setProperty name="slot" property="slot5" value="${slot5}"/>
            <jsp:setProperty name="slot" property="date5" value="${date5}"/>
            <jsp:setProperty name="slot" property="time5" value="${time5}"/>
            <jsp:setProperty name="slot" property="times5" value="${end5}"/>
        </jsp:useBean>
        
        <jsp:useBean id="slotDao" class="com.eappoint.dao.SlotDao"/>
        <c:set var="currentID" value="${slotDao.getLectID(lectID)}"/>
        
        <jsp:useBean id="lectDao" class="com.eappoint.dao.LecturerDao"/>
        
        <%--insert into database if not exist--%>
        <c:choose>
            <c:when test="${currentID.getLect() ne lectID}">
                <c:set var="status" value="${slotDao.save(slot)}"/>
                <c:set var="miscStatus" value="${lectDao.updateMisc(lectBean)}"/>
                <c:choose>
                    <c:when test="${(status > '0') && (miscStatus > '0')}">
                        <script type='text/javascript'>     
                             alert('New appointment slot has been created!');<%--output successful message--%>
                             window.location = "viewDateTime.jsp";   <%--Redirect to viewDateTime page--%>
                        </script>
                    </c:when>
                </c:choose>                
            </c:when>
            <c:when test="${currentID.getLect() eq lectID}">   <%--update if user exist in database--%>
                <c:set var="status" value="${slotDao.update(slot)}"/>
                <c:set var="miscStatus" value="${lectDao.updateMisc(lectBean)}"/>
                <c:choose>
                    <c:when test="${(status > '0') && (miscStatus > '0')}">
                        <script type='text/javascript'>     
                             alert('Appointment slot has been updated!');<%--output successful message--%>
                             window.location = "viewDateTime.jsp";   <%--Redirect to viewDateTime page--%>
                        </script>
                    </c:when>
                </c:choose>                
            </c:when>
        </c:choose>
    </body>
</html>
