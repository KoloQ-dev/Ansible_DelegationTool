package com.ansible.webui;

public class TaskExecution {
	private String GroupName = "";
	private String AnsibleCommand = "";
	private String AliasName = "";
	private String AnsibleResult = "";
	
	public TaskExecution(String groupName, String command, String aliasName, String result) {
		this.GroupName = groupName;
		this.AnsibleCommand = command;
		this.AliasName = aliasName;
		this.AnsibleResult = result;
	}
	
	public String getGroupName() { return this.GroupName; }
	public String getAnsibleCommand() { return this.AnsibleCommand; }
	public String getAliasName() { return this.AliasName; }
	public String getAnsibleResult() { return this.AnsibleResult; }
}
