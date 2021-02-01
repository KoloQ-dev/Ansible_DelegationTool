<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.ansible.webui.AnsibleExecution" %>
<%@ page import="com.ansible.webui.TaskExecution" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.TreeSet" %>
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
                            <h3 class="page-header">Deployment Events</h3>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
					<div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-danger">
                                <div class="panel-heading">Result</div>
                                <div class="panel-body">
									<span id="ansibletask_result">"To execute the anisble task, please click on below. "</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    
                    	<%
                    		AnsibleExecution anexec = new AnsibleExecution();
                   			ArrayList<TaskExecution> list = anexec.GetTaskResult(getServletContext());
                   			
                   			Set<String> treeset = new TreeSet<>();
                   			for (int counter = 0; counter < list.size(); counter++) {
                   				TaskExecution endpstatus = list.get(counter);
                   				treeset.add(endpstatus.getGroupName().toString());
                   			}
                   			for (String gVal : treeset) {
                   		%>
                   		<div class="col-lg-12">
                            <div class="panel panel-info">
                                <div class="panel-heading">Target: <%= gVal.toString() %></div>
                                <div class="panel-body">
                                <% 
                                	for (int counter = 0; counter < list.size(); counter++) {
                   						TaskExecution taskExec = list.get(counter);
                   						if (taskExec.getGroupName().toLowerCase().equals(gVal.toLowerCase())) {
                                %>
                                    <button onclick='ansibletask_exec("<%= taskExec.getAnsibleCommand().toString() %>")' type="button" class="btn btn-outline btn-default"><%= taskExec.getAliasName().toString()  %></button>
								<%
                   						}
                                	}
								%>
                                </div>
                            </div>
                        </div>
                   		<%
                   			}
                    	%>
                    
                    	<!--  
                        <div class="col-lg-12">
                            <div class="panel panel-info">
                                <div class="panel-heading">Target: All</div>
                                <div class="panel-body">
                                    <button type="button" class="btn btn-outline btn-default">Deploy All</button>
									<button type="button" class="btn btn-outline btn-default">Instal NSClient</button>
									<button type="button" class="btn btn-outline btn-default">Update IP</button>
									<button type="button" class="btn btn-outline btn-default">Update DNS</button>
									<button type="button" class="btn btn-outline btn-default">Install EIM Service</button>
                                </div>
                            </div>
                        </div>
						<div class="col-lg-12">
                            <div class="panel panel-warning">
                                <div class="panel-heading">Target: *Others</div>
                                <div class="panel-body">
									<button type="button" class="btn btn-outline btn-default">TargetName: Instal NSClient</button>
									<button type="button" class="btn btn-outline btn-default">TargetName: Update IP</button>
									<button type="button" class="btn btn-outline btn-default">TargetName: Update DNS</button>
									<button type="button" class="btn btn-outline btn-default">TargetName: Install EIM Service</button>
                                </div>
                            </div>
                        </div>
                         -->
                        
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
        </div>
        <!-- /#wrapper -->
        
        <%@include file='footer.jsp' %>
        <script>
        	function ansibletask_exec(str) {
        		//alert(str);
        		$.post("RunAnsibleTask", { task: str }, 
				function(responseText) {
					$("#ansibletask_result").text(responseText);
			});
        	}
        </script>
	</body>
</html>