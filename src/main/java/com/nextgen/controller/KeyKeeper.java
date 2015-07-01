package com.nextgen.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class KeyKeeper {
	public static ArrayList<String> APP;
	
	public static ArrayList<String> getAPP() {
		String filename = "C:\\temptxt\\temp.txt";
		ArrayList<String> APP = new ArrayList<String>();
		String line = null;
		try {
			FileReader fileReader = new FileReader(filename);
			
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			
			while ((line = bufferedReader.readLine()) != null){
				System.out.println("Line: " + line);
				APP.add(line);
			}
			
			bufferedReader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return APP;
	}

}
