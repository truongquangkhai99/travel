<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid">
	<div class="row">
		<table class="table  table-bordered table-hover">
			<thead>
				<tr>
					<th class="col-lg-1" >Tác Động</th>
					<th class="col-lg-1">Mã nhân viên</th>
					<th class="col-lg-1">Email</th>
					<th class="col-lg-1">Số điện thoại</th>
					<th class="col-lg-1">Trạng thái</th>
					<th class="col-lg-1">Tên Đăng Nhập</th>
					<th class="col-lg-2">Họ Tên</th>
					<th class="col-lg-1">Số chứng minh thư</th>
					<th class="col-lg-2">Đơn vị</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<td>
							<i class="fa fa-pencil-square-o blue" onclick="editUser(${user.id})"></i>
							<i class="fa fa-trash-o red" onclick="deleteUser(${user.id})"></i>
							<i onclick="showRole(${user.id})" class="fa fa-flag bigger-120 green" data-toggle="modal" data-target="#myModal"></i>
							<c:if test="${user.status ==1}">
								<i class="glyphicon glyphicon-refresh green" onclick="refresh(${user.id})"></i>
							</c:if>
							<c:if test="${user.status ==0}">
								<i class="glyphicon glyphicon-refresh"></i>
							</c:if>
							<c:if test="${empty user.status}">
								<i class="glyphicon glyphicon-refresh"></i>
							</c:if>
							<c:if test="${user.status ==1}">
								<i class="ace-icon fa fa-lock red" onclick="lockOrUnLockUser(${user.id})"></i>
							</c:if>
							<c:if test="${user.status ==0}">
								<i class="fa fa-unlock green" onclick="lockOrUnLockUser(${user.id})"></i>
							</c:if>
							<c:if test="${empty user.status}">
								<i class="fa fa-unlock green" onclick="lockOrUnLockUser(${user.id})"></i>
							</c:if>
						</td>
						<td class="text-center">${user.code}</td>
						<td class="text-center">${user.email}</td>
						<td class="text-center">${user.phoneNumber}</td>
						<c:if test="${user.status ==1}">
							<td class="green"><i class="fa fa-square"> Hoạt động</i></td>
						</c:if>
						<c:if test="${user.status==0}">
							<td class="red"><i class="fa fa-square"> Bị khóa</i></td>
						</c:if>
						<c:if test="${empty user.status}">
								<td class="red"><i class="fa fa-square"> Bị khóa</i></td>
						</c:if>
						<td>${user.username}</td>
						<td>${user.name}</td>
						<td>${user.idNumber}</td>
						<td>${user.orgName}</td>
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
							var data = converFormToObject('searchUser');
							ajaxResponseTxt(data, '/admin/v1/user/list', 'POST', 'list', function() {
							});
						}
					}
				});
			});
</script>