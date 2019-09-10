<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container-fluid">
	<div class="row search-layout">
		<div class="col-lg-12">
			<form:form id="searchTour" action="/admin/v1/user" method="POST"
				modelAttribute="tourForm">
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="code" class="col-lg-4 labe-right ">Mã tour</label>
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
							<label for="title" class="col-lg-4 labe-right ">Tiêu đề</label>
							<form:input path="title" type="text " name="title"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="price" class="col-lg-4 labe-right ">Giá</label>
							<form:input path="price" type="text "
								name="price" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="startDate" class="col-lg-4 labe-right ">Ngày khởi hành</label>
							<form:input path="startDate" type="text "
								name="startDate" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
	
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="numberOfSeats" class="col-lg-4 labe-right ">Số lượng người</label>
							<form:input path="numberOfSeats" type="text " name="numberOfSeats"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="departureLocation" class="col-lg-4 labe-right ">Địa điểm khởi hành</label>
							<form:input path="departureLocation" type="text "
								name="departureLocation" class="col-lg-6 form-control" />
						</div>
					</div>
				</div>

				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="hotelInformation" class="col-lg-4 labe-right ">Tên khách sạn</label>
							<form:input path="hotelInformation" type="text " name="hotelInformation"
								class="col-lg-6 form-control" />
						</div>
					</div>
				</div>
				
				<div class="col-lg-6 input-form">
					<div class="container-fluid">
						<div class="row">
							<label for="userId" class="col-lg-4 labe-right ">Hướng dẫn viên</label>
							<form:input path="userId" type="text " name="userId"
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
				onclick="addTour()">Thêm mới</button>
		</div>
	</div>
</div>
