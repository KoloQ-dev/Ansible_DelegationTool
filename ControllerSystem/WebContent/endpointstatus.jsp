<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ansible.webui.AnsibleExecution" %>
<%@ page import="com.ansible.webui.EndPointStatus" %>
<%@ page import="java.util.ArrayList" %>

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
                            <h3 class="page-header">EndPoint Status</h3>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                    
                    <%
                    	AnsibleExecution anexec = new AnsibleExecution();
                   		ArrayList<EndPointStatus> list = anexec.GetExecuteResult(getServletContext());
                    	//anexec.getStringArray();
                   	 	//System.out.println(anexec.getStringArray()[0]);
                   	 	for (int counter = 0; counter < list.size(); counter++) {
                   	 		EndPointStatus endpstatus = list.get(counter);
                   	 		String panelColor = endpstatus.getAnsibleResult().toString();
                   	 		String endpintName = endpstatus.getEndPointName().toString();
                   	 		String endpointStatus = "Online";
                   	 		if (panelColor == "panel-yellow") { endpointStatus = "Offline"; }
                   	 		if (panelColor == "panel-red") { endpointStatus = "Error"; }
                   	%>
                   	 		
                   	 	<div class="col-lg-3 col-md-6">
                            <div class="panel <%= panelColor %>">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-desktop fa-2x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="middle"><%= endpintName %></div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left"><%= endpointStatus %></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                   	 		
                   	<%
					    }
                    %>
                    
                    
                        <!-- 
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-yellow">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-desktop fa-2x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="middle">NWC05BBKIOS0002</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">Offline</span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-red">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-desktop fa-2x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="middle">NWC05BBKIOS0003</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">Error </span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
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
	</body>
</html>