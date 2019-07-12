package com.pb.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.opencsv.CSVReader;
import com.pb.entity.Staff;
import com.pb.entity.Student;
import com.pb.entity.Teacher;
import com.pb.entity.User;

public class LoginController extends AbstractController {


	public String getStaff() {
		return staff;
	}

	public void setStaff(String staff) {
		this.staff = staff;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getStudent() {
		return student;
	}

	public void setStudent(String student) {
		this.student = student;
	}

	public String getStudentFileName() {
		return studentFileName;
	}

	public String getTeacherFileName() {
		return teacherFileName;
	}

	public String getStaffFileName() {
		return staffFileName;
	}


	private String error;
	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}


	private String staff; 
	private String teacher;
	private String student;
	private int tries = 1;
	/*Needed data in local flat files*/
	private final String studentFileName = "/Users/mac/Desktop/2017Spring/487/data/student.csv";
	private final String teacherFileName = "/Users/mac/Desktop/2017Spring/487/data/teacher.csv";
	private final String staffFileName = "/Users/mac/Desktop/2017Spring/487/data/staff.csv";
	private final String bookStudent = "/Users/mac/Desktop/2017Spring/487/data/bookStudent.csv";
	private final String bookTeacher = "/Users/mac/Desktop/2017Spring/487/data/bookTeacher.csv";
	private final String studentTeacher = "/Users/mac/Desktop/2017Spring/487/data/studentTeacher.csv";
	private final String bookFileName = "/Users/mac/Desktop/2017Spring/487/data/book.csv";

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String ,Object> model=new HashMap<String,Object>();
		// TODO Auto-generated method stub
		if(tries <= 3){
			String userId = request.getParameter("userId");
			String Id =request.getParameter("Id");		
			User guest = getGuest(userId,Id,staffFileName, studentFileName,teacherFileName);
			if(guest !=null) {
				if(guest.getAccessLevel() == 1) {
					model.put("studentPage", guest);
					return new ModelAndView(getStudent(),model);
				} else { 
					if(guest.getAccessLevel() == 2) {
						model.put("teacherPage", guest);
						List<String[]> checkoutInfo = getCheckOutInfoForTeacher(bookStudent,bookTeacher,guest.getId());
						List<String> studentInfo = getStudentInfoForTeacher(studentTeacher,userId,Id);
						model.put("teacherPageCheckOutInfo", checkoutInfo);
						model.put("staffPageStudentInfo", studentInfo);
						return new ModelAndView(getTeacher(),model);
					}	else {
						model.put("staffPage", guest);
						List<String[]> checkoutInfo = getBookInfoForStaff(bookFileName,"IN_STOCK");// borrow book to student
						List<String[]> returnInfo = getBookInfoForStaff(bookStudent,"BOOK_CHECKED_OUT");// return book to student
						List<String> studentInfo = getStudentInfoForStaff(studentFileName);
						model.put("staffPageReturnInfo", returnInfo);
						model.put("staffPageCheckOutInfo", checkoutInfo);
						model.put("staffPageStudentInfo", studentInfo);
						return new ModelAndView(getStaff(),model);
					}
				}
				
			}else{
				this.tries ++;
				model.put("error", "wrong input");
				return new ModelAndView(getError(),model);
			}
		} else {
			model.put("error", "Access locked");
			return new ModelAndView(getError(),model);
		}
	}
	/*******************************************************************************
	 * 
	 * ZHAO, LOOK HERE!!!!!!!!!!!!!!
	 * YOU NEED TO FULLFILL THE FUNCTION OF FOLLOWING METHOD
	 * getCheckOutInfoForTeacher(String bookStudentFile,String studentClassFile)
	 * PLEASE CHANGE LINE WHICH COMMENT PART INDICATE OF MY FUNCTION
	 * getCheckOutInfoForStaff(String bookStudentFile)
	 * @throws IOException 
	 * 
	 * 
	 *******************************************************************************/
	
	//get all student userId
	public ArrayList<String> getStudentInfoForStaff(String student) throws IOException {
		List<String> result = new ArrayList<>();
		CSVReader readerS = new CSVReader(new FileReader(student), ',');
		List<String[]> part = readerS.readAll();
		readerS.close();
		for(int i = 0; i < part.size(); i ++) {
			String temp = part.get(i)[0];
			result.add(temp);
		}
		return (ArrayList<String>) result;
	}
	
	//get student info for teacher
	public ArrayList<String> getStudentInfoForTeacher(String studentTeacher,String userId, String Id) throws IOException {
		List<String> result = new ArrayList<>();
		CSVReader readerS = new CSVReader(new FileReader(studentTeacher), ',');
		String[] nextLine = null;
		 while ((nextLine = readerS.readNext()) != null) {
		        if((nextLine[3]).equals(userId) && nextLine[5].equals(Id)) {
		        	String temp = nextLine[0];
		        	result.add(temp);
		        }
		     }
		readerS.close();
		return (ArrayList<String>) result;
	}
	
	public ArrayList<String[]> getCheckOutInfoForTeacher(String bookStudentFile,String bookTeacherFile,String teacherId) throws IOException{
		List<String[]> result = new ArrayList<>();
		CSVReader readerBS = new CSVReader(new FileReader(bookStudentFile), ',');
		CSVReader readerBT = new CSVReader(new FileReader(bookTeacherFile), ',');
		
		List<String[]> csvBodyBS = readerBS.readAll();
		List<String[]> csvBodyBT = readerBT.readAll();
		readerBS.close();
		readerBT.close();
		
		for(int i = 0;i < csvBodyBS.size();i++)
		{
			if(csvBodyBS.get(i)[3].equals("IN_STOCK"))
			{
				for(int j = 0;j < csvBodyBT.size();j++)
				{
					if(csvBodyBS.get(i)[1].equals(csvBodyBT.get(j)[1]))
					{
						if(csvBodyBT.get(j)[5].equals(teacherId))
						{
							String[] temp = new String[7];
							for(int k =0;k < temp.length;k++)
							{
								temp[k] = csvBodyBS.get(i)[k];
							}
							result.add(temp);
						}
					}
				}
			}
		}
		
		return (ArrayList<String[]>) result;
		
	}
	
	
	public ArrayList<String[]> getBookInfoForStaff(String filename,String bookstate) throws IOException{
		List<String[]> result = new ArrayList<>();
		CSVReader reader = new CSVReader(new FileReader(filename), ',');
		String [] nextLine = reader.readNext();
		/*ZHAO SEE HERE: WHICH COL bookstate will belong, I ASSUMED,BOOK+STUDENT TYPE*/
	     while ((nextLine = reader.readNext()) != null) {
	        if((nextLine[3]).equals(bookstate)) {
	        	String[] temp = new String[nextLine.length];
	        	for(int i = 0; i < temp.length; i++) {
	        		temp[i] = nextLine[i];
	        	}
	        	result.add(temp);
	        }
	     }
	    reader.close();
		
		return (ArrayList<String[]>) result;
	}
	
	/*Search in flat files to find wether it is teacher,staff or student*/
	public User getGuest(String userId,String Id,String staffFile, String studentFile, String teacherFile) throws IOException {
		User result = null;
		//search in 3 file
		String tuple[] = searchFileById(userId,Id,staffFile);
		if(tuple != null) {
			Staff admin = new Staff();
			admin.setUserId(tuple[0]);
			admin.setName(tuple[1]);
			admin.setId(tuple[2]);
			admin.setAccessLevel(Integer.parseInt(tuple[3]));
			admin.setType(tuple[4]);
			admin.setStaffPhone(tuple[5]);
			return admin;
			
		}
		
		tuple = searchFileById(userId,Id,teacherFile);
		if(tuple != null) {
			Teacher teacher = new Teacher();
			teacher.setUserId(tuple[0]);
			teacher.setName(tuple[1]);
			teacher.setId(tuple[2]);
			teacher.setAccessLevel(Integer.parseInt(tuple[3]));
			teacher.setType(tuple[4]);
			teacher.setTeacherPhone(tuple[5]);
			return teacher;
		}
		
		tuple = searchFileById(userId,Id,studentFile);
		if(tuple != null) {
			Student student = new Student();
			student.setUserId(tuple[0]);
			student.setName(tuple[1]);
			student.setId(tuple[2]);
			student.setAccessLevel(Integer.parseInt(tuple[3]));
			student.setType(tuple[4]);
			student.setFatherName(tuple[5]);
			student.setFatherTel(tuple[6]);
			student.setMotherName(tuple[7]);
			student.setMotherTel(tuple[8]);
			student.setState(tuple[9]);// CHANGE HERE, TELL ZHU
			student.setAmountDue(Float.valueOf(tuple[10]));
			return student;
		}
		return result;

	}

	
	/*According to UserId and Id, find info for Student/Staff/Teacher*/
	public String[] searchFileById(String userId, String Id, String filename) throws IOException {
		//If have, return user object
		CSVReader reader = new CSVReader(new FileReader(filename), ',');
		String [] nextLine;
		String[] result = null ;
	     while ((nextLine = reader.readNext()) != null) {
	        if((nextLine[0] + nextLine[2]).equals(userId + Id)) {
	        	result = new String[nextLine.length];
	        	for(int i = 0; i < nextLine.length;i++){
	        		result[i] = nextLine[i];
	        	}
	        	break;
	        }
	     }
	    reader.close();
		return result;
	}

	
}
