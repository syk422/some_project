package model;

import java.util.TimerTask;

public class updateTask extends TimerTask{

	@Override
	public void run() {
		SomeDAO dao = new SomeDAO();
		dao.updateSC2();
	}
	
}
