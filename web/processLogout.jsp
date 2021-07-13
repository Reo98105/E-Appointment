<%-- 
    Document   : processLogout
    Created on : Apr 27, 2020, 10:20:37 PM
    Author     : Teoh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Appointment</title>
    </head>
    <body>
        <c:remove var="sessionUn"/>
        <script type='text/javascript'>
            alert('Successully logged out!');
            location = 'login.jsp';
        </script>
    </body>
</html>
