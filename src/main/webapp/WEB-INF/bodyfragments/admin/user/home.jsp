<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="search">
	<%@ include file="search.jsp"%>
	<div id="list">
		<%@ include file="list.jsp"%>
	</div>
	<c:url var="searchUrl" value="/admin/v1/user" />
</div>
<div id="save"></div>
<div class="modal fade" id="myModal" role="dialog"></div>
<script type="text/javascript">
	$('#btnSearch').click(function(e) {
		searchUser();
	});
	var searchUser = function() {
		$('#maxPageItem').val(10);
		$('#page').val(1);
		$('#sortName').val('createDate');
		$('#sortBy').val('DESC');
		var data = converFormToObject('searchUser');
		ajaxResponseTxt(data, '${searchUrl}/list', 'POST', 'list', function() {
		});
	}
	var saveShow = function() {
		$('#search').hide();
		$('#save').show();
	}
	function deleteUser(id) {
		var data = converFormToObject('save-user');
		updateAjax(data, '${searchUrl}/delete/' + id, 'POST', searchUser);
	}
	function refresh(id) {
		updateAjax(null, '${searchUrl}/refresh/'+id, 'POST', searchUser);
	}
	function editUser(id) {
		ajaxResponseTxt(null, '${searchUrl}/' + id, 'POST', 'save', saveShow);
	}
	function lockOrUnLockUser(id) {
		updateAjax(null, '${searchUrl}/lock/' + id, 'POST', searchUser);
	}
	function addUser() {
		editUser(0);
	}
	function hide() {
		$('#save').hide();
		$('#search').show();
	}
	function showRole(id) {
		ajaxResponseTxt(null, '${searchUrl}/role/' + id, 'GET', 'myModal',
				function() {
				});
	}
</script>