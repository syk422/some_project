package model;

import java.util.Calendar;
import java.util.Timer;

public class updateSC {

	public static void main(String[] args) {
		updateTask task = new updateTask();
		Timer timer = new Timer();
		Calendar date = Calendar.getInstance();
		date.set(Calendar.AM_PM, Calendar.AM);
		date.set(Calendar.HOUR, 12);
		date.set(Calendar.MINUTE, 0);
		date.set(Calendar.SECOND, 0);
		
		timer.scheduleAtFixedRate(task, date.getTime(), 1000*60*60*24);
	}

}
