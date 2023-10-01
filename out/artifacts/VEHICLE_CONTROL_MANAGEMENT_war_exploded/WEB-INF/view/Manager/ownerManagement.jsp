<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page session="false" %>
<form method="post" name="deleteForm" id="deleteForm" action="/Manager/deleteOwner">
    <input type="hidden" value="" name="delete" id="delete">
</form>

<form method="post" name="logicalDeleteForm" id="logicalDeleteForm" action="/Manager/logicalDeleteOwner">
    <input type="hidden" value="" name="logicalDelete" id="logicalDelete">
</form>

<form method="get" name="updateForm" id="updateForm" action="/Manager/updateOwner">
    <input type="hidden" value="" name="update" id="update">
</form>

<form method="get" name="addCarForm" id="addCarForm" action="/Manager/addCar">
    <input type="hidden" value="" name="owner_id" id="owner_id">
</form>

<section class="content-header">
    <h6>
        <ol class="breadcrumb bc6">
            <li>مدیریت اطلاعات مالکان</li>
        </ol>
    </h6>
    <br>
</section>

<section class="content">
    <div class="row">

        <section style="text-align: center; justify-content: center; align-items: center;">
            <div class="bg-success" style="font-size: 20px; font-weight: bold;">
                <c:if test="${insertRes == 1}">
                    <i class="fa fa-check"
                       style="color: #2c917f"></i> یک مالک جدید با موفقیت ذخیره شد.
                </c:if>
            </div>
            <div class="bg-danger " style="font-size: 20px; font-weight: bold;">
                <c:if test="${insertRes == 0}">
                    <i class="fa fa-close" style="color: #9e080d"></i> ثبت ناموفق بود.
                </c:if>
            </div>
            <c:if test="${insertRes == -2}">
                <div class="bg-danger " style="font-size: 20px; font-weight: bold;">
                    <i class="fa fa-close" style="color: #9e080d"></i> لطفا بخشهای اجباری را پر نمایید.
                </div>
            </c:if>
            <c:if test="${insertRes == -3}">
                <div class="bg-danger " style="font-size: 20px; font-weight: bold;">
                    <i class="fa fa-close" style="color: #9e080d"></i> لطفا کد ملی را صحیح وارد کنید.
                </div>
            </c:if>
            <div class="bg-success" style="font-size: 20px; font-weight: bold;">
                <c:if test="${ldRes == 1}">
                    <i class="fa fa-check"
                       style="color: #2c917f"></i> حذف منطقی انجام شد.
                </c:if>
            </div>
            <div class="bg-danger" style="font-size: 20px; font-weight: bold;">
                <c:if test="${ldRes == 0}">
                    <i class="fa fa-close"
                       style="color: #2c917f"></i>  حذف منطقی انجام نــشد.
                </c:if>
            </div>
        </section>

        <form method="post" id="reasonFrm">
            <div class="box box-details">
                <div class="box-header with-border">
                    <h3 class="box-title c1 font--bold">افزودن</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <label>نام و نام خانوادگی:<span class="c8">*</span></label>
                            <div class="form-group">
                                <input type="text" class="form-control" name="fullName" id="fullName1" is-required
                                       placeholder="نام و نام خانوادگی"/>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <label>کد ملی:<span class="c8">*</span></label>
                            <div class="form-group">
                                <input type="text" class="form-control" name="nationalCode" id="nationalCode1"
                                       is-required
                                       placeholder="1234567890"/>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <label>سن:<span class="c8">*</span></label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="age" id="age1" is-required
                                       placeholder="50"/>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <label>میزان عوارض پرداخت شده توسط شخص:</label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="Payment" id="Payment1" is-required
                                       placeholder="عوارض پرداخت شده"/>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="col-lg-12 col-md-6">
                                <button type="submit" class="btn bc14" style="float: left;margin-top: 25px;">
                                    ثبت
                                </button>
                            </div>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </form>


        <div class="box box-details">
            <div class="box-header with-border">
                <h3 class="box-title c1">فهرست مالکان</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div id="scrol_table" class="table-responsive no-padding" style="height: 400px">

                            <table class="table table-hover table-striped table-bordered sticky font--bold font_scale--normal"
                                   style="min-width: 400px; overflow-x: scroll">
                                <tbody>
                                <form id="search-form" method="post" action="/Manager/getOwnerByInputPost">
                                    <tr>
                                        <th colspan="2">
                                            <button onclick="search()" type="button" class="btn  bc14"
                                                    style="margin-top: 5px;">
                                                جستجو
                                            </button>
                                        </th>
                                        <th><input type="text" class="form-control" name="s-fullName" id="s-fullName"
                                                   placeholder="نام و نام خانوادگی"></th>
                                        <th><input type="text" class="form-control" name="s-nationalCode"
                                                   id="s-nationalCode"
                                                   placeholder="1234567890"></th>
                                        <th><input type="number" class="form-control" name="s-age" id="s-age"
                                                   placeholder="50">
                                        </th>
                                        <th><input type="number" class="form-control" name="s-Payment" id="s-Payment"
                                                   placeholder="20000">
                                        </th>
                                    </tr>
                                </form>
                                <tr id="tr${visitReason.getId()}">
                                    <th class="sticky-r" style="width: 50px;">ردیف</th>
                                    <th style="width: 70px;">عملیات</th>
                                    <th style="min-width: 100px;">نام و نام خانوادگی</th>
                                    <th style="min-width: 120px;">کد ملی</th>
                                    <th style="min-width: 120px;">سن</th>
                                    <th style="min-width: 120px;">عوارض</th>
                                    <th style="width: 20px;">حذف منطقی</th>

                                </tr>
                                <% int c = 1;%>
                                <c:forEach items="${oList}" var="oList">
                                <tr id="">
                                    <td class="sticky-r"><%= c %>
                                    </td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn dropdown-toggle bc25"
                                                    data-toggle="dropdown" style="padding: 9px"><span
                                                    class="caret"></span></button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a class="fa fa-trash" onclick="deleteReason('${oList.getId()}')"> |
                                                        حذف کامل </a>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="fa fa-remove" onclick="logicalDelete('${oList.getId()}')">
                                                        | حذف منطقی </a>
                                                </li>
                                                <li>
                                                    <a class="fa fa-edit"
                                                       onclick="return goToOwnerEditPage('${oList.getId()}')"> | ویرایش
                                                        مالک </a>
                                                </li>
                                                <li><a class="fa fa-plus fa-car"
                                                       onclick="return goToAddCarPage('${oList.getId()}')"> | افزودن
                                                    خودرو </a>
                                                </li>
                                                <li><a class="fa fa-newspaper-o" data-toggle="modal"
                                                       data-target="#modal-details"> | جزئیات </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                    <td>${oList.getName()}</td>
                                    <td>${oList.getNational_code()}</td>
                                    <td>${oList.getAge()}</td>
                                    <td>${oList.getTotal_toll_paid()}</td>
                                    <td>${oList.getDelete_flag()}</td>

                                <tr>
                                            <% c++ ;%>
                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="../utils/Details.jsp" %>
