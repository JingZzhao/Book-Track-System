package com.pb.entity;

import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;


public class bookDate {

	public String ISBN;	
	public String schoolGenerateNumber;
	public String name;
	public String state;
	public String borrowDate;
	public String dueDate;
	public String returnDate;
	public String bookState;
	
	public bookDate(String isbn,String bookId,String bookName,String bookstate,String bd,String dued,String rd)
	{
		ISBN = isbn;
	    schoolGenerateNumber = bookId;
	    name = bookName;
	    bookState = bookstate;
		borrowDate = bd;
		dueDate = dued;
		returnDate = rd;
	}
	
	// Get days between two dates
	public int dayBetween(String bd)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Calendar c = Calendar.getInstance();
		long timeB = 0;
		long timeC = 0;
		
		Date now = new Date();
		String currentDate = sdf.format(now);
		
		try{
			c.setTime(sdf.parse(bd));
			timeB = c.getTimeInMillis();
			c.setTime(now);
			timeC = c.getTimeInMillis();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		long betweenDays = (timeC - timeB)/(100*3600*240);
		
		return Integer.parseInt(String.valueOf(betweenDays));
	}
}
