<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <h3 class="page-header">Uploading File(s)</h3>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
							<div class="panel panel-default">
                                <div class="panel-heading">
                                    <button id="uploadfile_btn" type="button" class="btn btn-outline btn-success">Upload</button>
									<span id="uploadfilebtn_ret"> </span>
                                </div>
								<div class="panel-body">
                                    <div class="row">
										<div class="col-lg-6">
											<form role="form" id="uploadfile_form">
												<div class="form-group">
													<label>File input</label>
                                                    <input id="uploadfile_file" type="file" name="file">
												</div>
												<!-- <div class="form-group">
													<label>File Status</label>
													<textarea id="uploadfile_status" readonly class="form-control" rows="20"></textarea>
												</div> -->
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
			$(document).ready(function() {
				$("#uploadfile_btn").on("click", function() {
					var files = $("#uploadfile_file")[0].files;
					if(files.length > 0) {
						var fd = new FormData();
						fd.append('file',files[0]);
						$.ajax({
				              url: 'FileUploadServlet',
				              type: 'post',
				              data: fd,
				              contentType: false,
				              processData: false,
				              success: function(response) {
				                 if(response != 0) { $("#uploadfilebtn_ret").text(response); } 
				                 else { $("#uploadfilebtn_ret").text("File not uploaded..."); }
				              }
				           });
						
					} else {
						$("#uploadfilebtn_ret").text("Not select any file...");
					}
				});
			});
        </script>
	</body>
</html>