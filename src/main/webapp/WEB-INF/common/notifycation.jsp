<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${ not empty requestScope.redirect}">
	<%-- <c:redirect url="${redirect}"></c:redirect> --%>
<script type="text/javascript">
    window.location.replace("${redirect}");
</script>
</c:if>
<script type="text/javascript">
toastr.options = {
		  "closeButton": true,
		  "debug": false,
		  "newestOnTop": true,
		  "progressBar": false,
		  "positionClass": "toast-bottom-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
		var notifycation = '${requestScope.notifycation}';
		if(notifycation=='Success'){
			Command: toastr["success"]('${message}')	
		} else if(notifycation=='Info'){
			Command: toastr["info"]('${message}')	
		} else if(notifycation=='Warning'){
			Command: toastr["warning"]('${message}')	
		} else if(notifycation=='Error'){
			Command: toastr["error"]('${message}')	
		}
</script>