<%-- 
    Document   : processUpPass
    Created on : May 21, 2020, 10:34:52 PM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment - processUpPass</title>
    </head>
    <body>
        <c:set var="userID" value="${sessionScope.sessionUn}"/>
        <c:set var="pass" value="${param.pass}"/>
        <c:set var="repass" value="${param.repass}"/>
        <c:choose>
            <c:when test="${pass eq repass}">
                <jsp:useBean id="uAd" class="com.eappoint.bean.userAdmin">
                    <jsp:setProperty name="uAd" property="username" value="${userID}"/>
                    <jsp:setProperty name="uAd" property="password" value="${pass}"/>
                </jsp:useBean>
                <jsp:useBean id="adDao" class="com.eappoint.dao.AdminDao"/>
                <c:set var="status" value="${adDao.updatePass(uAd)}"/>
                <c:choose>
                    <c:when test="${status > 0}">
                        <script type='text/javascript'>     <%--output update successful message--%>
                            alert('Password updated!');
                            window.location = "profileAd.jsp"; <%--Redirect to profileLect--%>
                        </script>
                    </c:when>
                    <c:otherwise>
                        <script type='text/javascript'>     <%--output error message--%>
                            alert('Something went wrong, try again later!');
                            window.location = "profileAd.jsp"; <%--Redirect to profileLect--%>
                        </script>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <script type='text/javascript'>     <%--output error message--%>
                    alert('Password not match!');
                    window.location = "updatePass.jsp"; <%--Redirect to updatePass.jsp--%>
                </script>
            </c:otherwise>
        </c:choose>        
    </body>
</html>
