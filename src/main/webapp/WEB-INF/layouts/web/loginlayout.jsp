<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>Login Page - Ace Admin</title>

    <meta name="description" content="User login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/bootstap/css/bootstrap.min.css"/>'>
	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/font-awesome/4.5.0/css/font-awesome.min.css"/>'>
    <!-- text fonts -->
	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/fonts.googleapis.com.css"/>'>
    <!-- ace styles -->
	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/ace.min.css"/>'>
	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value = "/template/web/css/ace-rtl.min.css"/>'>
	<link rel='stylesheet' type='text/css' media='screen'
	href='<c:url value = "/template/notifycation/toastr.min.css"/>'>
</head>

<body>
	<tiles:insertAttribute name="body" />
</body>
<script src='<c:url value = "/template/web/js/jquery-2.1.4.min.js"/>'></script>
<script src='<c:url value = "/template/jquery-ui-1.12.1.custom/jquery-ui.min.js"/>'></script>
<script src='<c:url value = "/template/notifycation/toastr.min.js"/>'></script>
<script src='<c:url value = "/template/admin/js/main.js"/>'></script>
<script src='<c:url value = "/template/admin/js/jquery.validate.min.js"/>'></script>
    <script type="text/javascript">
        jQuery(function($) {
            $(document).on('click', '.toolbar a[data-target]', function(e) {
                e.preventDefault();
                var target = $(this).data('target');
                $('.widget-box.visible').removeClass('visible'); //hide others
                $(target).addClass('visible'); //show target
            });
        });



        //you don't need this, just used for changing background
        jQuery(function($) {
            $('#btn-login-dark').on('click', function(e) {
                $('body').attr('class', 'login-layout');
                $('#id-text2').attr('class', 'white');
                $('#id-company-text').attr('class', 'blue');

                e.preventDefault();
            });
            $('#btn-login-light').on('click', function(e) {
                $('body').attr('class', 'login-layout light-login');
                $('#id-text2').attr('class', 'grey');
                $('#id-company-text').attr('class', 'blue');

                e.preventDefault();
            });
            $('#btn-login-blur').on('click', function(e) {
                $('body').attr('class', 'login-layout blur-login');
                $('#id-text2').attr('class', 'white');
                $('#id-company-text').attr('class', 'light-blue');

                e.preventDefault();
            });

        });
        $("#changePassword").validate({
    		rules : {
    			username : {
    				required : true,
    				maxlength : 15
    			},
    			password : {
    				required : true,
    				maxlength : 15
    			},
    			newPassword : {
    				required : true,
    				maxlength : 15
    			},
    			repeatPassword : {
    				required : true,
    				maxlength : 15
    			},
    		}
    	});
        function change(){
        	var submit = $("#changePassword").valid();
        	if(submit==true){
        		var data = converFormToObject("changePassword");
            	updateAjax(data, "/password", 'POST', function(){
            		
            	});
        	}
        }
        
    </script>
aaaaaaaaaaaaaaaaaa
</html>
