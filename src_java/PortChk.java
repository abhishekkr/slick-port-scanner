import java.net.Socket;
import java.io.*;
import java.util.*;

/**
 * just check for a PORT 
 * gets input from a CSV file
 */

/**
 * @author AbhishekKr ~ http://www.twitter.com/abionic
 */

public class PortChk{
	public static void main(String[] args) {
		String fileCSV=null;
		
		if(args.length == 1){
			fileCSV=args[0];
			System.out.println("\nReading from : " + fileCSV);
		}
		else{
			System.out.println("Error: Wrong Syntax\n");
			System.out.println("Syntax: portChk.jar <CSVFile(mandatory)>");
			System.exit(1);
		}
		
		checkPortsFromCSV(fileCSV);
	}//end of main

	private static String[] getNextRecord(String recordLine){
		StringTokenizer st = new StringTokenizer(recordLine,",");
		int toknNum = 0;
		String ipAddr=null;
		String portNum =null;
		String msg =null;
		while (st.hasMoreTokens()){
			if(toknNum==0)
				ipAddr = st.nextToken();
			else if(toknNum==1)
				portNum = st.nextToken();
			else if(toknNum==2)
				msg = st.nextToken();
			toknNum++;
		}//parsing each ,
		String[] record = {ipAddr, portNum, msg};
		return record;
	}

	private static void checkPortsFromCSV(String fileCSV){
		try{
			File file = new File(fileCSV);
			BufferedReader bufRedr = new BufferedReader(new FileReader(file));
			String line=null;
			while((line = bufRedr.readLine()) != null){
			        String[] record = getNextRecord(line);
				if(checkPort(record[0], Integer.parseInt(record[1]))==true){
					System.out.println("\nOpen Port @" + record[0] + " :: " + record[2]);
				}
			}//parsing each line
			bufRedr.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}//end of readCSV
	
	private static boolean checkPort(String ipAddr, int portNum){
		Socket sok = null;
		try {
			sok = new Socket(ipAddr, portNum);
			sok.close();
			return true;
		} catch (Exception e) {
			System.out.println("\nUnable to attach to PORT " + portNum + " @IP: " + ipAddr);
		}
		return false;
	}
}
