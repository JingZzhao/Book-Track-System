package com.pb.web.controller;


import java.io.File;

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

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;
import com.pb.entity.User;

public class modifyStaffAccount extends AbstractController{
	private String successView;
	private String failView;
	
	/*Needed data in local flat files*/
	private final String studentFileName = "/Users/mac/Desktop/2017Spring/487/data/student.csv";
	private final String teacherFileName = "/Users/mac/Desktop/2017Spring/487/data/teacher.csv";
	private final String staffFileName = "/Users/mac/Desktop/2017Spring/487/data/staff.csv";
	private final String bookStudent = "/Users/mac/Desktop/2017Spring/487/data/bookStudent.csv";

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
	

	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			
			String userId = request.getParameter("userId");
			String Id =request.getParameter("Id");			
			String staffPhone = request.getParameter("staffPhone");			
			
			boolean result = updateStaff(userId,Id,staffPhone,staffFileName);
			if( result == true) {
				LoginController t = new LoginController();
				Map<String ,Object> model=new HashMap<String,Object>();
				User guest = t.getGuest(userId, Id, staffFileName, studentFileName, teacherFileName);
				model.put("staffPage", guest);
				List<String[]> checkoutInfo = t.getBookInfoForStaff(bookStudent,"IN_STOCK");
				List<String> studentInfo = t.getStudentInfoForStaff(studentFileName);
			    List<String[]> returnInfo = t.getBookInfoForStaff(bookStudent,"BOOK_CHECKED_OUT");
			    model.put("staffPageReturnInfo", returnInfo);
				model.put("staffPageStudentInfo", studentInfo);
				model.put("staffPageCheckOutInfo", checkoutInfo);
				return new ModelAndView(getSuccessView(),model);
			} else {
				return new ModelAndView(getFailView());
			}
			
		}
	//change nextLine[5]
	public boolean updateStaff(String userId, String Id, String staffPhone, String staffFileName) throws IOException {
		if(userId == null || Id == null || staffPhone == null ) {
			return false;
		}
		//do the update operation in student file
		File inputFile = new File(staffFileName);
		// read from file and get according data and save in out
	     CSVReader reader = new CSVReader(new FileReader(staffFileName), ',');
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
	        	result[5] = staffPhone;
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
