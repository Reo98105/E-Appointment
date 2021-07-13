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
        <c:set var="lectID" value="${sessionScope.sessionUn}"/>     <%--get lectID--%>
        
        <jsp:useBean id="lectDao" class="com.eappoint.dao.LecturerDao"/>
        <c:set var="key" value="${lectDao.getActiveKey(lectID)}"/>
        
        <%--check if photo exists--%>
        <c:choose>
            <c:when test="${key.getActivation() eq '1'}">
                <script>
                    alert('Please complete your profile detail!');   <%--output error message--%>
                    window.location = "updateProfile.jsp";   <%--Redirect to updateProfile page--%>
                </script>
            </c:when>
            <c:otherwise>
                <script>                    
                    window.location = "profileLect.jsp";   <%--Redirect to profileLect page--%>
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>
