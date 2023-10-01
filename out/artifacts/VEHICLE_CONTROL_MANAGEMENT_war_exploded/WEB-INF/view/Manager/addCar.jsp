<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page session="false" %>

<section class="content-header">
    <h6>
        <ol class="breadcrumb bc6">
            <li><a href="#/Manager/ownerManagement">مدیریت اطلاعات مالکان</a></li>
            <li><a href="#/Manager/addCar">ویرایش اطلاعات خودرو</a></li>
        </ol>
    </h6>
    <br>
</section>
<form method="post" id="addCarForm" name="addCarForm">

    <section class="content">

        <div class="row">
            <div class="box box-details">
                <div class="box-header with-border">
                    <h3 class="box-title c1 font--bold">بخش های ضروری را وارد و سپس دکمه "ثبت" را بزنید.</h3>
                </div>

                <div class="box-body" style="margin-top: 3rem">
                    <div class="row">
                        <div class="col-lg-2 col-md-2">
                            <label>نوع :<span class="c8">*</span></label>
                            <div class="form-group">
                                <select class="form-control" id="carType" name="type">
                                    <option value="">نوع</option>
                                    <option value="small">کوچکــ</option>
                                    <option value="big">بزرگــ</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2" style="">
                            <label>لطفا رنگـ خودرا را انتخاب کنید.<span class="c8">*</span></label>
                            <div class="form-group">
                                <select class="form-control" id="colorId" name="color">
                                    <option value="">رنگـ</option>
                                    <option value="white">سفید</option>
                                    <option value="black">مشکی</option>
                                    <option value="blue">آبی</option>
                                    <option value="red">قرمز</option>
                                    <option value="green">سبز</option>
                                    <option value="yellow">زرد</option>
                                    <option value="orange">نارنجی</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <label>طول:<span class="c8">*</span></label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="length" id="age1" is-required
                                       value="${ownerCarListById}" placeholder="5"/>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <label>وزن قابل حمل:<span class="c8">*</span></label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="load_valume" id="age1" is-required
                                       value="${ownerCarListById}" placeholder="2000"/>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="col-lg-12 col-md-6">
                                <button onclick="" type="submit" class="btn bc14" style="float: left;margin-top: 25px;">
                                    ثبت
                                </button>
                            </div>

                            <hr>

                            <section
                                    style="text-align: center; justify-content: center; align-items: center; margin-top: 8rem">
                                <div>
                                    <div class="bg-success" style="font-size: 20px; font-weight: bold;">
                                        <c:if test="${res == 1}">
                                            <i class="fa fa-check"
                                               style="color: #2c917f"></i> با موفقیت خودرو برای شناسه ${ocObj.owner_id} ذخیره شد.
                                        </c:if>
                                    </div>

                                    <div class="bg-danger " style="font-size: 20px; font-weight: bold;">
                                        <c:if test="${res == 0}">
                                            <i class="fa fa-close" style="color: #9e080d"></i> ثبت خودرو برای شناسه ${ocObj.owner_id} ناموفق بود.
                                        </c:if>
                                    </div>
                                </div>
                            </section>
                            <hr>
                            <section>
                                <div>
                                    <p id="asd"></p>
                                </div>
                            </section>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>


        <div class="box box-details">
            <div class="box-header with-border">
                <h3 class="box-title c1"> فهرست خودروهای ${oUpdateList.name}</h3>
                <li> افزوده میگردد.${ocList} خودرو برای</li>
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
                                        <th><input type="text" class="form-control" name="s-type" id="s-type "
                                                   placeholder="big"></th>
                                        <th><input type="text" class="form-control" name="s-ownerId"
                                                   id="s-ownerId"
                                                   placeholder="1234567890"></th>
                                        <th><input type="number" class="form-control" name="s-color" id="s-color"
                                                   placeholder="ُسبز">
                                        </th>
                                        <th><input type="number" class="form-control" name="s-length" id="s-length"
                                                   placeholder="5">
                                        </th>
                                        <th><input type="number" class="form-control" name="s-length" id="s-weight"
                                                   placeholder="2000">
                                        </th>
                                    </tr>
                                </form>
                                <tr id="tr${visitReason.getId()}">
                                    <th class="sticky-r" style="width: 50px;">ردیف</th>
                                    <th style="width: 70px;">عملیات</th>
                                    <th style="min-width: 100px;">نوع</th>
                                    <th style="min-width: 120px;">شناسه مالک</th>
                                    <th style="min-width: 120px;">رنگ</th>
                                    <th style="min-width: 120px;">طول</th>
                                    <th style="min-width: 120px;">وزن قابل حمل</th>

                                </tr>
                                <% int c = 1;%>
                                <c:forEach items="${ownerCarListById}" var="ocList">
                                <tr id="">
                                    <td class="sticky-r"><%=c%>
                                    </td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn dropdown-toggle bc25"
                                                    data-toggle="dropdown" style="padding: 9px"><span
                                                    class="caret"></span></button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a class="fa fa-trash" onclick="deleteReason('${ocList.getId()}')">
                                                        |
                                                        حذف کامل </a>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="fa fa-remove" onclick="deleteReason('${ocList.getId()}')">
                                                        | حذف منطقی </a>
                                                </li>
                                                <li>
                                                    <a class="fa fa-edit"
                                                       onclick="return goToOwnerEditPage('${ocList.getId()}')"> | ویرایش
                                                        مالک </a>
                                                </li>
                                                <li><a class="fa fa-plus fa-car" data-toggle="modal"
                                                       data-target="#sendModal"
                                                       onclick="return goToAddCarPage('${ocList.getId()}')"> | افزودن
                                                    خودرو </a>
                                                </li>
                                                <li><a class="fa fa-newspaper-o" data-toggle="modal"
                                                       data-target="#modal-details"> | جزئیات </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                    <td>${ocList.type}</td>
                                    <td>${ocList.owner_id}</td>
                                    <td>${ocList.color}</td>
                                    <td>${ocList.length}</td>
                                    <td>${ocList.load_valume}</td>
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
    </section>
</form>
<c:if test="${res == 1}">
    <script>
        setTimeout(function () {
            window.location.replace("/Manager/ownerManagement");
        }, 2000);
    </script>
</c:if>
