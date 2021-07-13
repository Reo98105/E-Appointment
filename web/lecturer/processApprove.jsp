<%-- 
    Document   : processApprove
    Created on : May 13, 2020, 8:40:18 AM
    Author     : Teoh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processApprove</title>
    </head>
    <body>
        <%--get appointment id and status code--%>
        <c:set var="id" value="${param.id}"/>
        <c:set var="approve" value="1"/>
        
        <%--parse to int--%>
        <c:set var="appID" value="${Integer.parseInt(id)}"/>
        <c:set var="status" value="${Integer.parseInt(approve)}"/>
        
        <%--set those value into appoint bean--%>
        <jsp:useBean id="appointBean" class="com.eappoint.bean.userAppoint">
            <jsp:setProperty name="appointBean" property="id" value="${appID}"/>
            <jsp:setProperty name="appointBean" property="status" value="${status}"/>
        </jsp:useBean>
        
        <jsp:useBean id="appointDao" class="com.eappoint.dao.AppointDao"/>
        <c:set var="status" value="${appointDao.updateStatus(appointBean)}"/>
        
        <c:choose>
            <c:when test="${status > 0}">
                <script type='text/javascript'>
                    alert('Request has been approved!');
                    location = 'viewHistoryLect.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script type='text/javascript'>
                    alert('Something went wrong!');
                    location = 'viewHistoryLect.jsp';
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>
