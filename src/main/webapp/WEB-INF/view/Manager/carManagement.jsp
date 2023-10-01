<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page session="false" %>
<form method="post" name="deleteForm" id="deleteForm" action="/Manager/deleteOwner">
    <input type="hidden" value="" name="delete" id="delete">
</form>

<form method="get" name="updateForm" id="updateForm" action="/Manager/updateOwner">
    <input type="hidden" value="" name="update" id="update">
</form>


<section class="content-header">
    <h6>
        <ol class="breadcrumb bc6">
            <li> مدیریت اطلاعات خودرو ها</li>
        </ol>
    </h6>
    <br>
</section>

<section class="content">
    <div class="row">
        <div class="box box-details">
            <div class="box-header with-border">
                <h3 class="box-title c1 font--bold">بخش های ضروری را وارد و سپس دکمه "ثبت" را بزنید.</h3>
            </div>

            <div class="box-body" style="margin-top: 3rem">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <label>شماره ملی:<span class="c8">*</span></label>
                        <div class="form-group">
                            <input type="number" class="form-control" name="national_code" id="national_code"
                                   is-required
                                   value="${ownerCarListById}" placeholder="001936549"/>
                        </div>
                    </div>
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
                            <input type="number" class="form-control" name="length" id="length" is-required
                                   value="${ownerCarListById}" placeholder="5"/>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2">
                        <label>وزن قابل حمل:<span class="c8">*</span></label>
                        <div class="form-group">
                            <input type="number" class="form-control" name="load_valume" id="load_valume" is-required
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
                                        <i class="fa fa-close"
                                           style="color: #9e080d"></i> ثبت خودرو برای شناسه ${ocObj.owner_id} ناموفق بود.
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
    </form>
    <div class="box box-details">
        <div class="box-header with-border">
            <h3 class="box-title c1">فهرست خودرو ها</h3>
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
                                    <th><input type="text" class="form-control" name="s-Id" id="s-Id"
                                               placeholder="شناسه مالک"></th>

                                    <th><input type="text" class="form-control" name="s-Type"
                                               id="s-Type"
                                               placeholder="نوع"></th>

                                    <th><input type="number" class="form-control" name="s-Color" id="s-Color"
                                               placeholder="رنگ">
                                    </th>

                                    <th><input type="number" class="form-control" name="s-Length" id="s-Length"
                                               placeholder="طول">
                                    </th>

                                    <th><input type="number" class="form-control" name="s-Wight" id="s-Wight"
                                               placeholder="وزن قابل حمل">
                                    </th>
                                </tr>
                            </form>
                            <tr id="tr${visitReason.getId()}">
                                <th class="sticky-r" style="width: 50px;">ردیف</th>
                                <th style="width: 70px;">عملیات</th>
                                <th style="min-width: 100px;">شناسه مالک</th>
                                <th style="min-width: 120px;">نوع</th>
                                <th style="min-width: 120px;">رنگ</th>
                                <th style="min-width: 120px;">طول</th>
                                <th style="min-width: 120px;">وزن قابل حمل</th>
                                <th style="width: 20px;">حذف منطقی</th>

                            </tr>
                            <% int c = 1;%>
                            <c:forEach items="${oCarList}" var="oCarList">
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
                                                <a onclick="deleteReason('${oCarList.getId()}')">حذف</a>
                                            </li>
                                            <li>
                                                <a onclick="return goToEditPage('${oCarList.getId()}')">ویرایش</a>
                                            </li>
                                            <li><a data-toggle="modal" data-target="#modal-details">جزئیات</a>
                                            </li>
                                            <li><a data-toggle="modal" data-target="#sendModal">ثبت
                                                مدارک</a>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                                <td>${oCarList.getOwner_id()}</td>
                                <td>${oCarList.getType()}</td>
                                <td>${oCarList.getColor()}</td>
                                <td>${oCarList.getLength()}</td>
                                <td>${oCarList.getLoad_valume()}</td>
                                <td>${oCarList.getDelete_flag()}</td>

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

    function goToEditPage(id) {
        document.getElementById("update").value = id
        document.getElementById("updateForm").submit()
    }

    function search() {
        document.getElementById("search-form").submit()
    }
</script>