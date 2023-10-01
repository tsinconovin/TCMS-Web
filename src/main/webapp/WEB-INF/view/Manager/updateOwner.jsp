<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page session="false" %>

<section class="content-header">
    <h6>
        <ol class="breadcrumb bc6">
            <li><a href="#/Manager/ownerManagement">مدیریت اطلاعات مالکان</a></li>
            <li>ویرایش اطلاعات مالک</li>
        </ol>
    </h6>
    <br>
</section>
<form method="post" id="updateForm" name="updateForm">

    <section class="content">

        <div class="row">
            <div class="box box-details">
                <div class="box-header with-border">
                    <h3 class="box-title c1 font--bold">بخش های مد نظر از اطلاعات مالک آقا / خانم  ${oUpdateList.name}   را ویرایش و سپس دکمه "اعمال" را بزنید.</h3>
                </div>

                <div class="box-body">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <label>نام و نام خانوادگی:<span class="c8">*</span></label>
                            <div class="form-group">
                                <input type="text" class="form-control" name="fullName" id="fullName1" is-required
                                       value="${oUpdateList.name}"/>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <label>کد ملی:<span class="c8">*</span></label>
                            <div class="form-group">
                                <input type="text" class="form-control" name="nationalCode" id="nationalCode1"
                                       is-required
                                       value="${oUpdateList.national_code}"/>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <label>سن:<span class="c8">*</span></label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="age" id="age1" is-required
                                       value="${oUpdateList.age}"/>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <label>میزان عوارض پرداخت شده توسط شخص:<span class="c8">*</span></label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="Payment" id="Payment1" is-required
                                       value="${oUpdateList.total_toll_paid}"/>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="col-lg-12 col-md-6">
                                <button onclick="" type="submit" class="btn bc14" style="float: left;margin-top: 25px;">
                                    اعمال
                                </button>
                            </div>

                            <hr>

                            <section
                                    style="text-align: center; justify-content: center; align-items: center; margin-top: 8rem">
                                <div>
                                    <div class="bg-success" style="font-size: 20px; font-weight: bold;">
                                        <c:if test="${res == 1}">
                                            <i class="fa fa-check"
                                               style="color: #2c917f"></i> با موفقیت تغییرات ذخیره شد.
                                        </c:if>
                                    </div>

                                    <div class="bg-danger " style="font-size: 20px; font-weight: bold;">
                                        <c:if test="${res == 0}">
                                            <i class="fa fa-close" style="color: #9e080d"></i> ثبت تغییرات ناموفق بود.
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
    </section>
</form>
<c:if test="${res == 1}">
    <script>
        setTimeout(function () {
            window.location.replace("/Manager/ownerManagement");
        }, 2000);
    </script>
</c:if>
