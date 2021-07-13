<%-- 
    Document   : processRating
    Created on : May 14, 2020, 12:25:01 AM
    Author     : Teoh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processRating</title>
    </head>
    <body>
        <%--get rating values--%>
        <c:set var="rating" value="${param.rating}"/>
        <c:set var="id" value="${param.id}"/>
        <c:set var="accepted" value="3"/>
        <c:out value="${rating}"/>
        
        <%--parse to int--%>
        <c:set var="status" value="${Integer.parseInt(accepted)}"/>
        
        <jsp:useBean id="appointBean" class="com.eappoint.bean.userAppoint">
            <jsp:setProperty name="appointBean" property="rate" value="${rating}"/>
            <jsp:setProperty name="appointBean" property="id" value="${id}"/>
            <jsp:setProperty name="appointBean" property="status" value="${status}"/>
        </jsp:useBean>
        
        <%--update feedback and status--%>
        <jsp:useBean id="appointDao" class="com.eappoint.dao.AppointDao"/>
        <c:set var="status" value="${appointDao.updateRate(appointBean)}"/>
        <c:set var="statusUp" value="${appointDao.updateStatus(appointBean)}"/>
        
        <c:choose>
            <c:when test="${(status > '0') && (statusUp > '0')}">
                <script type='text/javascript'>
                    alert('Appointment rating has been updated!');
                    location = 'viewDetailRate.jsp?id=<c:out value="${id}"/>';
                </script>
            </c:when>
            <c:otherwise>
                <script type='text/javascript'>
                    alert('Something went wrong!');
                    location = 'viewDetailStd.jsp?id=<c:out value="${id}"/>';
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>
