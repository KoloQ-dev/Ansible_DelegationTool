package com.ansible.webui;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletContext;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class AnsibleExecution {
	
	public AnsibleExecution() {}
	
	public ArrayList<EndPointStatus> GetExecuteResult(ServletContext servletContext) {
		CommonUtils utils = new CommonUtils();
		String DEFAULTDIR = utils.GetValueFromProperties(servletContext, "DEFAULTDIR");
		JsonFile jsonFile = new JsonFile(DEFAULTDIR);
		ArrayList<EndPointStatus> list = new ArrayList<EndPointStatus>();
		
		try {
			String jsonStr = jsonFile.getJsonAsString();
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject)parser.parse(jsonStr);
			JSONArray msg = (JSONArray)jsonObj.get("endpointStatus");
			@SuppressWarnings("unchecked")
			Iterator<JSONObject> iterator = msg.iterator();
			LinuxExecution exec = new LinuxExecution();
            while (iterator.hasNext()) {
            	JSONObject obj = (JSONObject)iterator.next();
                //System.out.println(obj.toJSONString());
            	//System.out.println(obj.get("name"));
            	//System.out.println(obj.get("command"));
            	EndPointStatus status = new EndPointStatus(obj.get("name").toString(), 
            												obj.get("command").toString(), 
            												exec.CheckStatus(exec.executeCommand(DEFAULTDIR, obj.get("command").toString())));
            	list.add(status);
            }
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}
	
	public ArrayList<TaskExecution> GetTaskResult(ServletContext servletContext) {
		CommonUtils utils = new CommonUtils();
		String DEFAULTDIR = utils.GetValueFromProperties(servletContext, "DEFAULTDIR");
		JsonFile jsonFile = new JsonFile(DEFAULTDIR);
		ArrayList<TaskExecution> list = new ArrayList<TaskExecution>();
		try {
			String jsonStr = jsonFile.getJsonAsString();
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject)parser.parse(jsonStr);
			JSONArray msg = (JSONArray)jsonObj.get("tasksGroup");
			@SuppressWarnings("unchecked")
			Iterator<JSONObject> iterator = msg.iterator();
            while (iterator.hasNext()) {
            	JSONObject obj = (JSONObject)iterator.next();
            	TaskExecution status = new TaskExecution(obj.get("groupName").toString(), 
            												obj.get("command").toString(),
            												obj.get("name").toString(),
            												"");
            	list.add(status);
            }
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}
	
}
