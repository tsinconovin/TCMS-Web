<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page session="false" %>
<!DOCTYPE html>
<html style="font-family: IRANSans ">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>سامانه کنترل تردد خودرو</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="../resource/dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
    <link href="../resource/dist/css/rtl.css" rel="stylesheet" type="text/css"/>
    <link href="../resource/dist/css/btn.css" rel="stylesheet" type="text/css"/>
    <link href="../resource/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../resource/dist/css/AdminLTE.css" rel="stylesheet" type="text/css"/>
    <link href="../resource/dist/css/skins/_all-skins.minVG.css" rel="stylesheet" type="text/css"/>
    <link href="../resource/dist/css/ConfirmModal.css" rel="stylesheet" type="text/css"/>
    <link href="../resource/dist/css/tostify.min.css" rel="stylesheet" type="text/css"/>
    <link href="../resource/dist/css/General.css" rel="stylesheet" type="text/css"/>
    <link href="../resource/dist/css/PersianDatePicker.min.css" rel="stylesheet" type="text/css"/>
    <script src="../resource/dist/js/jquery.min.js" type="text/javascript"></script>
    <script src="../resource/dist/js/bootstrap.min.js"></script>
    <script src="../resource/dist/js/adminlte.min.js"></script>
    <script src="../resource/dist/js/PersianDatePicker.min.js" type="text/javascript"></script>
    <link href="../resource/dist/css/OEcolor.css" rel="stylesheet" type="text/css"/>

</head>
<style>
    a {
        color: #000;
        cursor: pointer;
    }

    .treeview-padding {
        padding: 5px 11px 5px 15px !important;
    }

    .new-request-icon {
        margin-left: 7px;
    }

    .selected {
        background-color: #cde2ed !important;
    }

    .fixed-btn {
        margin-top: 11px;
        font-size: 13px;
        font-weight: bold;
        color: #FFFFFF;
        left: 1px;
        position: fixed;
        z-index: 99999;
        cursor: pointer;
    }

    .fixed-btn > i {
        margin-right: 5px;
    }

    .label_nav--count {
        margin-right: 15px;
    }
</style>
<body class="hold-transition skin-blue sidebar-mini">
<script src="../resource/dist/js/tostify.min.js"></script>

<script>
    function loaderOnElement(id, status) {
        if (status == 'on' && document.getElementById(id + '-loader') == null) {
            var element = document.getElementById(id);
            var loaderElement = '<div id="' + id + '-loader" style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;background-color: rgba(0, 0, 0, 0.6);z-index: 1000;display: block">'
                + '<img src="../resource/images/loader.gif" alt="" style="z-index:504110901; width: 70px; top: 20%; position: absolute; left: 45%; ">'
                + '</div>';
            element.insertAdjacentHTML('afterbegin', loaderElement);
        } else if (status == 'off' && document.getElementById(id + '-loader') != null) {
            document.getElementById(id + '-loader').remove();
        }
    }

    function toast(text, bgColor, duration) {
        Toastify({
            text: text,
            duration: duration * 1000,
            newWindow: true,
            close: true,
            gravity: "bottom",
            position: "center",
            backgroundColor: toastColorPicker(bgColor),
            stopOnFocus: true,
            onClick: function () {
            }
        }).showToast();
    }

    function toastColorPicker(bgColor) {
        switch (bgColor) {
            case "error":
                return "#de4435";
            case "warning" :
                return "#ff7321";
            case "success":
                return "#11941b";
            default :
                return bgColor;
        }
    }
</script>
<div id="boxLoader"
     style="position: fixed;top: 0;left: 0;right: 0;bottom: 0;background-color: rgba(0, 0, 0, 0.6);z-index: 1000;display: none">
    <img src="../resource/images/loader.gif" alt=""
         style="z-index:504110901; width: 70px; top: 40%; position: absolute; left: 45%; "/>
</div>
<form method="GET" id="frmHandller" name="frmHandller">

</form>
<form id="positionFrm" method="POST" action="/Index/index?token=${token}">
    <input type="hidden" value="" id="posId" name="posId">
