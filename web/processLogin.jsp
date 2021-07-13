<%-- 
    Document   : processLogin
    Created on : Apr 26, 2020, 12:19:15 AM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>processLogin</title>
    </head>
    <body>
        <c:set var="un" value="${param.un}"/> <%--get the value of username--%>
        <c:set var="pw" value="${param.pw}"/> <%--get the value of password--%>
        <c:set var="role" value="${param.role}"/> <%--get the value of role--%>
        <jsp:useBean id="loginDao" class="com.eappoint.dao.LoginDao"/>
    
        <%--to check role--%>
        <c:choose>
            <c:when test="${role eq 'admin'}">
                <c:choose>
                    <c:when test="${loginDao.validateAd(un,pw)}">
                        <c:set var="sessionUn" value="${un}" scope="session"/>     <%--get username set it become session--%>
                        <script type='text/javascript'>     <%--output login successful message--%>
                            alert('Login Successful!');
                            window.location = "admin/dashboardAd.jsp"; <%--Redirect to dashboard--%>
                        </script>
                    </c:when>
                    <c:otherwise>
                        <script type='text/javascript'>     <%--output login unsuccessful message--%>
                            alert('Username or password are incorrect!');
                            window.location = "login.jsp";   <%--Redirect to login page--%>
                        </script>
                    </c:otherwise>
                </c:choose>
            </c:when>            
            <c:when test="${role eq 'student'}">
                <c:choose>
                    <c:when test="${loginDao.validateStd(un,pw)}">
                        <c:set var="sessionUn" value="${un}" scope="session"/>     <%--get username set it become session--%>
                        <script type='text/javascript'>     <%--output login successful message--%>
                            alert('Login Successful!');
                            window.location = "student/dashboardStd.jsp"; <%--Redirect to dashboard--%>
                        </script>
                    </c:when>
                    <c:otherwise>
                        <script type='text/javascript'>     <%--output login unsuccessful message--%>
                            alert('Username or password are incorrect!');
                            window.location = "login.jsp";   <%--Redirect to login page--%>
                        </script>
                    </c:otherwise>
                </c:choose>
            </c:when>                        
            <c:when test="${role eq 'lecturer'}">
                <c:choose>
                    <c:when test="${loginDao.validateLect(un,pw)}">
                        <jsp:useBean id="ulect" class="com.eappoint.bean.userLecturer" scope="page"/>
        
                        <c:set var="lect" value="${loginDao.getActivationKey(un)}"/>
                        <c:set var="key" value="${lect.getActivation()}"/>
                        <c:choose>
                            <c:when test="${key eq '2' || key eq '1'}">
                                <c:set var="sessionUn" value="${un}" scope="session"/>     <%--get username set it become session--%>
                                <script type='text/javascript'>     <%--output login successful message--%>
                                    alert('Login Successful!');
                                    window.location = "lecturer/dashboardLect.jsp"; <%--Redirect to dashboard--%>
                                </script>
                            </c:when>
                            <c:otherwise>
                                <script type='text/javascript'>     <%--output login unsuccessful message--%>
                                    alert('Account has not been approved! Please wait for approval!');
                                    window.location = "login.jsp";   <%--Redirect to login page--%>
                                </script>
                            </c:otherwise>
                        </c:choose>                       
                    </c:when>
                    <c:otherwise>
                        <script type='text/javascript'>     <%--output login unsuccessful message--%>
                            alert('Username or password are incorrect!');
                            window.location = "login.jsp";   <%--Redirect to login page--%>
                        </script>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:when test="${empty role}">
                <script type='text/javascript'>     <%--output login unsuccessful message--%>
                    alert('Please choose approperiate user type!');
                    window.location = "login.jsp";   <%--Redirect to login page--%>
                </script>
            </c:when>
        </c:choose>
    </body>
</html>
