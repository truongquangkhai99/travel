<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="search">
	<%@ include file="search.jsp"%>
	<div id="list">
		<%@ include file="list.jsp"%>
	</div>
	<c:url var="tourUrl" value="/admin/v2/tour" />
</div>
<div id="save"></div>
<div class="modal fade" id="myModal" role="dialog"></div>
<script type="text/javascript">
	 $('#btnSearch').click(function(e) {
		searchTour();
	});
	var searchTour = function() {
		$('#maxPageItem').val(10);
		$('#page').val(1);
		$('#sortName').val('createDate');
		$('#sortBy').val('DESC');
		var data = converFormToObject('searchTour');
		ajaxResponseTxt(data, '${tourUrl}/list', 'POST', 'list', function() {
		});
	}
	var saveShow = function() {
		$('#search').hide();
		$('#save').show();
	}
	function deleteTour(id) {
		updateAjax(null, '${tourUrl}/delete/' + id, 'POST', function(){
			$('#maxPageItem').val(10);
			$('#page').val(1);
			$('#sortName').val('createDate');
			$('#sortBy').val('DESC');
			var data = converFormToObject('searchTour');
			ajaxResponseTxt(data, '${tourUrl}/list', 'POST', 'list', function() {
			});
		});
	}
	function editTour(id) {
		ajaxResponseTxt(null, '${tourUrl}/' + id, 'POST', 'save', saveShow);
	}
	function lockOrUnLockTour(id) {
		updateAjax(null, '${tourUrl}/lock/' + id, 'POST', searchTour);
	}
	function addTour() {
		editTour(0);
	}
	function hide() {
		$('#save').hide();
		$('#search').show();
	}
</script>