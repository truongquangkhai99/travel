<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <!-- start slideshow-->
    <div class="slideContainer">
        <div class="mySlides">
            <img src='<c:url value = "/template/web/image/slideshow/show1.jpg"/>' alt="pic1" class="pic">
        </div>
        <div class="mySlides">
            <img src='<c:url value = "/template/web/image/slideshow/show2.jpg"/>' alt="pic2" class="pic">
        </div>
        <div class="mySlides">
            <img src='<c:url value = "/template/web/image/slideshow/show3.jpg"/>' alt="pic3" class="pic">
        </div>
        <div class="mySlides">
            <img src='<c:url value = "/template/web/image/slideshow/show4.jpg"/>' alt="pic4" class="pic">
        </div>
        <div class="mySlides">
            <img src='<c:url value = "/template/web/image/slideshow/show5.jpg"/>' alt="pic5" class="pic">
        </div>
        <div class="mySlides">
            <img src='<c:url value = "/template/web/image/slideshow/show6.jpg"/>' alt="pic6" class="pic">
        </div>
        <!-- Next and previous buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <div class="clear"></div>
<!-- start form search -->
<div id="form-search">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="frame-search">
					<div class="o-dl dltn">
						<img src='<c:url value = "/template/web/image/search/search1.png"/>'
							alt="Du lịch trong nước" class="mg-b">
						<p class="text1">TÌM TOUR</p>
						<p class="text2 text-dltn">Trong nước</p>
					</div>
					<div class="o-dl dlnn">
						<img src='<c:url value = "/template/web/image/search/search2.png"/>'
							alt="Du lịch nước ngoài" class="mg-b">
						<p class="text1">TÌM TOUR</p>
						<p class="text2 text-dlnn">Nước ngoài</p>
					</div>
					<div class="o-dl ">
						<a href="#" target="_blank">
						<img src='<c:url value = "/template/web/image/search/search3.png"/>' alt="Du lịch tự chọn"
							class="mg-b">
							<p class="text1">Du lịch</p>
							<p class="text2 text-dltc">Tự chọn</p>
						</a>
					</div>
					<div class="o-dl tttc">
						<img src='<c:url value = "/template/web/image/search/search4.png"/>' alt="cứu booking"
							class="mg-b">
						<p class="text1">TÌM KIẾM</p>
						<p class="text2 text-dltt">Booking</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-info-search bg-dltn pos-relative"
		style="display: none;">
		<form action="/Tour/SearchFirst" method="post">
			<input name="__RequestVerificationToken" type="hidden"
				value="Zy24E8CQ2saJ1-fPdGulqdAWMgds6mfg_A45lH7Kkv1nV_Uqx8ovMCZ1ozSvm6wmP0VK2klp_CJD_03jcq0LE89ZBTXdyXBCdg-n_XAbe_uuQC2LfuwW2DKwUtqMvfgcfmmUUhiZr0k0oSqC2HEJkGesGdQSfaSuOBr8Mc2qbak1">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="triangle-up"></div>
						<div class="pad-tb">
							<div class="row">
								<div class="col-lg-2 col-md-2 col-sm-4 col-xs-12">
									<div class="form-group">
										<label class="mg-b">Nơi khởi hành</label> <select
											class="form-control input-md" id="departureID"
											name="departureID"
											style="-webkit-appearance: menulist-button !important; line-height: 30px !important;">
											<option value="0">Nơi khởi hành</option>
											<option value="1">Hồ Chí Minh</option>
											<option value="3">Hà Nội</option>
											<option value="4">Đà Nẵng</option>
											<option value="5">Cần Thơ</option>
											<option value="6">Hải Phòng</option>
											<option value="7">Bình Dương</option>
											<option value="8">Nha Trang</option>
											<option value="10">Huế</option>
										</select>
									</div>
								</div>
								<div style="display: none;">
									<label>Loại tour</label>
									<div>
										<input type="hidden" name="TourTypeId" value="1"> <input
											type="hidden" name="ConCho" value="-1">
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-4 col-xs-12">
									<div class="form-group">
										<label class="mg-b">Nơi đến</label> <select
											class="form-control input-md" id="group_id" name="group_id"
											style="-webkit-appearance: menulist-button !important; line-height: 30px !important;">
											<option value="0">Nơi đến</option>
											<option value="99">An Giang</option>
											<option value="362">Bắc Giang</option>
											<option value="130">Bắc Kạn</option>
											<option value="206">Bạc Liêu</option>
											<option value="33">Bắc Ninh</option>
											<option value="46">Bảo Lộc</option>
											<option value="188">Bến Tre</option>
											<option value="94">Bình Định</option>
											<option value="359">Bình Liêu</option>
											<option value="194">Bình Thuận</option>
											<option value="47">Buôn Ma Thuột</option>
											<option value="137">Cà Mau</option>
											<option value="212">Cam Ranh</option>
											<option value="344">Cần Giờ</option>
											<option value="56">Cần Thơ</option>
											<option value="129">Cao Bằng</option>
											<option value="192">Côn Đảo</option>
											<option value="45">Đà Lạt</option>
											<option value="42">Đà Nẵng</option>
											<option value="341">Đắk Nông</option>
											<option value="187">Điện Biên</option>
											<option value="191">Đông Bắc</option>
											<option value="52">Đồng Nai</option>
											<option value="345">Đồng Nai</option>
											<option value="199">Đồng Tháp</option>
											<option value="108">Nghệ An</option>
											<option value="135">Hà Giang</option>
											<option value="32">Hạ Long</option>
											<option value="361">Hà Nam</option>
											<option value="29">Hà Nội</option>
											<option value="36">Hà Tây</option>
											<option value="59">Hà Tiên</option>
											<option value="229">Hà Tĩnh</option>
											<option value="30">Hải Phòng</option>
											<option value="197">Hồ Chí Minh</option>
											<option value="363">Hòa Bình</option>
											<option value="39">Huế</option>
											<option value="193">Kiên Giang</option>
											<option value="48">Kon Tum</option>
											<option value="37">Lạng Sơn</option>
											<option value="38">Lào Cai</option>
											<option value="214">Long An</option>
											<option value="360">Móng Cái</option>
											<option value="232">Nam Định</option>
											<option value="44">Nha Trang</option>
											<option value="35">Ninh Bình</option>
											<option value="106">Ninh Thuận</option>
											<option value="49">Pleiku</option>
											<option value="51">Phan Thiết</option>
											<option value="54">Phú Quốc</option>
											<option value="34">Phú Thọ</option>
											<option value="121">Phú Yên</option>
											<option value="41">Quảng Bình</option>
											<option value="198">Quảng Ngãi</option>
											<option value="43">Quảng Nam</option>
											<option value="196">Quảng Ninh</option>
											<option value="40">Quảng Trị</option>
											<option value="141">Quy Nhơn</option>
											<option value="58">Sóc Trăng</option>
											<option value="134">Sơn La</option>
											<option value="189">Tây Bắc</option>
											<option value="221">Tây Nguyên</option>
											<option value="203">Tây Ninh</option>
											<option value="55">Tiền Giang</option>
											<option value="213">Trà Vinh</option>
											<option value="233">Thái Bình</option>
											<option value="243">Thái Nguyên</option>
											<option value="133">Thanh Hóa</option>
											<option value="132">Vinh</option>
											<option value="57">Vĩnh Long</option>
											<option value="202">Vĩnh Phúc</option>
											<option value="53">Vũng Tàu</option>
											<option value="231">Yên Bái</option>
										</select>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-4 col-xs-12">
									<div class="form-group">
										<label class="mg-b">Ngày khởi hành</label>
										<div class="pos-relative">
											<input autocomplete="off" class="form-control"
												id="departure_date" name="departure_date"
												placeholder="19/07/2019"
												style="-webkit-appearance: none !important;" type="text"
												value=""> <span class="i-calendar"><i
												class="far fa-calendar-alt fa-lg"></i> </span>
										</div>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-4 col-xs-12">
									<div class="form-group">
										<label class="mg-b">Dòng tour</label> <select
											class="form-control input-md" id="DongTour" name="DongTour"
											style="-webkit-appearance: menulist-button !important; line-height: 30px !important;">
											<option value="0">Tất cả</option>
											<option value="1">Cao cấp</option>
											<option value="2">Tiêu chuẩn</option>
											<option value="3">Tiết kiệm</option>
											<option value="4">Giá Tốt</option>
										</select>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-4 col-xs-12">
									<div class="form-group">
										<label class="mg-b">Giá</label> <select
											class="form-control input-md" id="priceID" name="priceID"
											style="-webkit-appearance: menulist-button !important; line-height: 30px !important;">
											<option value="0">Giá</option>
											<option value="25">Dưới 1 Triệu</option>
											<option value="26">1- 2 Triệu</option>
											<option value="27">2-4 Triệu</option>
											<option value="28">4-6 Triệu</option>
											<option value="29">6-10 Triệu</option>
											<option value="30">Trên 10 Triệu</option>
										</select>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-4 col-xs-12">
									<div class="form-group">
										<button type="submit" class="btn btn-md btn-search btn-mg-t"
											onclick="return checkSearch('departureID'); ga('event','Search', 'SearchClick', 'keywords');">
											<i class="fas fa-search"></i>&nbsp;&nbsp;Tìm kiếm
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!--start sildeshow-tour-type-->
<div class="clear"></div>
<div id="tour-type">
	<div class="container">
		<div class="row">
			<div id="myCarousel-tourtype" class="" data-ride="carousel"
				data-type="multi" data-interval="5000">
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item">
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#" title="Cao cấp">
								<img src='<c:url value = "/template/web/image/slide-type/2-9.png"/>' alt="premium"
									class="img-responsive">
									<p class="tourtype-name">Cao cấp</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#" title="Tiêu chuẩn">
								<img src='<c:url value = "/template/web/image/slide-type/bestdeals.png"/>' alt="deluxe"
									class="img-responsive">
									<p class="tourtype-name">Tiêu chuẩn</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#" title="Tiết kiệm">
								<img src='<c:url value = "/template/web/image/slide-type/duthuyen.png"/>' alt="tietkiem"
									class="img-responsive">
									<p class="tourtype-name">Tiết kiệm</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#" title="Giá Tốt">
								<img src='<c:url value = "/template/web/image/slide-type/giasoc.png"/>' alt="giasoc"
									class="img-responsive">
									<p class="tourtype-name">Giá Tốt</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#" title="Tour Bất Động Sản">
								<img src='<c:url value = "/template/web/image/slide-type/nuthan.png"/>'
									alt="Tour Bất Động Sản" class="img-responsive">
									<p class="tourtype-name">Tour Bất Động Sản</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#">
								<img src='<c:url value = "/template/web/image/slide-type/thailand.png"/>' alt="duthuyen"
									class="img-responsive">
									<p class="tourtype-name">Tour du thuyền</p>
								</a>
							</div>
						</div>
					</div>
					<div class="item active">
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#">
								<img src='<c:url value = "/template/web/image/slide-type/giasoc.png"/>'
									alt="Tour Di sản miền Trung" class="img-responsive">
									<p class="tourtype-name">Tour Di sản miền Trung</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#">
								<img src='<c:url value = "/template/web/image/slide-type/2-9.png"/>'
									alt="moi" class="img-responsive">
									<p class="tourtype-name">Tour mới</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#">
								<img src='<c:url value = "/template/web/image/slide-type/nuthan.png"/>'
									alt="Tour hành hương" class="img-responsive">
									<p class="tourtype-name">Tour hành hương</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#">
								<img src='<c:url value = "/template/web/image/slide-type/bestdeals.png"/>'
									alt="Khuyến Mại Tour Thái" class="img-responsive">
									<p class="tourtype-name">Khuyến Mại Tour Thái</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#">
								<img src='<c:url value = "/template/web/image/slide-type/thailand.png"/>'
									alt="Tour ngắm tuyết" class="img-responsive">
									<p class="tourtype-name">Tour Châu âu</p>
								</a>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-6 mg-bot15">
							<div class="item-tour-type">
								<a href="#">
								<img src='<c:url value = "/template/web/image/slide-type/giasoc.png"/>' alt="bestdeals"
									class="img-responsive">
									<p class="tourtype-name">Ưu đãi khủng</p>
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Left and right controls -->
				<!-- <a class="left-type hidden-sm hidden-xs" href="#" data-slide="prev">
                        <img class="chevron chevron-left" src="toidulich/image/slide-type/i-ac-left.png">
                    </a>
                    <a class="right-type hidden-sm hidden-xs" href="#" data-slide="next">
                        <img class="chevron chevron-right" src="toidulich/image/slide-type/i-ac-right.png">
                    </a> -->
				<!-- <a class="left carousel-control hidden-sm hidden-xs" href="#"
					data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
				<a class="right carousel-control" href="#" data-slide="next"><i
					class="glyphicon glyphicon-chevron-right"></i></a> -->
			</div>
		</div>
	</div>
</div>