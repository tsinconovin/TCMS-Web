<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false"%>
<!DOCTYPE html>
<html class="color_body"  > 
    <head> 
        <title>سامانه کنترل تردد خودرو
        </title> 
        <link href="../resource/dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link href="../resource/dist/css/AdminLTE.css" rel="stylesheet" type="text/css"/>
        <link href="../resource/dist/css/color.css" rel="stylesheet" type="text/css"/>
        <link href="../resource/dist/css/Login/animate.css" rel="stylesheet" type="text/css"/>
        <link href="../resource/dist/css/Login/animsition.css" rel="stylesheet" type="text/css"/>
        <link href="../resource/dist/css/Login/hamburgers.min.css" rel="stylesheet" type="text/css"/>
        <link href="../resource/dist/css/Login/main.css" rel="stylesheet" type="text/css"/>
        <link href="../resource/dist/css/Login/util.css" rel="stylesheet" type="text/css"/>
        <style>
            .btn-warning{
                background-color: #b2dfff !important;
                border-color: #b2dfff !important;
                color:#636363;
            }
            .btn-warning:hover{
                background-color: #c5dfff !important;
            }
            .btn-warning:active{
                background-color: #c5dfff !important;
            }
            .btn-warning:focus {
                background-color: #c5dfff !important;
            }
            .btn-warning:lang {
                background-color: #c5dfff !important;
            }
            .btn-warning:link {
                background-color: #c5dfff !important;
            }
            .btn-warning:visited {
                background-color: #c5dfff !important;
            }
            ::placeholder {
                text-align: right;
            }
            .notif--container {
                height: 400px;
                padding: 3rem;
                display: block;
            }
            .notif--box {
                background: rgba(0, 0, 0, 0.7);
                height: 800px;
                border-radius: 1rem;
            }
            .notif--header {
                margin-top: 1.2rem;
                color: yellow;
                font-weight: bold;
            }
            .notif--text_box {
                height: 300px;
                background-color: #b1b1b147;
                margin-bottom: 1rem;
            }
            p {
                text-align: justify;
                direction: rtl;
                color: white;
                padding: 2.5rem;
                line-height: 3.8rem;
                font-family: vazir;
            }
        </style>
    </head> 
    <body style="background-color: #666666;font-family: vazir">

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-form validate-form">
                        <span class="login100-form-title p-b-43">
                            <center><img src="../resource/dist/img/tslogopng.png" alt="" style="width:250px;border-radius: 50%;"/><br>
                                <p class="c1" style="opacity: 1;font-family: vazir;font-size: 20px;font-weight: bold;display: inline"> <b>برای ورود لطفا اطلاعات کاربری خود را وارد کنید</b></p>
                            </center>
                        </span>
                        <br><br>
                        <center><p style="color: red;font-family: vazir">${msg}</p></center>
                        <div class=" form-group">
                            <label style="float: right; font-weight: bold;">:نام کاربری</label><br><br>
                            <input id="uname" class="form-control input-lg" type="text" placeholder="نام کاربری" dir="ltr" name="username" autofocus>
                        </div> 
                        <div class="form-group">
                            <label style="float: right; font-weight: bold;">:رمز عبور</label><br><br>
                            <input type="password" class="form-control input-lg" placeholder="رمز عبور" name="password" id="pass" required="true" dir="ltr" autocomplete="off" style="width: 100%;"/> 
                        </div>
                        <br>
                        <input name="secret" type="hidden" value="6LcILG8UAAAAAFOjWNcjt3HmUztqasQ0EiXd9_nI">
                        <input id="response" name="response"  type="hidden" value="">
                        <input id="pk" name="pk"  type="hidden" value="${pk}">
                        <a href="../home/home"> <button class="bc6 c6 btn form-control btn-lg" type="button"><b>ورود </b></button></a>
                    </div>
                    <div id="bi" class="login100-more" >
                    </div>
<%--                    <script>--%>
<%--                        var img = "";--%>
<%--                        img = "url('../resource/images/Login/L (";--%>
<%--                        var i = Math.floor(Math.random() * (42 - 1) + 1);--%>
<%--                        img += i + ").JPG')";--%>
<%--                        img = "url('../resource/images/Login/L (";--%>
<%--                        document.getElementById("bi").style.backgroundImage = img;--%>


<%--                    </script>--%>

                    <script>
                        var img = "url('../resource/images/Login/road-LowOpacity.png')";
                        document.getElementById("bi").style.backgroundImage = img;
                    </script>

                </div>
            </div>
        </div>
        <form method="post" id="loginform">
            <input type="hidden" name="username" id="uName">
            <input type="hidden" name="password" id="Pass"/>
        </form>

    </body>
    <script src="../resource/bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="../resource/dist/js/jsencrypt.min.js" type="text/javascript"></script>
    <script>
                        var flag = "${loggedIn}"
                        if (1 == flag) {
                            window.location = "../Index/Index";
                        }
    </script>
    <script>
        function login() {
            if (document.getElementById('pass').value == "" || document.getElementById('uname').value == "") {
                return false;
            }
            encryptPass();
            document.getElementById('loginform').submit();
        }

        function encrypt(pass) {
            var encrypt = new JSEncrypt();
            encrypt.setPublicKey(document.getElementById('pk').value);
            var encrypted = encrypt.encrypt(pass);
            return encrypted;
        }
        function encryptPass() {
            document.getElementById('Pass').value = encrypt(document.getElementById('pass').value);
            document.getElementById('uName').value = document.getElementById('uname').value;
        }
        function addLoginKeyupListener(id) {
            document.getElementById(id).addEventListener("keyup", function (event) {
                if (event.keyCode === 13) {
                    login();
                }
            });
        }
        addLoginKeyupListener('pass');
        addLoginKeyupListener('uname');
    </script>
</html>