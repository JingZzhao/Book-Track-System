package com.pb.web.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.opencsv.CSVReader;

public class staffList extends AbstractController{	
	private String showListview;
	private String error;
	
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getShowListview() {
		return showListview;
	}
	public void setShowListview(String showListview) {
		this.showListview = showListview;
	}

	/*Needed data in local flat files*/
	private final String bookFileName = "/Users/mac/Desktop/2017Spring/487/data/book.csv";
	private final String bookClass = "/Users/mac/Desktop/2017Spring/487/data/bookClass.csv";
	private final String teacherFileName = "/Users/mac/Desktop/2017Spring/487/data/teacher.csv";
	private final String staffFileName = "/Users/mac/Desktop/2017Spring/487/data/staff.csv";
	private final String studentFileName = "/Users/mac/Desktop/2017Spring/487/data/student.csv";
	private final String studentbook = "/Users/mac/Desktop/2017Spring/487/data/bookStudent.csv";
	private final String bookDate = "/Users/mac/Desktop/2017Spring/487/data/bookDate.csv";
	
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String listtype = request.getParameter("listtype");
		String bookname = request.getParameter("bookname");
		String ISBN = request.getParameter("ISBN");
		String SGN = request.getParameter("SGN");
		List<String[]> result0 = new ArrayList<>();
		List<String[]> result1 = new ArrayList<>();
		List<String[]> result2 = new ArrayList<>();
		List<String[]> result3 = new ArrayList<>();
		List<String[]> result4 = new ArrayList<>();
		Map<String ,Object> model=new HashMap<String,Object>();
		switch (listtype){
			case "STUDENT_WITH_BOOKS_CHECKED_OUT" : result0 = getStudentWithBooksCheckedOut(studentbook, bookDate) ;
													     break;
			case "BOOKS_CHECKED_OUT_SORTED_BY_CLASS": result3 = getBooksCheckedOutBySTH(bookClass,0); //class code: 0
														 break;
			case "BOOKS_CHECKED_OUT_SORTED_BY_NAME" : result2 = getBooksCheckedOutBySTH(bookFileName,1);//name code : 1
													     break;		
			case "BOOKS_CHECKED_OUT_SORTED_BY_NUMBER": result2 = getBooksCheckedOutBySTH(bookFileName,2);//number code : 2
														break;
			case "SEARCH_BOOK":						   result2 = getSearchBook(bookFileName,bookname,ISBN,SGN);
														break;
			case "STUDENT_ACCOUNT_INFO":			   result1 = getStudentInfo(studentFileName);
														break;
			case "USER_INFO":                          result4 = getUserInfo(studentFileName,teacherFileName,staffFileName);
													   break;
		}
		if(result1 == null||result2 == null) {
			model.put("error", "No result found");
			return new ModelAndView(getError(),model);
		} else {
			model.put("student_checked", result0);
			model.put("student", result1);
			model.put("book", result2);
			model.put("bookclass", result3);
			model.put("user", result4);
			return new ModelAndView(getShowListview(),model);
		}			
		
	}
	//use quick sort to sort this
	public ArrayList<String[]> sort(ArrayList<String[]> target,int req) {
		if(target == null)
			return target;
		quickSort(target, req, 0, target.size() - 1);
		return target;
	}
	
	//quick sort
	public void quickSort(ArrayList<String[]> target,int req, int left, int right) {
		if(left > right) {// left < right : need to sort left == right: only 1 element, already sorted
			return;
		}
		int pos = partition(target,req, left, right);
		quickSort(target,req,left,pos - 1);
		quickSort(target,req,pos + 1, right);
	}
	
	//helper function: partition
	public int partition(ArrayList<String[]> target,int req, int left, int right){
		int pos = left;
		swap(target,pos,right);
		int leftBound = left; // left side is smaller than pos
		int rightBound =right - 1; // right sidde is larger or equal than pos
		while(leftBound <= rightBound) {
			if(elementSmallerThanPos(target.get(leftBound)[req],target.get(pos)[req])) {// no need to move, <
				leftBound ++;
			} else {// element(leftBound) >= elemet(pos)
				if(!elementSmallerThanPos(target.get(rightBound)[req],target.get(pos)[req])) {
					rightBound --;
				} else { // element(leftBound) >= elemet(pos) && element(rightBound) <= element(pos) , just swap
					swap(target,leftBound,rightBound);
				}
				
			}
		}
		//leftBound > rightBound
		//swap rightmost element back to leftBound
		swap(target,leftBound, right);
		return leftBound;
	}
	
	//helper function : swap
	public void swap(ArrayList<String[]> target, int left, int right) {
		String[] temp = target.get(left);
		target.set(left, target.get(right));
		target.set(right, temp);
	}
	
	//helper function : elementSmallerThanPos need test here
	public boolean elementSmallerThanPos(String a, String b) {
		if(a.compareTo(b) < 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public boolean bookMatch(String[] line, String[] compare) {
		int[] showNull = new int [3];
		boolean[] result = new boolean[3];
		if(compare[0] == null) {
			showNull[0] = 0;
		} else {
			showNull[0] = 1;
		}
		if( compare[1] == null) {
			showNull[1] = 0;
		} else {
			showNull[1] = 1;
		}
		if(compare[2] == null) {
			showNull[2] = 0;
		} else {
			showNull[2] = 1;
		}
		//showNull[i] == 1, compare else not compare 
		for(int i = 0; i < 3; i++) {
			if(showNull[i] == 1) {
				result[i] = line[i].equals(compare[i]); 
			} else {
				result[i] = false;
			}
		}
		boolean out = false;
		for(int i = 0; i < 3 ; i++) {
			out = out || result[i];
		}
		return out;	
	}
	
	//List all students with books checked out showing due date and date checked out.
 	public ArrayList<String[]> getStudentWithBooksCheckedOut(String studentBook, String bookDate ) throws IOException{
		List<String[]> result = new ArrayList<>();
		//corner case
		if(studentBook == null || bookDate == null) {
			return null;
		}
		//Open file and search
	    CSVReader reader = new CSVReader(new FileReader(studentBook));
	    List<String[]> sb = reader.readAll();
	    reader.close();
	    CSVReader r= new CSVReader(new FileReader(bookDate));
	    List<String[]> bd = r.readAll();
	    r.close();
	    for(int i = 0; i < sb.size();i++) {
	    	if(sb.get(i)[3].equals("BOOK_CHECKED_OUT")) {//read according line in bookdate
	    		String[] temp = new String[5];
	    		temp[0] = sb.get(i)[4];
	    		temp[1] = sb.get(i)[5];
	    		temp[2] = sb.get(i)[6];
	    		temp[3] = bd.get(i)[4];
	    		temp[4] = bd.get(i)[6];
	    		result.add(temp);
	    	}
	    }
		return (ArrayList<String[]>) result;
		
	} 
	
	//checkout will change state of books in this class
	//bookClass: book data: ISBN, SGN,NAME,STATE| class name
	public ArrayList<String[]> getBooksCheckedOutBySTH(String filename,int STH) throws IOException {
		if(filename == null)
			return null;
		List<String[]> result = new ArrayList<>();
		String[] head;
		CSVReader reader = new CSVReader(new FileReader(filename));
		head = reader.readNext();
	     String [] nextLine;
	     while (( nextLine = reader.readNext()) != null) {
	        if(nextLine[3].equals("BOOK_CHECKED_OUT")) {
	        	String[] temp = new String[nextLine.length];
	        	for(int i = 0; i < temp.length; i++) {
	        		temp[i] = nextLine[i];
	        	}
	        	result.add(temp);    	
	        }  
	     }
	     reader.close();
	     if(STH == 0) {
	     Collections.sort(result, new Comparator<String[]>() {
	    	  public int compare(String[] o1, String[] o2) {
	    	   char[] one = o1[4].toCharArray();
	    	   char[] two = o2[4].toCharArray();
	    	   int length = Math.max(one.length, two.length);
	    	   for(int i = 0; i < length; i++){
	    	   
	    	    if(one[i] > two[i]){
	    	     return 1;
	    	    }
	    	    else if(one[i] < two[i]){
	    	     return -1;
	    	    }
	    	    else{
	    	   
	    	    }
	    	   }
	    	   return -1;
	    	   
	    	  }
	    	 });
	     } else {
	    	 if(STH == 1) {
	    	     Collections.sort(result, new Comparator<String[]>() {
	   	    	  public int compare(String[] o1, String[] o2) {
	   	    	   char[] one = o1[2].toCharArray();
	   	    	   char[] two = o2[2].toCharArray();
	   	    	   int length = Math.max(one.length, two.length);
	   	    	   for(int i = 0; i < length; i++){
	   	    	    if(one[i] > two[i]){
	   	    	     return 1;
	   	    	    }
	   	    	    else if(one[i] < two[i]){
	   	    	     return -1;
	   	    	    }
	   	    	    else{
	   	    	    
	   	    	    }
	   	    	   }
	   	    	   return -1;
	   	    	   
	   	    	  }
	   	    	 });
	    	 } else {
	    	     Collections.sort(result, new Comparator<String[]>() {
	   	    	  public int compare(String[] o1, String[] o2) {
	   	    	   int one = Integer.valueOf(o1[1]);
	   	    	   int two = Integer.valueOf(o2[1]);   	    	   
	   	    	       	   
	   	    	   return (one>two)?1:-1;
	   	    	   
	   	    	  }
	   	    	 });
	    	 }
		     

	     }
	     result.add(0, head);
   	     return (ArrayList<String[]>) result;
	     /*
	     ArrayList<String[]> sortedResult = null;
	     switch(STH) {
	     	//0 : by class
	     	case 0: sortedResult = sort((ArrayList<String[]>) result,4);
	     			break;
	     	//1 : by name
	     	case 1: sortedResult = sort((ArrayList<String[]>) result,2);
	     			break;
	     	//2 : by number
	     	case 2: sortedResult = sort((ArrayList<String[]>) result,1);
	     			break;
	     }
		
		return (ArrayList<String[]>) sortedResult;
		*/
	}
	
	public ArrayList<String[]> getSearchBook(String filename,String bookname,String ISBN,String SGN) throws IOException{
		List<String[]> result = new ArrayList<>();
		//corner case
		if(filename == null|| (bookname == null && ISBN == null && SGN == null)) {
			return null;
		}
		String[] compare = new String[3];
		compare[0] = ISBN;
		compare[1] = SGN;
		compare[2] = bookname;
		//Open file and search
	    CSVReader reader = new CSVReader(new FileReader(filename));
	     String [] nextLine;
	     while (( nextLine = reader.readNext()) != null) {
	        if(bookMatch(nextLine, compare)) {//match, add book info
	        	String[] temp = new String[nextLine.length];
	        	for(int i = 0; i < temp.length; i++) {
	        		temp[i] = nextLine[i];
	        	}
	        	result.add(temp);    	
	        }  
	     }
	     reader.close();
	     String[] bookHead = {"ISBN","SGN","book name","book state"};
	     result.add(0,bookHead);
		return (ArrayList<String[]>) result;	
	}
	
 	public ArrayList<String[]> getStudentInfo(String filename ) throws IOException{
		List<String[]> result = new ArrayList<>();
		//corner case
		if(filename == null) {
			return null;
		}
		//Open file and search
	    CSVReader reader = new CSVReader(new FileReader(filename));
	    result = reader.readAll();
	    reader.close();
		return (ArrayList<String[]>) result;
		
	}
 	
 	public ArrayList<String[]> getUserInfo(String staff,String teacher, String student) throws IOException{
		List<String[]> result = new ArrayList<>();
		//corner case
		if(staff == null || teacher == null || student == null) {
			return null;
		}
		//Open staff and read first 5 line
	    CSVReader rs = new CSVReader(new FileReader(student));
	    String [] nextLine;
	    while (( nextLine = rs.readNext()) != null) {
	        	String[] temp = new String[5];
	        	for(int i = 0; i < temp.length; i++) {
	        		temp[i] = nextLine[i];
	        	}
	        	result.add(temp);    	
	          
	     }
	    rs.close();
	    CSVReader rt = new CSVReader(new FileReader(teacher));
	    nextLine = rt.readNext();
	    while (( nextLine = rt.readNext()) != null) {
	        	String[] temp = new String[5];
	        	for(int i = 0; i < temp.length; i++) {
	        		temp[i] = nextLine[i];
	        	}
	        	result.add(temp);    	
	          
	     }
	    rt.close();	    
	    CSVReader rst = new CSVReader(new FileReader(staff));
	    nextLine = rst.readNext();

	    while (( nextLine = rst.readNext()) != null) {
	        	String[] temp = new String[5];
	        	for(int i = 0; i < temp.length; i++) {
	        		temp[i] = nextLine[i];
	        	}
	        	result.add(temp);    	
	          
	     }
	    rst.close();	    
	    
		return (ArrayList<String[]>) result;
		
	}
}
