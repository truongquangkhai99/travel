//common 
$(function() {
	$("#datepicker").datepicker({
		dateFormat : "mm-dd-yy",
	});
	$("#datepicker-1").datepicker({
		dateFormat : "mm-dd-yy",
	});
	$("#datepicker-2").datepicker({
		dateFormat : "mm-dd-yy",
	});
	$("#datepicker-3").datepicker({
		dateFormat : "mm-dd-yy",
	});
	$("#datepicker-4").datepicker({
		dateFormat : "mm-dd-yy",
	});
});

function ajaxResponseTxt(data, uri, method, id, callback) {
	$.ajax({
		url : uri,
		type : method,
		contentType : 'application/json',
		data : JSON.stringify(data),
		dataType : 'html',
		success : function(result) {
			callback();
			$('#'+id).html(result);
		},
		error : function(error) {
			console.log(error);
		}
	});
}
function updateAjax(data, uri, method, callback) {
	$.ajax({
		url : uri,
		type : method,
		contentType : 'application/json',
		data : JSON.stringify(data),
		dataType : 'json',
	}).done(function(data) {
		noti(data.notify, data.message);
		callback();
	}).fail(function(response) {
		noti(response.responseJSON.notify, response.responseJSON.message);
	});
}
function converFormToObject(id) {
	var data = {};
	var formData = $('#' + id).serializeArray();
	$.each(formData, function(i, v) {
		data["" + v.name + ""] = v.value;
	});
	return data;
}
toastr.options = {
	"closeButton" : true,
	"debug" : false,
	"newestOnTop" : false,
	"progressBar" : false,
	"positionClass" : "toast-bottom-right",
	"preventDuplicates" : false,
	"showDuration" : "300",
	"hideDuration" : "1000",
	"timeOut" : "3000",
	"extendedTimeOut" : "1000",
	"showEasing" : "swing",
	"hideEasing" : "linear",
	"showMethod" : "fadeIn",
	"hideMethod" : "fadeOut"
}
var noti = function(notify, message) {
	if (notify === 'success') {
		Command: toastr[notify](message);
	}
	if (notify === 'warning') {
		Command: toastr[notify](message);
	}
	if (notify === 'info') {
		Command: toastr[notify](message);
	}
	if (notify === 'error') {
		Command: toastr[notify](message);
	}
}
// user
