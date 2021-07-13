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
        
        <jsp:useBean id="adDao" class="com.eappoint.dao.AdminDao"/>
        <c:set var="uname" value="${adDao.getUser(userID)}"/>
        <c:set var="name" value="${adDao.getUser(userID)}"/>
        
        <%--forward data to profileAd.jsp--%>
        <jsp:forward page="profileAd.jsp">
            <jsp:param name="un" value="${uname}"/>
            <jsp:param name="name" value="${name}"/>
        </jsp:forward>
    </body>
</html>
