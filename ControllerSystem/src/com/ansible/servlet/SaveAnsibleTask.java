package com.ansible.servlet;

import com.ansible.webui.CommonUtils;
import com.ansible.webui.JsonFile;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveAnsibleTask
 */
@WebServlet(description = "For ansibletask.jsp", urlPatterns = { "/SaveAnsibleTask" })
public class SaveAnsibleTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveAnsibleTask() {
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
		
		//System.out.println(request.getParameter("dirPath").toString());
		//System.out.println(request.getParameter("jsonContent").toString());
		
		String retVal = "Directory not found!";
		String dirPath = request.getParameter("dirPath").toString().toLowerCase();
		CommonUtils utils = new CommonUtils(); 
		
		if(utils.CheckDirExist(dirPath)) {
			JsonFile jsonFile = new JsonFile(dirPath);
			jsonFile.setJsonFromString(request.getParameter("jsonContent").toString());
			if(jsonFile.getErrorMsg() != null && jsonFile.getErrorMsg().equals("") ) {
				retVal = "Saved!";
				utils.AddValueToProperties(getServletContext(), "DEFAULTDIR", dirPath);
			} else {
				retVal = "Failed to save json file!";
			}
		}
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(retVal);
		//doGet(request, response);
	}

}
