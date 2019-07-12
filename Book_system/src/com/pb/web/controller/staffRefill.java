package com.pb.web.controller;

import java.io.File;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
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
//only 1 line thing need to show, use which view?
public class staffRefill extends AbstractController{
	private String successView;
	private String error;
	private final String book = "/Users/mac/Desktop/2017Spring/487/data/book.csv";	
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
		return error;
	}
	public void setFailView(String failView) {
		this.error = failView;
	}
	
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {	
			String ISBN = request.getParameter("ISBN");
			String name = request.getParameter("name");	
			String userId = request.getParameter("userId");
			String Id =request.getParameter("Id");			
			
			refill(ISBN,name,book);
			
			LoginController t = new LoginController();
			Map<String ,Object> model=new HashMap<String,Object>();
			User guest = t.getGuest(userId, Id, staffFileName, studentFileName, teacherFileName);
			model.put("staffPage", guest);
			List<String[]> checkoutInfo = t.getBookInfoForStaff(book,"IN_STOCK");
			List<String> studentInfo = t.getStudentInfoForStaff(studentFileName);
			model.put("staffPageStudentInfo", studentInfo);
			model.put("staffPageCheckOutInfo", checkoutInfo);
			List<String[]> returnInfo = t.getBookInfoForStaff(bookStudent,"BOOK_CHECKED_OUT");
			model.put("staffPageReturnInfo", returnInfo);
			return new ModelAndView(getSuccessView(),model);
			
			
		}
	//assume data size is not larger than size of memory
	//book: 
	public void refill(String ISBN, String name,String filename) throws IOException {
		File inputFile = new File(filename);

		// Read existing file 
		CSVReader reader = new CSVReader(new FileReader(inputFile), ',');
		List<String[]> csvBody = reader.readAll();
		// get CSV row column  and replace with by using row and column
		reader.close();
		String[] add = new String[4];
		add[0] = ISBN;
		add[1] = String.valueOf(csvBody.size());
		add[2] = name;
		add[3] = "IN_STOCK";
		csvBody.add(add);
		// Write to CSV file which is open
		CSVWriter writer = new CSVWriter(new FileWriter(filename), ',');
		writer.writeAll(csvBody);
		writer.flush();
		writer.close();

		
	}
	
}
