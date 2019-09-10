<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="addRole" value="/admin/v1/user" />
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-body">
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-12">
							<form id="save-user" action="/admin/v1/user" method="POST">
								<div class="col-lg-6 input-form">
									<div class="container-fluid errorTxt">
										<div class="row insertError">
											<label for="status" class="col-lg-4 labe-right ">Đơn
												vị</label> 
												<select id="selectRole" class="form-control" name="role">
													 <c:forEach items="${roles}" var="val"> 
        												<option value="${val}"><c:out value="${val}" ></c:out></option>   
    												 </c:forEach>         
												</select>
										</div>
									</div>
									<button type="button" onclick="saveRole()" class="btn btn-default">save</button>
								</div>
							</form>
							<table id="simple-table"
								class="table  table-bordered table-hover">
								<thead>
									<tr>
										<th>Xóa</th>
										<th>Quyền</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${roleUser}" var="role">
										<tr>
											<td class="center"><i onclick="removeRole('${role}', this)"  class="fa fa-trash-o red"></i></td>
											<td>${role}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.span -->
					</div>
					<!-- /.row -->



					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>
<script>
	var inserTable = function(){
		var roleName =$("#selectRole").val()+'';
		var row ='<tr><td class="center"><i onclick="removeRole(\''+roleName+'\',this)" class="fa fa-trash-o red"></i></td><td>'+roleName+'</td></tr>';
		$("#simple-table").find('tbody').append(row);
	}
	function saveRole(){
		var roleName =$("#selectRole").val()+''
		updateAjax({}, '${addRole}/role/'+roleName+'/'+${id}, 'POST',inserTable);
	}
	
	function removeRole(roleName, element){
		$(element).parent().parent().remove();
		updateAjax({}, '${addRole}/role/remove/'+roleName+'/'+${id}, 'POST',function no(){});
	}

</script>