</form>
<div class="wrapper">
    <header class="main-header">
        <a href="#" class="logo">
            <span class="logo-mini">سامانه</span>
            <span class="logo-lg"><b>کنترل تردد خودرو</b></span>
        </a>
        <nav class="navbar navbar-static-top">
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only"></span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#" data-toggle="control-sidebar">نسخه ی 2.2.5 <fmt:formatDate type="both"
                                                                                               dateStyle="long"
                                                                                               timeStyle="long"
                                                                                               value="${now}"/> </a>

                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-right image">
                    <img src="../resource/dist/img/tslogopng.png" class="img" style="width: 300px;border-radius: 50%;"
                         alt="User Image">
                </div>
                <div class="pull-right info">
                    <span style="  float: left; width: 90%; font-family: 'tahoma';font-size: 11.2px; margin-top: 12px; "
                          dir="ltr">IP: <%= request.getRemoteHost()%></span>
                </div>
            </div>
            <form action="#" method="get" class="sidebar-form">
            </form>
            <ul class="sidebar-menu" data-widget="tree">
                <li class=" treeview">
                    <a>
                        <i class="fa fa-home"></i> <span>ناحیه کاربری</span>
                        <span class="pull-left-container">
                                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a onclick="redirectFrm('../home/home')"><i class="fa fa-home"></i>خانه </a></li>
                    </ul>
                </li>
                <li class=" treeview">
                    <a href="">
                        <i class="fa fa-user-o"></i> <span> مدیریت مالکان و خودرو</span>
                        <span class="pull-left-container">
                                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="pageNewRequest"><a onclick="redirectFrm('../Manager/ownerManagement')"><i
                                class="fa fa-id-card"></i>مدیریت اطلاعات مالکان</a></li>
                        <li id="pageCarManager"><a onclick="redirectFrm('../Manager/carManagement')"><i
                                class="fa fa-car"></i> مدیریت اطلاعات خودروها </a>
                        </li>
                    </ul>
                </li>
                <li class=" treeview">
                    <a href="">
                        <i class="fa fa-newspaper-o"></i> <span>گزارش ها</span>
                        <span class="pull-left-container">
                                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="pageTotalReport"><a onclick="redirectFrm('../Reports/totalReports')"><i
                                class="fa fa-paperclip"></i>کلی</a></li>
                        <li id="blueOrRedCarsReports"><a onclick="redirectFrm('../Reports/blueOrRedCarsReports')"><i
                                class="fa fa-paint-brush"></i>خودرو های آبی یا قرمز</a></li>
                        <li id="carsByColorReports"><a onclick="redirectFrm('../Reports/carsByColorReports')"><i
                                class="fa fa-pencil"></i>خودرو به تفکیک رنگ</a></li>
                        <li id="carsByMultipleColorReports"><a
                                onclick="redirectFrm('../Reports/carsByMultipleColorReports')"><i
                                class="fa fa-pencil-square"></i>چند خودرو چند رنگ</a></li>
                        <li id="carsByOwnerAge"><a onclick="redirectFrm('../Reports/carsByOwnerAge')"><i
                                class="fa fa-search-plus"></i>خودروهایی با سن مالک +هفتاد</a></li>
                        <li id="carsByOwnerAgeRange"><a onclick="redirectFrm('../Reports/carsByOwnerAgeRange')"><i
                                class="fa fa-sort-numeric-asc"></i>خودروها در بازه سنی مشخص</a></li>
                    </ul>
                </li>
            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <section class="content">
            <button type="button" style="display: none" id="backBtn" class="btn btn-sm fixed-btn btn-facebook"
                    onclick="backBtnAction()">بازگشت <i class="fa fa-arrow-circle-o-left"></i></button>
            <button type="button" style="display: none" id="closeBtn" class="btn btn-sm fixed-btn btn-facebook"
                    onclick="closeWindow()">بستن <i class="fa fa-times"></i></button>
            <decorator:body>
            </decorator:body>
        </section>
    </div>
</div>
<script>
    function closeModal(id) {
        $('#' + id).modal('toggle');
    }

    function loaderHandler(status) {
        if (status === 'on') {
            document.getElementById('boxLoader').style.display = 'block';
        }
        if (status === 'off') {
            document.getElementById('boxLoader').style.display = 'none';
        }
    }

    function clearForm(id) {
        document.getElementById(id).reset();
    }

    function backBtnAction() {
        window.history.back();
    }

    function closeWindow() {
        window.close();
    }

    function redirectFrm(url) {
        document.getElementById("frmHandller").action = url;
        document.getElementById("frmHandller").submit();
    }
</script>
<script>
    $("tbody tr").click(function () {
        $(this).addClass('selected').siblings().removeClass("selected");
    });
</script>
<script>
    function checkNullable(value) {
        if (value === null) {
            return "";
        } else
            return value;
    }
</script>
</body>
</html>
