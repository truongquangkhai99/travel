<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <!--header top-->
    <div id="header">
        <div id="top">
            <div class="container">
                <!-- menu dropdown -->
                <div class="row">
                    <div class="row hidden-lg hidden-md hidden-sm">
                        <div class="col-xs-7">
                            <a href="/">
                                <img src='<c:url value = "/template/web/image/logo.png"/>' style="vertical-align: middle;" class="img-responsive">
                            </a>
                        </div>
                        <div class="col-xs-5 nav-top-iconmenu text-right">
                            <i class="fas fa-bars fa-lg"></i>
                        </div>
                    </div>
                    <menu class="clearfix">
                        <ul class="main-menu clearfix">
                            <li>
                                <a href="#">Du lịch</a>
                                <div class="dropdown clearfix">
                                    <ul>
                                        <li><a href="#">Du lịch trong nước</a></li>
                                        <li><a href="#">Du lịch nước ngoài</a></li>
                                        <li><a href="#">Tự chọn</a></li>
                                        <li><a href="#">Du học</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="#">Khách sạn</a>
                            </li>
                            <li>
                                <a href="#">Vận chuyển</a>
                                <div class="dropdown clearfix">
                                    <ul>
                                        <li><a href="#">Thuê xe</a></li>
                                        <li><a href="#">Vé máy bay</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="#">Tin tức</a>
                                <div class="dropdown clearfix">
                                    <ul>
                                        <li><a href="#">Tin tức</a></li>
                                        <li><a href="#">Cẩm nang du lịch</a></li>
                                        <li><a href="#">Kinh nghiệm du lịch</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="#">Khuyến mại</a>
                                <div class="dropdown clearfix">
                                    <ul>
                                        <li><a href="#">Khuyến mại hè 2019</a></li>
                                        <li><a href="#">Mua tour trả chậm 0%</a></li>
                                        <li><a href="#">Khuyến mại thẻ Master</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="#">Chăm sóc KH</a>
                            </li>
                            <li>
                                <a href="#">Liên hệ</a>
                            </li>
                        </ul>
                    </menu>
                    <!-- end dropdown -->
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="bot">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 hidden-xs">
                        <a href="/">
                            <img src='<c:url value = "/template/web/image/logo/logo.png"/>' style="vertical-align: middle;">
                        </a>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 bot-mg-b">
                        <div class="area-info phone-support f-right pos-relative">
                            <div class="dropdown-toggle">
                                <div class="f-left">
                                    <div style="font-weight: bold; font-size: 18.5px; margin-bottom: 3px;" class="hotline">1800 6886</div>
                                    <div style="font-size: 12px; color: #000;">Tư vấn miễn phí</div>
                                </div>
                                <div class="f-right">
                                    <i class="fa fa-angle-down fa-lg" style="padding-top: 8px; padding-left: 8px;"></i>
                                </div>
                            </div>
                            <div class="dropdown-menu">
                            </div>
                        </div>
                        <div class="area-info f-right">
                            <div class="obj pos-relative">
                                <a>
                                    <img src='<c:url value = "/template/web/image/logo/en.png"/>' alt="Ngôn ngữ">
                                </a>
                                <span style="padding-left: 5px; font-weight: bold;cursor:pointer;" class="hidden-xs">EN</span>
                            </div>
                        </div>
                        <div class="area-info f-right user-info">
                            <div class="obj pos-relative">
                                <img src='<c:url value = "/template/web/image/logo/user.png"/>' alt="Tài khoản" class="dropdown-toggle">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>