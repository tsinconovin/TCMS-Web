<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page session="false" %>

<link rel="stylesheet" href="../resource/bower_components/select2/dist/css/select2.min.css">
<script src="../resource/bower_components/select2/dist/js/select2.full.min.js"></script>
<section class="content-header">
    <h6>
        <ol class="breadcrumb bc6">
            <li>گزارش ها</li>
            <li>گزارش خودروها بر اساس بازه سنی</li>
        </ol>
    </h6>
    <br>
</section>
<form method="post" id="reasonFrm">
    <section class="content">
        <div class="box-body">
            <div class="row">
                <div class="col-md-12">

                    <div class="box box-details">
                        <div class="box-header with-border">
                            <h3 class="box-title c1 font--bold">لطفا بازه سنی مورد نظر را وارد کنید.</h3>
                        </div>
                        <div class="box-body">
                        <form id="search-form" method="post" action="/Reports/getOwnerCarByAgeInput">
                            <div>
                                <div class="col-lg-2 col-md-2">
                                    <label>از سن:<span class="c8">*</span></label>
                                    <div class="form-group">
                                        <input type="number" class="form-control" name="ageListFrom" id="ageListFrom"
                                               placeholder="42">
                                    </div>
                                    <label>تا سن:<span class="c8">*</span></label>
                                    <div class="form-group">
                                        <input type="number" class="form-control" name="ageListTo" id="ageListTo"
                                               placeholder="56">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2">
                                <button type="submit" name="carTypeFilter" class="btn bc14"
                                        style="float: left;margin-top: 25px;margin-left: 2%;">
                                    جستــجو
                                </button>
                            </div>
                        </form>
                        </div>
                    </div>
                    <div class="box box-details">
                        <div class="box-header with-border">
                            <h3 class="box-title c1">فهرست خودرو ها با بازه سنی مشخص</h3>
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
                                                <th style="min-width: 100px;">شناسه مالک</th>
                                                <th style="min-width: 120px;">نوع</th>
                                                <th style="min-width: 120px;">رنگ</th>
                                                <th style="min-width: 120px;">طول</th>
                                                <th style="min-width: 120px;">وزن قابل حمل</th>
                                                <th style="width: 20px;">حذف منطقی</th>


                                            </tr>
                                            <% int c = 1;%>
                                            <c:forEach items="${ocListByAgeRange}" var="ocListByAgeRange">
                                            <tr id="">
                                                <td class="sticky-r"><%= c %>
                                                </td>
                                                <td>${ocListByAgeRange.getOwner_id()}</td>
                                                <td>${ocListByAgeRange.getType()}</td>
                                                <td>${ocListByAgeRange.getColor()}</td>
                                                <td>${ocListByAgeRange.getLength()}</td>
                                                <td>${ocListByAgeRange.getLoad_valume()}</td>
                                                <td>${ocListByAgeRange.getDelete_flag()}</td>

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

<script>
    $('#colorId').select2({
        selectOnClose: false,
        dir: "rtl"
    });
</script>