<%-- 
    Document   : processAdUpdate
    Created on : May 6, 2020, 7:09:43 PM
    Author     : Teoh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processAdUpdate</title>
    </head>
    <body>
        <c:set var="un" value="${param.un}"/> <%--get the value of username--%>
        <c:set var="name" value="${param.name}"/> <%--get the value of name--%>
        <c:set var="sp" value="${param.sp}"/> <%--get the value of sp--%>
        <c:set var="act" value="${param.key}"/> <%--get the value of activation key--%>
        
        <jsp:useBean id="ulect" class="com.eappoint.bean.userLecturer" scope="page">
            <jsp:setProperty name="ulect" value="${un}" property="username"/>
            <jsp:setProperty name="ulect" value="${name}" property="name"/>
            <jsp:setProperty name="ulect" value="${sp}" property="speciality"/>
            <jsp:setProperty name="ulect" value="${act}" property="activation"/>
        </jsp:useBean>
        
        <jsp:useBean id="adminDao" class="com.eappoint.dao.AdminDao" scope="page"/>
        <c:set var="status" value="${adminDao.updateLect(ulect)}"/>
        <%--check if data is updated into database--%>
        <c:choose>
            <c:when test="${status > 0}">
                <script type='text/javascript'>
                    alert('Successfully updated!');
                    location = 'manageLecturer.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script type='text/javascript'>
                    alert('Something went wrong!');
                    location = 'manageLecturer.jsp';
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>
