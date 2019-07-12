package com.pb.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.text.SimpleDateFormat;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;

import com.pb.entity.*;


public class staffPostBill extends AbstractController{
	private String successView;
	private String noneView;


	private final String bookDate = "/Users/mac/Desktop/2017Spring/487/data/bookDate.csv";
	private final String bookStudent = "/Users/mac/Desktop/2017Spring/487/data/bookStudent.csv";
	private final String studentFileName = "/Users/mac/Desktop/2017Spring/487/data/student.csv";
	private final String teacherFileName = "/Users/mac/Desktop/2017Spring/487/data/teacher.csv";
	private final String staffFileName = "/Users/mac/Desktop/2017Spring/487/data/staff.csv";
	LinkedList<bookDate> bdList = new LinkedList<bookDate>();// overdue books list
	
	public String getSuccessView() {
		return successView;
	}
	public void setSuccessView(String successView) {
		this.successView = successView;
	}
	// there's no student need to post bill
	public String getNoneView() {
		return noneView;
	}
	public void setNoneView(String noneView) {
		this.noneView = noneView;
	}
	
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {	
			String userId = request.getParameter("userId");
			String Id =request.getParameter("Id");
			Map<String ,Object> model=new HashMap<String,Object>();
			if(postBill()){
				LoginController t = new LoginController();
				User guest = t.getGuest(userId, Id, staffFileName, studentFileName, teacherFileName);
				model.put("staffPage", guest);
				List<String[]> checkoutInfo = t.getBookInfoForStaff(bookStudent,"IN_STOCK");
				model.put("staffPageCheckOutInfo", checkoutInfo);
				return new ModelAndView(getSuccessView(),model);
			}
			else{
				model.put("error", "No OVERDUE BILL!");
				return new ModelAndView(getNoneView(),model);

			}
		}
	
	//post bill to a student account
	public boolean postBill() throws IOException
	{
		boolean pBSuccess = false;
		
		if(getOverdueBooks())
		{
			// Get all students info
			File inputFileS = new File(studentFileName);
			CSVReader readerS = new CSVReader(new FileReader(inputFileS),',');
			List<String[]> csvBodyS = readerS.readAll();
			//String[] head = csvBodyS.get(0);
			readerS.close();
			if(csvBodyS == null)
				return false;
			
			// Get all student who borrowed books 
			File inputFileBS = new File(bookStudent);
			CSVReader readerBS = new CSVReader(new FileReader(inputFileBS),',');
			List<String[]> csvBodyBS = readerBS.readAll();
			readerBS.close();
			if(csvBodyBS == null)
				return false;
			// Reset all students' amount due
			for(int k =1;k < csvBodyS.size();k++)
			{
				csvBodyS.get(k)[10] = 0 + "";
			}
			
			// match the book with student who borrowed it
			for(int i = 0;i < bdList.size();i++)
			{
				for(int j = 1;j < csvBodyBS.size();j++)
				{					
					if(bdList.get(i).schoolGenerateNumber.equals(csvBodyBS.get(j)[1]))
					{
						for(int m = 1;m < csvBodyS.size();m++)
						{
							if(csvBodyBS.get(j)[5].equals(csvBodyS.get(m)[2]))
							{
								int amountDue = Integer.parseInt(csvBodyS.get(m)[10].toString());
								amountDue += 5;
								csvBodyS.get(m)[10] = amountDue + "";
								break;
							}
						}
					}
				}				
			}// for
			
			// write the amount due into the file
			 CSVWriter writer = new CSVWriter(new FileWriter(inputFileS), ',');
			 //csvBodyS.add(0, head);
		     writer.writeAll(csvBodyS);
		     writer.flush();
		     writer.close();
		     
			pBSuccess = true;
		}// if
		return pBSuccess;
	}
	
	// Get all overdue books(assume borrow date and return date)
	public boolean getOverdueBooks() throws IOException
	{
		boolean hasBook = false;
		// Read all books' borrow date and return date into a list
		File inputFile = new File(bookDate);
		CSVReader reader = new CSVReader(new FileReader(inputFile),',');
		List<String[]> csvBody = reader.readAll();
		if(csvBody == null)
			return false;
		// Find overdue books
		 
		 for(int i = 1;i < csvBody.size();i++)
		 {
			 String [] temp = new String[7];	
			 for(int j = 0;j < temp.length;j++)
			 {
				 temp[j] = csvBody.get(i)[j];
			 }
			 bookDate bd = new bookDate(temp[0],temp[1],temp[2],temp[3],temp[4],temp[5],temp[6]);
			 if(!temp[4].equals(""))
			 {
				 if(bd.dayBetween(temp[4]) > 100)
				  {	
					  bdList.add(bd);
					  hasBook = true;
				  }
			 }			
		 }
		  reader.close();
		  return hasBook;
	}
}
