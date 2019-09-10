<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
	<meta charset="UTF-8">
	<meta name='viewport' content='width=device-width, initial-scale=1'>
    <%-- <link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/style.css"/>'> --%>
    <link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/bootstap/css/bootstrap.min.css"/>'>
    <link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/style.css"/>'>
    <link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/responsive.css"/>'>
    <link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/fontawesome/css/all.css"/>'>
    <link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/stylemini.css"/>'>
    <link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/hover.css"/>'>
    <link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/xemchitiet.css"/>'>
</head>

<body>

	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="slidebar" />

	<tiles:insertAttribute name="body" />


	<tiles:insertAttribute name="footer" />


</body>
<script src='<c:url value = "/template/web/jquery_321/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value = "/template/web/bootstap/js/bootstrap.min.js"/>'></script>
<script src='<c:url value = "/template/web/js/hompage.js"/>'></script>
<script src='<c:url value = "/template/web/js/themeOrange/script.js"/>'></script>
</html>