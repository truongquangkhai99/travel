<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/bootstap/css/bootstrap.min.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/font-awesome/4.5.0/css/font-awesome.min.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/fonts.googleapis.com.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/ace.min.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/admin/css/ace-skins.min.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/ace-rtl.min.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/admin/css/main.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/jquery-ui-1.12.1.custom/jquery-ui.min.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/datetimepicker-master/jquery.datetimepicker.css"/>'>
<script src='<c:url value = "/template/web/js/jquery-2.1.4.min.js"/>'></script>
<script src='<c:url value = "/template/notifycation/toastr.min.js"/>'></script>
<script src='<c:url value = "/template/admin/js/jquery.validate.min.js"/>'></script>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/notifycation/toastr.min.css"/>'>
<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/ace.min.css"/>'>
<script src='<c:url value = "/template/paging/jquery.twbsPagination.min.js"/>'></script>
<script src="<c:url value='/template/ckeditor/ckeditor.js' />"></script>
<script src="<c:url value='/template/datetimepicker-master/build/jquery.datetimepicker.full.js' />"></script>
<body>
	<div id="notifycation"></div>
	<tiles:insertAttribute name="header" />
	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {
			}
		</script>


		<tiles:insertAttribute name="menu" />
		<div class="main-content"
			style="font: normal normal normal 14px/1 FontAwesome;">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
						</li>

						<li><a href="#">Other Pages</a></li>
						<li class="active">Blank Page</li>
					</ul>
					<!-- /.breadcrumb -->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off" /> <i
								class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</form>
					</div>
					<!-- /.nav-search -->
				</div>

				<div class="page-content">
					<tiles:insertAttribute name="body" />
				</div>
				<!-- /.page-content -->
				
			</div>
		</div>


		<tiles:insertAttribute name="footer" />
	</div>

</body>

<script src='<c:url value = "/template/web/bootstap/js/bootstrap.min.js"/>'></script>
<script src='<c:url value = "/template/admin/js/ace-elements.min.js"/>'></script>
<script src='<c:url value = "/template/admin/js/ace.min.js"/>'></script>
<script src='<c:url value = "/template/admin/js/main.js"/>'></script>
<script src='<c:url value = "/template/jquery-ui-1.12.1.custom/jquery-ui.min.js"/>'></script>
</html>