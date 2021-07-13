<%-- 
    Document   : adDeleteStd
    Created on : May 6, 2020, 10:55:18 PM
    Author     : Teoh
--%>

<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - adDeleteStd</title>
    </head>
    <body>        
        <c:set var="id" value="${param.id}"/>
        
        <jsp:useBean id="adminDao" class="com.eappoint.dao.AdminDao" scope="page"/>
        <c:set var="status" value="${adminDao.deleteStd(id)}"/>
        <c:choose>            
            <c:when test="${status > 0}">
                <c:remove var="std"/>       <%--delete dummy session--%>
                <script type='text/javascript'>
                    alert('Successfully deleted!');
                    location.replace("manageStudent.jsp");
                </script>
            </c:when>
            <c:otherwise>
                <c:remove var="std"/>       <%--delete dummy session--%>
                <script type='text/javascript'>
                    alert('Something went wrong!');
                    location.replace("manageStudent.jsp");
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>
