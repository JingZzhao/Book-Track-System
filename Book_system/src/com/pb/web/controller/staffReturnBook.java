package com.pb.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;
import com.pb.entity.User;
import com.pb.entity.bookDate;

public class staffReturnBook extends AbstractController{
	private String successView;
	private String failView;
	private final String studentFileName = "/Users/mac/Desktop/2017Spring/487/data/student.csv";
	private final String bookStudent = "/Users/mac/Desktop/2017Spring/487/data/bookStudent.csv";
	private final String bookDate = "/Users/mac/Desktop/2017Spring/487/data/bookDate.csv";
	private final String book = "/Users/mac/Desktop/2017Spring/487/data/book.csv";
	private final String bookTeacher = "/Users/mac/Desktop/2017Spring/487/data/bookTeacher.csv";
	private final String teacherFileName = "/Users/mac/Desktop/2017Spring/487/data/teacher.csv";
	private final String staffFileName = "/Users/mac/Desktop/2017Spring/487/data/staff.csv";
	private final String bookClass = "/Users/mac/Desktop/2017Spring/487/data/bookClass.csv";
	LinkedList<bookDate> bdList = new LinkedList<bookDate>();// overdue books list
	
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
			String bookId = request.getParameter("SGN_2");
			String userId = request.getParameter("userId");
			String Id =request.getParameter("Id");
			if(staffReturn(bookId)){
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
			else
				return new ModelAndView(getFailView());
		}
	
	public String addDate(Date start, int days) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Calendar c = Calendar.getInstance();
		c.setTime(start); // Now use input date.
		c.add(Calendar.DATE, days); // Adding 5 days
		String output = sdf.format(c.getTime());
				
