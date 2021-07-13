<%-- 
    Document   : login
    Created on : Apr 25, 2020, 12:31:03 AM
    Author     : Teoh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-appointment - Login</title>
        <link rel='stylesheet' type='text/css' href='rsc/util/css/mainStyle.css'/>
    </head>
    <body>
        <h1>E-Appointment System - Login</h1>
        <div id='loginForm'>
            <h2>Login</h2>
            <form action='processLogin.jsp' method='post'>
                <table id='login'>
                    <tr>
                        <td>Username: </td>
                        <td><input type='text' name='un' placeholder='eg. s52287' size='30'/></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type='password' name='pw' size='30'/></td>
                    </tr>
                </table>    
                <br>
                <input type='radio' name='role' id='admin' value='admin'/>
                <label for='student'>Admin</label>
                <input type='radio' name='role' id='lecturer' value='lecturer'/>
                <label for='lecturer'>Lecturer</label>
                <input type='radio' name='role' id='student' value='student'/>
                <label for='student'>Student</label>
                <br><br>
                <input type='submit' name='BtnSubmit' value='Login' size='50'/>
                <br>
                <p>Do not have an account? Register <a href='registration.jsp'>Here!</a></p>
            </form>
        </div>
    </body>
</html>
