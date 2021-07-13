<%-- 
    Document   : registration
    Created on : Apr 28, 2020, 11:41:33 AM
    Author     : Teoh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' type='text/css' href='rsc/util/css/mainStyle.css'/>
        <script src='rsc/util/js/showHidden.js'></script>
        <title>E-Appointment - Registration</title>
        <style>
            table{
                margin-left: 38%;
            }
        </style>
    </head>
    <body>
        <h1>E-Appointment System</h1>
        <div id='registerForm'>
            <h2>Registration</h2>
            <form action='processRegistration.jsp' method='post'>
                <table>
                    <tr>
                        <td>Name: </td>
                        <td><input type='text' name='name' placeholder='Syed Nasran' size='30'/></td>
                    </tr>
                    <tr>
                        <td>Username: </td>
                        <td><input type='text' name='username' placeholder='eg. s52287' size='30'/></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type='password' name='pw' size='30'/></td>
                    </tr>
                </table>
                <input type='radio' name='role' id='lecturer' value='lecturer' onclick='ShowHideDiv()'/>
                <label for='lecturer'>Lecturer</label>
                <input type='radio' name='role' id='student' value='student' onclick='ShowHideDiv()'/>
                <label for='student'>Student</label>
                <br>
                <div id='dvLecturer' style='display: none'>
                    <table>
                        <tr>
                            <td>Speciality: </td>
                            <td><input type='text' name='speciality' size='30'/></td>
                    </table>
                </div>
                <div id='dvStudent' style='display: none'>
                    <table>
                        <tr>
                            <td>Date of Birth: </td>
                            <td><input type='text' name='DoB' placeholder='YYYY-MM-DD' size='10'/></td>
                        </tr>
                    </table> 
                </div>
                <br>
                <input type='submit' name='BtnSubmit' value='Register' size='50'/>
                <p>Already have an account? Login <a href='login.jsp'>Here!</a></p>
                <p></p>
            </form>
        </div>
    </body>
</html>
