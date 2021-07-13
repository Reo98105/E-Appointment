<%-- 
    Document   : processAdEdit
    Created on : May 6, 2020, 3:12:01 PM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processAdEdit</title>
    </head>
    <body>
        <c:set var="id" value="${param.id}"/> <%--get the value of id--%>
        <jsp:useBean id="lecturerDao" class="com.eappoint.dao.LecturerDao" scope="page"/>        
        
        <c:set var="lect" value="${lecturerDao.getUser(id)}"/> <%--get user and set into ulect--%>
        <c:set var="uname" value="${lect.getUsername()}"/> <%--get username from ulect--%>
        <c:set var="name" value="${lect.getName()}"/> <%--get name from ulect--%>
        <c:set var="sp" value="${lect.getSpeciality()}"/> <%--get speciality from ulect--%>
        <c:set var="act" value="${lect.getActivation()}"/> <%--get activation from ulect--%>
        
        <%--forward values to adEdit.jsp--%>
        <jsp:forward page="adEdit.jsp"> 
        <jsp:param name="uname" value="${uname}"/> 
        <jsp:param name="name" value="${name}"/> 
        <jsp:param name="sp" value="${sp}"/> 
        <jsp:param name="act" value="${act}"/>
        </jsp:forward>
        
    </body>
</html>
