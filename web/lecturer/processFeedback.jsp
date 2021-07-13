<%-- 
    Document   : processFeedback
    Created on : May 13, 2020, 9:53:03 PM
    Author     : Teoh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processFeedback</title>
    </head>
    <body>
        <%--get feedback values--%>
        <c:set var="feedback" value="${param.fb}"/>
        <c:set var="id" value="${param.id}"/>
        <c:set var="acceptedf" value="2"/>
        
        <%--parse to int--%>
        <c:set var="status" value="${Integer.parseInt(acceptedf)}"/>
        
        <jsp:useBean id="appointBean" class="com.eappoint.bean.userAppoint">
            <jsp:setProperty name="appointBean" property="feedback" value="${feedback}"/>
            <jsp:setProperty name="appointBean" property="id" value="${id}"/>
            <jsp:setProperty name="appointBean" property="status" value="${status}"/>
        </jsp:useBean>
        
        <jsp:useBean id="appointDao" class="com.eappoint.dao.AppointDao"/>
        <c:set var="status" value="${appointDao.updateFeedback(appointBean)}"/>
        <c:set var="statusUp" value="${appointDao.updateStatus(appointBean)}"/>
        
        <c:choose>
            <c:when test="${(status > '0') && (statusUp > '0')}">
                <script type='text/javascript'>
                    alert('Feedback has been sent!');
                    location = 'viewDetailLect.jsp?id=<c:out value="${id}"/>';
                </script>
            </c:when>
            <c:otherwise>
                <script type='text/javascript'>
                    alert('Something went wrong!');
                    location = 'viewDetailFeedBack.jsp?id=<c:out value="${id}"/>';
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>
