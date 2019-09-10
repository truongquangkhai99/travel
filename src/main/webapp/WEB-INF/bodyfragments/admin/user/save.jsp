<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid">
	<div class="row search-layout">
		<div class="col-lg-12">
			<form:form id="save-user" action="/admin/v1/user" method="POST"
				modelAttribute="userFormSave">
				<form:input path="id" type="hidden" name="id"
					class="col-lg-6 form-control" />
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="code" class="col-lg-4 labe-right ">Mã nhân
								viên</label>
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
							<label for="username" class="col-lg-4 labe-right ">Tên
								đăng nhập</label>
							<form:input path="username" type="text " name="username"
								maxlength="255" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="email" class="col-lg-4 labe-right ">Email</label>
							<form:input path="email" type="text " name="email"
								maxlength="255" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="phoneNumber" class="col-lg-4 labe-right ">Số
								điện thoại</label>
							<form:input path="phoneNumber" type="text " name="phoneNumber"
								maxlength="15" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="dateOfBirh" class="col-lg-4 labe-right ">Ngày
								sinh</label>
							<form:input path="dateOfBirh" type="text " name="dateOfBirh"
								maxlength="15" class="col-lg-6 form-control" id="datepicker-5" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="address" class="col-lg-4 labe-right ">Địa chỉ</label>
							<form:input path="address" type="text " name="address"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="idNumber" class="col-lg-4 labe-right ">Số
								chứng minh thư</label>
							<form:input path="idNumber" type="text " name="idNumber"
								maxlength="15" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="name" class="col-lg-4 labe-right ">Tên đầy đủ</label>
							<form:input path="name" type="text " name="name" maxlength="15"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid errorTxt">
						<div class="row insertError">
							<label for="status" class="col-lg-4 labe-right ">Đơn vị</label>
							<form:select path="oganizationnalId" class="form-control"
								name="oganizationnalId">
								<form:option value="">Hãy chọn</form:option>
								<form:options items="${organizationBos}"></form:options>
							</form:select>
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