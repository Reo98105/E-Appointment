<%-- 
    Document   : processCancel
    Created on : May 9, 2020, 3:25:46 PM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processCancel</title>
    </head>
    <body>
        <%--get appointment id and status code--%>
        <c:set var="id" value="${param.id}"/>
        <c:set var="cancel" value="3"/>
        
        <%--parse to int--%>
        <c:set var="appID" value="${Integer.parseInt(id)}"/>
        <c:set var="status" value="${Integer.parseInt(cancel)}"/>
        
        <%--set value to appoint bean--%>
        <jsp:useBean id="appointBean" class="com.eappoint.bean.userAppoint">
            <jsp:setProperty name="appointBean" property="id" value="${appID}"/>
            <jsp:setProperty name="appointBean" property="status" value="${status}"/>
        </jsp:useBean>
        
        <jsp:useBean id="appointDao" class="com.eappoint.dao.AppointDao" scope="page"/>
        <c:set var="status" value="${appointDao.updateStatus(appointBean)}"/>
        
        <c:choose>            
            <c:when test="${status > 0}">
                <script type='text/javascript'>
                    alert('Successfully canceled!');
                    location.replace("viewHistoryStd.jsp");
                </script>
            </c:when>
            <c:otherwise>
                <script type='text/javascript'>
                    alert('Something went wrong!');
                    location.replace("viewHistoryStd.jsp");
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>