		return output;
	}
	
	public boolean staffReturn(String bookid) throws IOException
	{
		File inputFileS = new File(studentFileName);
		CSVReader readerS = new CSVReader(new FileReader(inputFileS),',');
		List<String[]> csvBodyS = readerS.readAll();
		readerS.close();
		
		// Get all books info
		File inputFileB = new File(book);
		CSVReader readerB = new CSVReader(new FileReader(inputFileB),',');
		List<String[]> csvBodyB = readerB.readAll();
		readerB.close();		
		
		File inputFileBS = new File(bookStudent);
		CSVReader readerBS = new CSVReader(new FileReader(inputFileBS),',');
		List<String[]> csvBodyBS = readerBS.readAll();
		readerBS.close();
		 
		File inputFileBD = new File(bookDate);
		CSVReader readerBD = new CSVReader(new FileReader(inputFileBD),',');
		List<String[]> csvBodyBD = readerBD.readAll();
		readerBD.close();	
		
		File inputFileBT = new File(bookTeacher);
		CSVReader readerBT = new CSVReader(new FileReader(inputFileBT),',');
		List<String[]> csvBodyBT = readerBT.readAll();
		readerBT.close();	
		
		File inputFileBC = new File(bookClass);
		CSVReader readerBC = new CSVReader(new FileReader(inputFileBC),',');
		List<String[]> csvBodyBC = readerBC.readAll();
		readerBC.close();
		
		boolean checkOutSuccess = false;
		
		for(int e = 1;e < csvBodyBT.size();e++)
		{
			if(csvBodyBT.get(e)[1].equals(bookid))
			{
				csvBodyBT.get(e)[3] = "IN_STOCK";
				break;
			}
		}
		
		//ALL BOOK BELGONS TO TAHT STUDENT IS CHECKED OUT
		for(int i = 1;i < csvBodyBS.size();i++)
		{	
			if(csvBodyBS.get(i)[1].equals(bookid)) // Get student id by book id
			{
				String sId =csvBodyBS.get(i)[5].toString(); 
				String bId = csvBodyBS.get(i)[1].toString();
				//update in Bookdate
				for(int n = 1;n < csvBodyBD.size();n++)
				{
					
					if(bId.equals(csvBodyBD.get(n)[1].toString())) 
					{
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
						Date now = new Date();
						String currentDate = sdf.format(now);
						//String due = sdf.format(dueDate);
						csvBodyBD.get(n)[3] = "IN_STOCK"; // Modify book state in bookDate.csv
						csvBodyBD.get(n)[4] = "";// Modify borrow date
						csvBodyBD.get(n)[5] = currentDate;// Modify return date
						csvBodyBD.get(n)[6] = "";//Modify due date 
						
					}
				}
				//update in Book
				for(int a = 1;a < csvBodyB.size();a++)
				{
					if(bId.equals(csvBodyB.get(a)[1].toString()))
					{
						csvBodyB.get(a)[3] = "IN_STOCK";
						break;
					}											
				}
				
				csvBodyBS.get(i)[3] = "IN_STOCK"; // Modify book state in bookStudent.csv
				csvBodyBS.get(i)[4] = "";
				csvBodyBS.get(i)[5] = "";
				csvBodyBS.get(i)[6] = "";
				
				//update amount due in student
				for(int c = 1;c < csvBodyS.size();c++)
				{
					if(sId.equals(csvBodyS.get(c)[2].toString()))
					{
						if((Integer.parseInt(csvBodyS.get(c)[10].toString())) > 0)
						{
							int amountDue = Integer.parseInt(csvBodyS.get(c)[10].toString());
							amountDue = amountDue - 5; // Modify amount due// SHOULD MODIFY CHECKOUT DATE
							csvBodyS.get(c)[10] = amountDue + "";
						}
					}
				}
				
				boolean noBook = true;
				for(int k = 1;k < csvBodyBS.size();k++)
				{					
				    if(sId.equals(csvBodyBS.get(k)[5].toString()))
				    {
				    	
				    	noBook = false;
				    	break;
				    }
				}
				if(noBook == true) {
					for(int b = 1;b < csvBodyS.size();b++)
					{
						if(sId.equals(csvBodyS.get(b)[2].toString())) 
						{
							csvBodyS.get(b)[9] = "FINISHED"; // Modify student state in book.csv
							csvBodyS.get(b)[10] = "0"; // Modify student amountDue 
						}
					}
				}
				
				checkOutSuccess = true;
				break;
			}
			checkOutSuccess = false;
		}// for
		
		for(int i = 1; i < csvBodyBC.size();i++) {
			if(csvBodyBC.get(i)[1].equals(bookid)) {
				csvBodyBC.get(i)[3] = "IN_STOCK";
				break;
			}
		}
		 // write all csvs into the files
		 CSVWriter writerS = new CSVWriter(new FileWriter(inputFileS), ',');
	     writerS.writeAll(csvBodyS);
	     writerS.flush();
	     writerS.close(); 
	     
	     CSVWriter writerB = new CSVWriter(new FileWriter(inputFileB), ',');
	     writerB.writeAll(csvBodyB);
	     writerB.flush();
	     writerB.close();
	     
	     CSVWriter writerBS = new CSVWriter(new FileWriter(inputFileBS), ',');
	     writerBS.writeAll(csvBodyBS);
	     writerBS.flush();
	     writerBS.close();
	     
	     CSVWriter writerBD = new CSVWriter(new FileWriter(inputFileBD), ',');
	     writerBD.writeAll(csvBodyBD);
	     writerBD.flush();
	     writerBD.close();
	     
	     CSVWriter writerBT = new CSVWriter(new FileWriter(inputFileBT), ',');
	     writerBT.writeAll(csvBodyBT);
	     writerBT.flush();
	     writerBT.close();
	     
	     CSVWriter writerBC = new CSVWriter(new FileWriter(inputFileBC), ',');
	     writerBC.writeAll(csvBodyBC);
	     writerBC.flush();
	     writerBC.close();
	     
	     return checkOutSuccess;
	}
}