<div class="modal fade" id="sendModal">
    <div class="modal-dialog">
        <div class="container">
            <div class="modal-dialog col-lg-12 col-md-12 col-sm-12" style="margin-top: 5%; padding: 5%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">ثبت مدارک</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <label>کارت خودرو:(لطفا عکس کارت خودرو را بارگذاری نمایید)<span
                                        class="c8">*</span></label>
                                <div class="form-group">
                                    <input type="file" class="form-control" name="" id="" is-required
                                           accept=".png,.jpg,.jpeg"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn bc14 pull-left">ثبت</button>
                        <button type="button" class="btn bfc1" data-dismiss="modal">بستن</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteReason(id) {
        document.getElementById("delete").value = id
        document.getElementById("deleteForm").submit()
    }
</script>


<script>
    function logicalDelete(id) {
        document.getElementById("logicalDelete").value = id
        document.getElementById("logicalDeleteForm").submit()
    }
</script>
<script>
    function goToOwnerEditPage(id) {
        document.getElementById("update").value = id
        document.getElementById("updateForm").submit()
    }
</script>
<script>
    function goToAddCarPage(id) {
        document.getElementById("owner_id").value = id
        document.getElementById("addCarForm").submit()
    }
</script>
<script>
    function search() {
        document.getElementById("search-form").submit()
    }
</script>
<script>
    const res = ${insertRes};
    if (insertRes == 1) {
        var result = "تغییرات انجام شد."
    } else {
        alert(" تغییرات انجام نشد، مجدد تلاش کنید.")
    }
    document.getElementById("confirmMSG").innerHTML = result;

</script>

<c:if test="${ldRes == 1 || insertRes == 1}">
    <script>
        setTimeout(function () {
            window.location.replace("/Manager/ownerManagement");
        }, 2000);
    </script>
</c:if>