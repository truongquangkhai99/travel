<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid">
	<div class="row">
		<table class="table  table-bordered table-hover">
			<thead>
				<tr>
					<th class="col-lg-1">Tác Động</th>
					<th class="col-lg-1">Mã tour</th>
					<th class="col-lg-1">Ngày khởi hành</th>
					<th class="col-lg-2">Hướng dẫn viên</th>
					<th class="col-lg-1">Trạng thái</th>
					<th class="col-lg-2">Thông tin khách sạn</th>
					<th>Giá</th>
					<th class="col-lg-1">Điểm đến</th>
					<th class="col-lg-1">Dịch vụ</th>
					<th class="col-lg-1">Chi phí phát sinh</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tours}" var="tour">
					<tr>
						<td><i class="fa fa-pencil-square-o blue"
							onclick="editUser(${user.id})"></i> <i class="fa fa-trash-o red"
							onclick="deleteTour(${tour.id})"></i> <c:if
								test="${tour.status ==1}">
								<i class="ace-icon fa fa-lock red"
									onclick="lockOrUnLockTour(${tour.id})"></i>
							</c:if> <c:if test="${tour.status ==0}">
								<i class="fa fa-unlock green"
									onclick="lockOrUnLockTour(${tour.id})"></i>
							</c:if> <c:if test="${empty tour.status}">
								<i class="fa fa-unlock green"
									onclick="lockOrUnLockTour(${tour.id})"></i>
							</c:if></td>
						<td class="text-center">${tour.code}</td>
						<td class="text-center">${tour.startDate}</td>
						<td class="text-center">${tour.userId}</td>
						<c:if test="${tour.status ==1}">
							<td class="green"><i class="fa fa-square"> Hoạt động</i></td>
						</c:if>
						<c:if test="${tour.status==0}">
							<td class="red"><i class="fa fa-square"> Bị khóa</i></td>
						</c:if>
						<c:if test="${empty tour.status}">
							<td class="red"><i class="fa fa-square"> Bị khóa</i></td>
						</c:if>
						<td>${tour.hotelInformation}</td>
						<td>${tour.price}</td>
						<td class="text-center"><i class="fa fa-map-marker green"
							aria-hidden="true"></i></td>
						<td class="text-center"><i class="fa fa-cutlery green"></i></td>
						<td>${tour.surcharge}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul class="pagination" id="pagination"></ul>
	</div>
</div>
<script>
			var totalPages = ${totalPages};//số icon chọn page hiển thị trên trang cái này phải tính
			var currentPage = ${page};//page xuất hiện mặc định
			var limit = 10;// số phần thị hiển thị trên table cái này cho sắn
			$(function () {
				window.pagObj = $('#pagination').twbsPagination({
					totalPages: totalPages,
					visiblePages: 10,
					startPage: currentPage,
					onPageClick: function (event, page) {
						if (currentPage != page) {
							$('#maxPageItem').val(limit);
							$('#page').val(page);
							$('#sortName').val('createDate');
							$('#sortBy').val('DESC');
							var data = converFormToObject('searchTour');
							ajaxResponseTxt(data, '/admin/v2/tour/list', 'POST', 'list', function() {
							});
						}
					}
				});
			});
</script>