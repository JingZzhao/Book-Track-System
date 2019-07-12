package com.pb.web.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.w3c.dom.ls.LSInput;

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;
import com.pb.entity.User;

public class modifyStudentAccount extends AbstractController{
	private String successView;
	private String failView;
	
	/*Needed data in local flat files*/
	private final String studentFileName = "/Users/mac/Desktop/2017Spring/487/data/student.csv";
	private final String teacherFileName = "/Users/mac/Desktop/2017Spring/487/data/teacher.csv";
	private final String staffFileName = "/Users/mac/Desktop/2017Spring/487/data/staff.csv";
	
	public String getSuccessView() {
		return successView;
	}
	public void setSuccessView(String successView) {
		this.successView = successView;
	}
	public String getFailView() {
		return failView;
	}
	public void setFailView(String failView) {
		this.failView = failView;
	}
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			
			String userId = request.getParameter("userId");
			String Id =request.getParameter("Id");
			String fatherName = request.getParameter("fatherName");
			String fatherTel = request.getParameter("fatherTel");
			String motherName = request.getParameter("motherName");
			String motherTel = request.getParameter("motherTel");			
			
			boolean result = updateStudent(userId,Id,fatherName,fatherTel,motherName,motherTel,studentFileName);
			if( result == true) {
				LoginController t = new LoginController();
				Map<String ,Object> model=new HashMap<String,Object>();
				User guest = t.getGuest(userId, Id, staffFileName, studentFileName, teacherFileName);
				model.put("studentPage", guest);
				return new ModelAndView(getSuccessView(),model);
			} else {
				return new ModelAndView(getFailView());
			}
			
		}
	
	public boolean updateStudent(String userId, String Id, String fatherName, String fatherTel, String motherName, String motherTel, String studentFileName) throws IOException {
		if(userId == null || Id == null || fatherName == null || motherName == null || fatherTel == null || motherTel == null) {
			return false;
		}
		//do the update operation in student file
		File inputFile = new File(studentFileName);
		// read from file and get according data and save in out
	     CSVReader reader = new CSVReader(new FileReader(studentFileName), ',');
	     String [] nextLine;
	     int row = 0;
	     String[] result = null;
	     boolean findrow = false;
	     List<String []> csvBody = new ArrayList<>(); 
	     while ((nextLine = reader.readNext()) != null) {
	        if(nextLine[0].equals(userId) && nextLine[2].equals(Id)) {
	        	result = new String[nextLine.length];
	        	for(int i = 0; i < 5; i++) {
	        		result[i] = nextLine[i];
	        	}
	        	result[5] = fatherName;
        		result[6] = fatherTel;
        		result[7] = motherName;
        		result[8] = motherTel;
        		result[9] = nextLine[9];
        		result[10] = nextLine[10];
        		findrow = true;
        		csvBody.add(result);
	        }else {
	        	csvBody.add(nextLine);
	        }
	        if(findrow == false) {
	        	row++;
	        }
	     }
	     reader.close();
	     if(result == null) {//can't find condition, which should avoid
	    	 return false;
	     }
	     //update according row
	     for(int i = 0; i < result.length; i++) {
	    	 csvBody.get(row)[i] = result[i];
	     }
	     //write all to the former file
	     CSVWriter writer = new CSVWriter(new FileWriter(inputFile), ',');
	     writer.writeAll(csvBody);
	     writer.flush();
	     writer.close();
		
		return true;
	}
}
