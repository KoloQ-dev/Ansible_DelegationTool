package com.ansible.webui;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletContext;

public class CommonUtils {

	private static String propertiesPath = "/WEB-INF/conf.properties";
	
	public boolean CheckDirExist(String path) {
		boolean retBool = false;
		if(Files.exists(Paths.get(path))) { retBool = true; }
		return retBool;
	}
	
	public String GetValueFromProperties(ServletContext servletContext, String key) {
		String retVal = "";
		try {
			InputStream input = servletContext.getResourceAsStream(propertiesPath);
			Properties prop = new Properties();
            prop.load(input);
            retVal = prop.getProperty(key);
        } catch (Exception e) { e.printStackTrace(); }
		return retVal;
	}

	public void AddValueToProperties(ServletContext servletContext, String key, String value) {
		Properties prop = new Properties();
		try {
			InputStream input = servletContext.getResourceAsStream(propertiesPath);
            prop.load(input);
            FileOutputStream output = new FileOutputStream(servletContext.getRealPath(propertiesPath));
            prop.setProperty(key, value);
            prop.store(output, null);
        } catch (Exception e) { e.printStackTrace(); }
	}
	
	
}
