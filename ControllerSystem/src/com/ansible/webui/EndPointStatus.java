package com.ansible.webui;

public class EndPointStatus {
	private String EndPointName = "";
	private String AnsibleCommand = "";
	private String AnsibleResult = "";
	
	public EndPointStatus(String name, String command, String result) {
		this.EndPointName = name;
		this.AnsibleCommand = command;
		this.AnsibleResult = result;
	}
	
	public String getEndPointName() { return this.EndPointName; }
	public String getAnsibleCommand() { return this.AnsibleCommand; }
	public String getAnsibleResult() { return this.AnsibleResult; }
}
