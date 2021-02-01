package com.ansible.webui;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class LinuxExecution {

	private static String SUCCESS = "SUCCESS =>";
	private static String UNREACHABLE = "UNREACHABLE! =>";
	
	private static String Green = "panel-green";
	private static String Yellow = "panel-yellow";
	private static String Red = "panel-red";
	
	public String executeCommand(String dirPath,String command) {
		StringBuffer output = new StringBuffer();
		Process p;
		try {
            p = Runtime.getRuntime().exec("cd " + dirPath + " ; " + command);
            p.waitFor();
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = "";			
            while ((line = reader.readLine())!= null) { output.append(line + "\n"); }
        } catch (Exception e) { }
		return output.toString();
	}
	
	public String CheckStatus(String outcome) {
		if (containsIgnoreCase(outcome, SUCCESS)) { return Green; }
		if (containsIgnoreCase(outcome, UNREACHABLE)) { return Yellow; }
		return Red;
	}
	
	public static boolean containsIgnoreCase(String str, String subString) {
        return str.toLowerCase().contains(subString.toLowerCase());
    }
}
