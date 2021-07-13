<%-- 
    Document   : processRegistration
    Created on : Apr 28, 2020, 11:55:40 AM
    Author     : Teoh
--%>

<%@page import="com.eappoint.dao.LecturerDao"%>
<%@page import="com.eappoint.dao.StudentDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>processRegistration</title>
    </head>
    <body>
        <c:set var="name" value="${param.name}"/>   <%--get the value of name--%>
        <c:set var="un" value="${param.username}"/> <%--get the value of username--%>
        <c:set var="pw" value="${param.pw}"/>       <%--get the value of password--%>
        <c:set var="role" value="${param.role}"/>   <%--get the value of role--%>
        <c:set var="DoB" value="${param.DoB}"/>     <%--get the value of DoB--%>
        <c:set var="spec" value="${param.speciality}"/> <%--get the value of speciality--%>
        <%--check role to register user--%>
        <c:choose>
            <c:when test="${role eq 'lecturer'}">
                <jsp:useBean id="ulect" class="com.eappoint.bean.userLecturer" scope="page">
                    <jsp:setProperty name="ulect" property="name" value="${name}"/>
                    <jsp:setProperty name="ulect" property="username" value="${un}"/>
                    <jsp:setProperty name="ulect" property="password" value="${pw}"/>
                    <jsp:setProperty name="ulect" property="speciality" value="${spec}"/>
                </jsp:useBean>
                
                <jsp:useBean id="lectDao" class="com.eappoint.dao.LecturerDao" scope="page"/>
                <c:set var="status" value="${lectDao.save(ulect)}"/>
                <%--check if info registered into database--%>
                <c:choose>                                        
                    <c:when test="${status > 0}">
                        <script type='text/javascript'>
                            alert('Successfully registered! Please wait for admin to approve.');
                            location = 'login.jsp';
                        </script>
                    </c:when>
                    <c:otherwise>
                        <script type='text/javascript'>
                            alert('Something got wrong! Please retry!');
                            location = 'registration.jsp';
                        </script>
                    </c:otherwise>
                </c:choose>
            </c:when>

            <c:when test="${role eq 'student'}">
                <jsp:useBean id="ustd" class="com.eappoint.bean.userStudent" scope="page">
                    <jsp:setProperty name="ustd" property="name" value="${name}"/>
                    <jsp:setProperty name="ustd" property="username" value="${un}"/>
                    <jsp:setProperty name="ustd" property="password" value="${pw}"/>
                    <jsp:setProperty name="ustd" property="doB" value="${DoB}"/>
                </jsp:useBean>
                
                <jsp:useBean id="stdDao" class="com.eappoint.dao.StudentDao" scope="page"/>
                <c:set var="status" value="${stdDao.save(ustd)}"/>
                <%--check if info registered into database--%>
                <c:choose>                    
                    <c:when test="${status > 0}">
                        <script type='text/javascript'>
                            alert('Successfully registered!');
                            location = 'login.jsp';
                        </script>
                    </c:when>
                    <c:otherwise>
                        <script type='text/javascript'>
                            alert('Something got wrong! Please retry!');
                            location = 'registration.jsp';
                        </script>
                    </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>
    </body>
</html>
