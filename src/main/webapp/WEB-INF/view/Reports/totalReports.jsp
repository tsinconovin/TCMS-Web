<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page session="false" %>



<section class="content-header">
    <h6>
        <ol class="breadcrumb bc6">
            <li>گزارش جامـع اطلاعات</li>
        </ol>
    </h6>
    <br>
</section>
<form method="post" id="reasonFrm">
    <section class="content">
        <div class="row">
            <div class="box box-details">
                <div class="box-header with-border">
                    <h3 class="box-title c1 font--bold"></h3>
                </div>
                <div class="box-body">
                    <div class="row">

                        <div class="form-group">
                            <div class="col-lg-2 col-md-6">
                                <label>بر اساس سن:<span class="c8">*</span></label>
                                <div class="form-group">
                                    <input class="form-control" id="" name="" placeholder="50">
                                </div>
                                <button type="submit" name="carTypeFilter" class="form-control"> اعمال سن</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-2 col-md-6">
                                <label>بر اساس نوع خودرو:<span class="c8">*</span></label>
                                <div class="form-group">
                                    <select class="form-control" id="" name="">
                                        <option value="-1">لطفا انتخاب کنید</option>
                                        <option value="1">کوچک</option>
                                        <option value="2">بزرگ</option>
                                    </select>
                                </div>
                                <button type="submit" name="carTypeFilter" class="form-control"> اعمال اندازه</button>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-lg-2 col-md-6">
                                <label>بر اساس رنگـ:<span class="c8">*</span></label>
                                <div class="form-group">
                                    <select class="form-control" id="" name="" multiple="true">
                                        <option value="-1">لطفا انتخاب کنید</option>
                                        <option value="1">سفید</option>
                                        <option value="2">مشکی</option>
                                        <option value="3">آبی</option>
                                        <option value="4">قرمز</option>
                                        <option value="5">سبز</option>
                                        <option value="5">زرد</option>
                                        <option value="6">نارنجی</option>
                                    </select>
                                </div>
                                <button type="submit" name="carTypeFilter" class="form-control">اعمال رنگـ</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-2 col-md-6">
                                <label>بر اساس میزان عوارض:<span class="c8">*</span></label>
                                <div class="form-group">
                                    <input class="form-control" id="" name="" placeholder="1500">
                                </div>
                                <button type="submit" name="carTypeFilter" class="form-control"> اعمال عوارض</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="box box-details">
            <div class="box-header with-border">
                <h3 class="box-title c1">فهرست بر اساس گزارش درخواستی</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div id="scrol_table" class="table-responsive no-padding" style="height: 400px">
                            <table class="table table-hover table-striped table-bordered sticky font--bold font_scale--normal"
                                   style="min-width: 400px; overflow-x: scroll">
                                <tbody>

                                <tr id="tr${visitReason.getId()}">
                                    <th class="sticky-r" style="width: 50px;">ردیف</th>
                                    <th style="width: 70px;">عملیات</th>
                                    <th style="min-width: 100px;">نام و نام خانوادگی</th>
                                    <th style="min-width: 120px;">کد ملی</th>
                                    <th style="min-width: 120px;">سن</th>
                                    <th style="min-width: 120px;">عوارض</th>
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
                                                    <a onclick="return deleteReason('${visitReason.getId()}');">حذف</a>
                                                </li>
                                                <li>
                                                    <a onclick="return goToEditPage('/ReferManagmentFA/EditReason', '${visitReason.getId()}');">ویرایش</a>
                                                </li>
                                                <li><a data-toggle="modal" data-target="#modal-details">جزئیات</a>
                                                </li>
                                                <li><a data-toggle="modal" data-target="#sendModal">ثبت
                                                    مدارک</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                    <td>${oList.getName()}</td>
                                    <td>${oList.getNational_code()}</td>
                                    <td>${oList.getAge()}</td>
                                    <td>${oList.getTotal_toll_paid()}</td>
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
</form>
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

