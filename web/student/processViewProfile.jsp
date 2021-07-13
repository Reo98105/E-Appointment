<%-- 
    Document   : processViewProfile
    Created on : May 21, 2020, 6:28:34 AM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processViewProfile</title>
    </head>
    <body>
        <c:set var="userID" value="${sessionScope.sessionUn}"/>     <%--get userID--%>
        
        <jsp:useBean id="stdDao" class="com.eappoint.dao.StudentDao"/>
        <c:set var="uname" value="${stdDao.getUser(userID)}"/>
        <c:set var="name" value="${stdDao.getUser(userID)}"/>
        <c:set var="DoB" value="${stdDao.getUser(userID)}"/>
        
        <%--forward data to profileStd.jsp--%>
        <jsp:forward page="profileStd.jsp">
            <jsp:param name="un" value="${uname}"/>
            <jsp:param name="name" value="${name}"/>
            <jsp:param name="DoB" value="${DoB}"/>
        </jsp:forward>
    </body>
</html>
