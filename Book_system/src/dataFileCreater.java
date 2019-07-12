import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.opencsv.CSVWriter;

public class dataFileCreater {
	public static void main(String[] args) throws IOException {
		List<String[]> head = new ArrayList<>();
		List<String> filename = new ArrayList<>();
		String filepath = "/Users/mac/Desktop/2017Spring/487/data/";
		/*1.define header of your .csv file here*/
		String[] bookHead = {"ISBN","SGN","book name","book state"};
		String[] staffHead = {"UserId","name","Id","accessLevel","type","Phone"};
		String[] teacherHead = {"UserId","name","Id","accessLevel","type","Phone"};
		String[] studentHead = {"UserId","name","Id","accessLevel","type","FatherName","FatherTel","MotherName","MotherTel","state"};
		String[] bookclassHead = {"ISBN","SGN","book name","book state","class name","class Id"};
		head.add(bookHead);
		head.add(staffHead);
		head.add(teacherHead);
		head.add(studentHead);
		head.add(bookclassHead);
		/*2. define filename of your .csv file here, same order in head*/
		String bookname  = "book.csv";
		String staffname = "staff.csv";
		String teachername = "teacher.csv";
		String studentname = "student.csv";
		String bookclassname = "bookClass.csv";
		filename.add(bookname);
		filename.add(staffname);
		filename.add(teachername);
		filename.add(studentname);
		filename.add(bookclassname);
		for(int i = 0; i < head.size() ; i++) {
			File csvFile = new File(filepath + filename.get(i));
			File parent = csvFile.getParentFile();
			         if (parent != null && !parent.exists()) {
			              parent.mkdirs();
		          }
			csvFile.createNewFile();
			CSVWriter writer = new CSVWriter(new FileWriter(csvFile), ',');
			writer.writeNext(head.get(i));
			writer.close();
		}
//		CSVReader reader = new CSVReader(new FileReader("/Users/mac/Desktop/2017Spring/487/data/student.csv"), ',');
		
	}
}
