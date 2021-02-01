package com.ansible.webui;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class JsonFile {
	
	private String fileFullPath = "";
	private String errorMsg = "";
	
	public JsonFile(String dirFullPath) {
		fileFullPath = Paths.get(dirFullPath, ".controller.json").toString();
	}
	
	public String getErrorMsg() {
		return this.errorMsg;
	}
	
	public void setErrorMsg(String errStr) {
		this.errorMsg = errStr;
	}
	
	public String getJsonAsString() {
		String retVal = "";
		try {
			retVal = new String(Files.readAllBytes(Paths.get(fileFullPath)));
		} catch (Exception e) { errorMsg = e.getMessage(); }
		return retVal;
	}
	
	public void setJsonFromString(String jsonStr) {
		try (FileWriter fileWriter = new FileWriter(fileFullPath)) {
			fileWriter.write(jsonStr);
			fileWriter.flush();
		} catch (IOException e) { errorMsg = e.getMessage(); }
	}
}
