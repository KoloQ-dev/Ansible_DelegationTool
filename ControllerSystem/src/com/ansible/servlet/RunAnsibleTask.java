package com.ansible.servlet;

import com.ansible.webui.CommonUtils;
import com.ansible.webui.LinuxExecution;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RunAnsibleTask
 */
@WebServlet("/RunAnsibleTask")
public class RunAnsibleTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RunAnsibleTask() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String taskExec = request.getParameter("task");
		CommonUtils utils = new CommonUtils();
		String DEFAULTDIR = utils.GetValueFromProperties(getServletContext(), "DEFAULTDIR");
		String retVal = (new LinuxExecution()).executeCommand(DEFAULTDIR, taskExec);
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(retVal);
	}

}
