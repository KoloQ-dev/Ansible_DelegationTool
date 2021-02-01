package com.ansible.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ansible.webui.CommonUtils;
import com.ansible.webui.JsonFile;

/**
 * Servlet implementation class LoadAnsibleTask
 */
@WebServlet("/LoadAnsibleTask")
public class LoadAnsibleTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadAnsibleTask() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String retVal = "Directory not found!";
		String dirPath = request.getParameter("dirPath").toString().toLowerCase();
		
		if((new CommonUtils()).CheckDirExist(dirPath)) {
			JsonFile jsonFile = new JsonFile(dirPath);
			if(jsonFile.getErrorMsg() != null && jsonFile.getErrorMsg().equals("") ) {
				retVal = jsonFile.getJsonAsString();
			}
		}
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(retVal);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
