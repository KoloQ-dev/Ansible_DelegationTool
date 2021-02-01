<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.ansible.webui.JsonFile" %>

<!DOCTYPE html>
<html>
	<%@include file='header.jsp' %>

	<body>
        <div id="wrapper">
			<%@include file='navigator.jsp' %>

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="page-header">Register Ansible Task (For DevOps)</h3>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<button onclick="loadTaskFunc()" type="button" value="getErrorMsg" class="btn btn-outline btn-warning">Load</button>
                                    <button onclick="saveTaskFunc()" type="button" value="getErrorMsg" class="btn btn-outline btn-success">Save</button>
									&nbsp;&nbsp;
									<span id="savetaskbtn_ret"></span>
                                </div>
								<div class="panel-body">
                                    <div class="row">
										<div class="col-lg-6">
											<form role="form">
												<div class="form-group">
													<label>Ansible directory</label>
													<input id="savetaskbtn_dir" class="form-control" placeholder="e.g. /etc/ansible/**project/">
												</div>
												<div class="form-group">
													<label>Json content</label>
													<textarea id="savetaskbtn_txt" class="form-control" rows="30"></textarea>
												</div>
												<div class="form-group">
													<a href="controller.json" target="_blank">Json example</a>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
        </div>
        <!-- /#wrapper -->
        <%@include file='footer.jsp' %>
        <script>
			function saveTaskFunc() {
				$.post("SaveAnsibleTask", { 
						dirPath: $("#savetaskbtn_dir").val(), 
						jsonContent: $("#savetaskbtn_txt").val()
					}, 
					function(responseText) {
						$("#savetaskbtn_ret").text(responseText);
						//$("#savetaskbtn_dir").val(responseText);
						//$("#savetaskbtn_txt").text(responseText);
				});
				//storeAnsibleTaskRegisterDir($("#savetaskbtn_dir").val());
			}
			
			function loadTaskFunc() {
				$.get("LoadAnsibleTask", 
						{ dirPath: $("#savetaskbtn_dir").val() },
						function(responseText) {
							if (responseText.startsWith("Directory")) { 
								$("#savetaskbtn_ret").text(responseText); 
							} else {
								$("#savetaskbtn_txt").val(responseText);
								$("#savetaskbtn_ret").text("Loaded!"); 
							} 
				});
				//$.get("LoadDefaultDirAnsibleTask", function(responseText) { $("#savetaskbtn_dir").val(responseText); });
				//storeAnsibleTaskRegisterDir($("#savetaskbtn_dir").val());
			}
			
			window.onload=function(){
			//	$("#savetaskbtn_dir").val(getCookie("ansibletaskregister_dir"));
				$.get("LoadDefaultDirAnsibleTask", 
						function(responseText) {
							$("#savetaskbtn_dir").val(responseText); 
						});
			}
		</script>
	</body>
</html>