<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container-fluid">
	<div class="row search-layout">
		<div class="col-lg-12">
			<form:form id="searchUser" action="/admin/v1/user" method="POST"
				modelAttribute="userForm">
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="code" class="col-lg-4 labe-right ">Mã nhân
								viên</label>
							<form:input path="code" type="text " name="code "
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="status" class="col-lg-4 labe-right ">Trạng
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
					<div class="container-fluid">
						<div class="row">
							<label for="username" class="col-lg-4 labe-right ">Tên
								đăng nhập</label>
							<form:input path="username" type="text " name="username"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="lastChangePassword" class="col-lg-4 labe-right ">Lần
								đổi mật khẩu gần nhất</label>
							<form:input path="lastChangePassword" type="text "
								name="lastChangePassword" class="col-lg-6 form-control"
								id="datepicker" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="lastResetPassword" class="col-lg-4 labe-right ">Lần
								đặt lại mật khẩu gần nhất</label>
							<form:input path="lastResetPassword" type="text "
								name="nlastResetPassword" class="col-lg-6 form-control"
								id="datepicker-1" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
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
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="email" class="col-lg-4 labe-right ">Email</label>
							<form:input path="email" type="text " name="email"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="dateOfBirh" class="col-lg-4 labe-right ">Ngày
								sinh</label>
							<form:input path="dateOfBirh" type="text "
								name="nlastResetPassword" class="col-lg-6 form-control"
								id="datepicker-4" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="address" class="col-lg-4 labe-right ">Địa chỉ</label>
							<form:input path="address" type="text " name="address"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="idNumber" class="col-lg-4 labe-right ">Số chứng minh thư</label>
							<form:input path="idNumber" type="text " name="idNumber"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="name" class="col-lg-4 labe-right ">Tên đầy đủ</label>
							<form:input path="name" type="text " name="name"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="phoneNumber" class="col-lg-4 labe-right ">Số
								Điện thoại</label>
							<form:input path="phoneNumber" type="text " name="phoneNumber"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<input type="hidden" value="" id="page" name="page"/>
				<input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
				<input type="hidden" value="" id="sortName" name="sortName"/>
				<input type="hidden" value="" id="sortBy" name="sortBy"/>
			</form:form>
		</div>
		<div class="button-form">
			<button type="button" id="btnSearch" class="btn btn-primary active">Tìm
				Kiếm</button>
			<button type="button" class="btn btn-primary active"
				onclick="addUser()">Thêm mới</button>
		</div>
	</div>
</div>
