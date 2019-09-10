<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid">
	<div class="row search-layout">
		<div class="col-lg-12">
			<form:form id="save-user" action="/admin/v1/user" method="POST"
				modelAttribute="tourFormSave">
				<form:input path="id" type="hidden" name="id"
					class="col-lg-6 form-control" />
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="code" class="col-lg-4 labe-right ">Mã tour</label>
							<form:input path="code" type="text " name="code" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="name " class="col-lg-4 labe-right ">Trạng
								thái</label>
							<form:select path="status" class="form-control" name="status">
								<form:option value="">Hãy chọn</form:option>
								<form:option value="1">Hoạt động</form:option>
								<form:option value="0">Không hoạt động</form:option>
							</form:select>
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="title" class="col-lg-4 labe-right ">Tiêu đề</label>
							<form:input path="title" type="text " name="title"
								maxlength="255" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="smallImg" class="col-lg-4 labe-right ">Link ảnh nhỏ</label>
							<form:input path="smallImg" type="text " name="smallImg"
								maxlength="255" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="contentImg" class="col-lg-4 labe-right ">Link ảnh chính</label>
							<form:input path="contentImg" type="text " name="contentImg"
								maxlength="255" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="price" class="col-lg-4 labe-right ">Giá tour</label>
							<form:input path="price" type="text " name="price"
								maxlength="15" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="startDate" class="col-lg-4 labe-right ">Ngày khởi hành</label>
							<form:input path="startDate" type="text " name="startDate"
								class="col-lg-6 form-control"  id="startDate" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="numberOfSeats" class="col-lg-4 labe-right ">Số chỗ</label>
							<form:input path="numberOfSeats" type="text " name="numberOfSeats"
								maxlength="15" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="departureLocation" class="col-lg-4 labe-right ">Địa điểm xuất phát</label>
							<form:input path="departureLocation" type="text " name="departureLocation" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="tourProgram" class="col-lg-4 labe-right ">Chương trình tour</label>
							<form:input path="tourProgram" type="text " name="tourProgram" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="timeOfDepature" class="col-lg-4 labe-right ">Thời gian tập chung</label>
							<form:input path="timeOfDepature" type="text " name="timeOfDepature" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="timeOfEnd" class="col-lg-4 labe-right ">Thời gian kết thúc tour</label>
							<form:input path="timeOfEnd" type="text " name="timeOfEnd" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="flightNumberOfDepature" class="col-lg-4 labe-right ">Số hiệu chuyến bay đi</label>
							<form:input path="flightNumberOfDepature" type="text " name="flightNumberOfDepature" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="flightNumberReturn" class="col-lg-4 labe-right ">Số hiệu chuyến bay về</label>
							<form:input path="flightNumberReturn" type="text " name="flightNumberReturn" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="hotelInformation" class="col-lg-4 labe-right ">Thông tin khách sạn</label>
							<form:input path="hotelInformation" type="text " name="hotelInformation" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="userId" class="col-lg-4 labe-right ">Hướng dẫn viên</label>
							<form:input path="userId" type="text " name="userId" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="dateOfGathering" class="col-lg-4 labe-right ">Ngày tập chung</label>
							<form:input path="dateOfGathering" type="text " name="dateOfGathering" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="gatheringPlace" class="col-lg-4 labe-right ">Địa điểm tập chung</label>
							<form:input path="gatheringPlace" type="text " name="gatheringPlace" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="dateTimeGathering" class="col-lg-4 labe-right ">Giờ tập chung</label>
							<form:input path="dateTimeGathering" type="text " name="dateTimeGathering" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="priceChild" class="col-lg-4 labe-right ">Giá trẻ em dưới 12 tuổi</label>
							<form:input path="priceChild" type="text " name="priceChild" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="priceBaby" class="col-lg-4 labe-right ">Giá trẻ em dưới 3 tuổi</label>
							<form:input path="priceBaby" type="text " name="priceBaby" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="surcharge" class="col-lg-4 labe-right ">Chi phí phát sinh</label>
							<form:input path="surcharge" type="text " name="surcharge" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="note" class="col-lg-4 labe-right ">Chú ý</label>
							<form:input path="note" type="text " name="note" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="licensePlates" class="col-lg-4 labe-right ">Biển số xe</label>
							<form:input path="licensePlates" type="text " name="licensePlates" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

			</form:form>
		</div>
		<div class="button-form">
			<c:if test="${empty userFormSave.id}">
				<button type="button" id="btnAddUser" class="btn btn-primary active">Thêm
					mới</button>
			</c:if>
			<c:if test="${not empty userFormSave.id}">
				<button type="button" id="btnAddUser" class="btn btn-primary active">Cập
					nhật</button>
			</c:if>
			<button type="button" onclick="hide()" id="btnOut"
				class="btn btn-primary active">Quay lại</button>
		</div>
	</div>
</div>
<script>
	/* validate */

	$("#save-user").validate({
		rules : {
			code : {
				required : true,
				maxlength : 15
			},
			status : {
				required : true,
				maxlength : 5
			},
			username : {
				required : true,
				maxlength : 255
			},
			oganizationnalId : {
				required : true,
			},
			password : {
				required : true,
				maxlength : 15
			},
			email : {
				required : true,
				maxlength : 255,
				email : true

			},
			phoneNumber : {
				required : true,
				maxlength : 15,
				number : true
			},
			name : {
				required : true,
				maxlength : 255

			},
			dateOfBirh : {
				required : true,
				date : true

			},
			address : {
				required : true,
				maxlength : 255

			},
			idNumber : {
				required : true,
				maxlength : 15
			}

		},
		errorPlacement : function(error, element) {
			error.insertAfter(element.parents("div.row.insertError"));
		}
	});
	var saveSucces = function(){
		$('#search').show();
		$('#save').hide();
		searchUser();
	}
	$('#btnAddUser').click(function(e) {
		var submit = $("#save-user").valid();
		if (submit == true) {
			var data = converFormToObject('save-user');
			updateAjax(data, '${searchUrl}', 'POST',saveSucces);
		}
	});
	$("#datepicker-5").datepicker({
		dateFormat : "mm-dd-yy",
	});
</script>