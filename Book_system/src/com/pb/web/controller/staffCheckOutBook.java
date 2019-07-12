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

public class staffCheckOutBook extends AbstractController{
	private String successView;
	private String failView;
	private static String ISBN;
	private static String bookname;
	private final String studentFileName = "/Users/mac/Desktop/2017Spring/487/data/student.csv";
	private final String bookStudent = "/Users/mac/Desktop/2017Spring/487/data/bookStudent.csv";
	private final String bookDate = "/Users/mac/Desktop/2017Spring/487/data/bookDate.csv";
	private final String book = "/Users/mac/Desktop/2017Spring/487/data/book.csv";
	private final  String bookTeacher = "/Users/mac/Desktop/2017Spring/487/data/bookTeacher.csv";
	private final  String teacherFileName = "/Users/mac/Desktop/2017Spring/487/data/teacher.csv";
	private final  String staffFileName = "/Users/mac/Desktop/2017Spring/487/data/staff.csv";
	private final  String bookClass = "/Users/mac/Desktop/2017Spring/487/data/bookClass.csv";
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
			String bookId = request.getParameter("SGN");
			String userId = request.getParameter("userId");
			String Id =request.getParameter("Id");
			String sUserId = request.getParameter("studentUserId");
			if(staffCheckOut(bookId,sUserId)){
				LoginController t = new LoginController();
				Map<String ,Object> model=new HashMap<String,Object>();
				User guest = t.getGuest(userId, Id, staffFileName, studentFileName, teacherFileName);
				model.put("staffPage", guest);
				List<String[]> checkoutInfo = t.getBookInfoForStaff(book,"IN_STOCK");
				List<String> studentInfo = t.getStudentInfoForStaff(studentFileName);
			    List<String[]> returnInfo = t.getBookInfoForStaff(bookStudent,"BOOK_CHECKED_OUT");
			    model.put("staffPageReturnInfo", returnInfo);
				model.put("staffPageStudentInfo", studentInfo);
				model.put("staffPageCheckOutInfo", checkoutInfo);
				return new ModelAndView(getSuccessView(),model);
			}
			else
				return new ModelAndView(getFailView());
		}
	
	public static String addDate(Date start, int days) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Calendar c = Calendar.getInstance();
		c.setTime(start); // Now use input date.
		c.add(Calendar.DATE, days); // Adding days days
		String output = sdf.format(c.getTime());
				
		return output;
	}
	//if 
	
	public static boolean updateBook(String filename, String bookid) throws IOException {
		File inputFileB = new File(filename);
		CSVReader readerB = new CSVReader(new FileReader(inputFileB),',');
		List<String[]> csvBodyB = readerB.readAll();
		readerB.close();
		boolean inbook = false;
		for(int i = 1; i < csvBodyB.size();i++) {
			if(csvBodyB.get(i)[1].equals(bookid)) {// find, change book state to checked out
				ISBN = csvBodyB.get(i)[0];
				bookname = csvBodyB.get(i)[2];
				csvBodyB.get(i)[3] = "BOOK_CHECKED_OUT";
				inbook = true;
			}
		}
		CSVWriter writerB = new CSVWriter(new FileWriter(inputFileB), ',');
	     writerB.writeAll(csvBodyB);
	     writerB.flush();
	     writerB.close();
		return inbook;
	}
	
	public static void updateBookDate(String filename,String bookid) throws IOException {
		File inputFileBD = new File(filename);
		CSVReader readerBD = new CSVReader(new FileReader(inputFileBD),',');
		List<String[]> csvBodyBD = readerBD.readAll();
		readerBD.close();
		String[] temp = new String[csvBodyBD.get(0).length];
		temp[0] = ISBN;// not null
		temp[1] = bookid;
		temp[2] = bookname;//not null
		temp[3] = "BOOK_CHECKED_OUT";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date now = new Date();
		String currentDate = sdf.format(now);
		temp[4] = currentDate;// borrow date
		temp[5] = "";//return date
		temp[6] = addDate(now,100);//due date
		boolean inbd = false;
		for(int i = 1; i < csvBodyBD.size();i++) {
			if(csvBodyBD.get(i)[1].equals(bookid)) {
				temp[0] = csvBodyBD.get(i)[0];
				temp[2] = csvBodyBD.get(i)[2];
				csvBodyBD.get(i)[3] = "BOOK_CHECKED_OUT";
				csvBodyBD.get(i)[4] = currentDate;
				csvBodyBD.get(i)[5] = "";
				csvBodyBD.get(i)[6] = temp[6];
				inbd = true;
				break;
			}
		}
		if(inbd == false) {
			csvBodyBD.add(temp);
		}
		 CSVWriter writerBD = new CSVWriter(new FileWriter(inputFileBD), ',');
	     writerBD.writeAll(csvBodyBD);
	     writerBD.flush();
	     writerBD.close();
		
	}
	
	public String[] updateStudent(String filename,String sUserId) throws IOException {
		File inputFileS = new File(filename);
		CSVReader readerS = new CSVReader(new FileReader(inputFileS),',');
		List<String[]> csvBodyS = readerS.readAll();
		readerS.close();
		String name = "12345";
		String Id = "dalaohu";
		for(int i = 1; i < csvBodyS.size();i++) {
			if(csvBodyS.get(i)[0].equals(sUserId)) {
				csvBodyS.get(i)[9] = "STUDENT_CHECKED_OUT";
				name = csvBodyS.get(i)[1];
				Id = csvBodyS.get(i)[2];
			}
		}
		String[] result = new String[3];
		result[0] = sUserId;
		result[1] = name;
		result[2] = Id;
		 CSVWriter writerS = new CSVWriter(new FileWriter(inputFileS), ',');
	     writerS.writeAll(csvBodyS);
	     writerS.flush();
	     writerS.close(); 
		return result;
	}
	
	
	public void updateBookStudent(String filename, String[] sinfo,String bookid) throws IOException {
		File inputFileBS = new File(filename);
		CSVReader readerBS = new CSVReader(new FileReader(inputFileBS),',');
		List<String[]> csvBodyBS = readerBS.readAll();
		readerBS.close();
		boolean inbs = false;
		for(int i = 1; i < csvBodyBS.size();i++) {
			if(csvBodyBS.get(i)[1].equals(bookid)) {
				csvBodyBS.get(i)[3] = "BOOK_CHECKED_OUT";
				csvBodyBS.get(i)[4] = sinfo[0];
				csvBodyBS.get(i)[5] = sinfo[2];
				csvBodyBS.get(i)[6] = sinfo[1];
				inbs = true;
			}
		}
		
		if(inbs == false) {
			String[] temp = new String[7];
			temp[0] = ISBN;
			temp[1] = bookid;
			temp[2] = bookname;
			temp[3] = "BOOK_CHECKED_OUT";
			temp[4] = sinfo[0];
			temp[5] = sinfo[2];
			temp[6] = sinfo[1];
 			csvBodyBS.add(temp);
		}
		 CSVWriter writerBS = new CSVWriter(new FileWriter(inputFileBS), ',');
	     writerBS.writeAll(csvBodyBS);
	     writerBS.flush();
	     writerBS.close();
	     
	}
	
	public boolean staffCheckOut(String bookid,String sUserId) throws IOException
	{
		
		
		
		
		 
			
		
		File inputFileBT = new File(bookTeacher);
		CSVReader readerBT = new CSVReader(new FileReader(inputFileBT),',');
		List<String[]> csvBodyBT = readerBT.readAll();
		readerBT.close();
		
		File inputFileBC = new File(bookClass);
		CSVReader readerBC = new CSVReader(new FileReader(inputFileBC),',');
		List<String[]> csvBodyBC = readerBC.readAll();
		readerBC.close();
		
		boolean checkOutSuccess = true;
		//If a book was checked out
		//It should change in following order
		//book, add in bookdate,bookstudent,if the book is in book teacher, change;student
		if(checkOutSuccess) {
			//IN BOOK : STATE
			boolean inbook = updateBook(book, bookid);
			if(inbook == false) {
				return false;
			}
			//ADD 1 ROW IN BOOK DATE if book not include
			updateBookDate(bookDate,bookid);
			
			//search in student to get Id and name and change
			String[] sinfo = updateStudent(studentFileName,sUserId);
			//book student: add 1 row if book not in
			updateBookStudent(bookStudent,sinfo,bookid);
			
			//if in BookTeacher, change; if not no teacher select this book as textbook
			for(int i = 1; i < csvBodyBT.size();i++) {
				if(csvBodyBT.get(i)[1].equals(bookid)) {
					csvBodyBT.get(i)[3] = "BOOK_CHECKED_OUT";
					break;
				}
			}
			
			//CHANGE IN BOOK CLASS
			for(int i = 1; i < csvBodyBC.size();i++) {
				if(csvBodyBC.get(i)[1].equals(bookid)) {
					csvBodyBC.get(i)[3] = "BOOK_CHECKED_OUT";
					break;
				}
			}
			
			 // write all csvs into the files
			
		     

		     
		    
		    
		     
		     CSVWriter writerBT = new CSVWriter(new FileWriter(inputFileBT), ',');
		     writerBT.writeAll(csvBodyBT);
		     writerBT.flush();
		     writerBT.close();
		     
		     CSVWriter writerBC = new CSVWriter(new FileWriter(inputFileBC), ',');
		     writerBC.writeAll(csvBodyBC);
		     writerBC.flush();
		     writerBC.close();
		}     
	     return checkOutSuccess;
	}
}
