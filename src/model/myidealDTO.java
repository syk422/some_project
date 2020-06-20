package model;

public class myidealDTO {
	String id;
	String gender;
	String loc;
	int itall;
	String ireli;
	int idrink;
	int ismoke;
	String q1;
	String q2;
	String q3;
	String q4;
	String q5;
	String blood;
	String mbtitype;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public int getItall() {
		return itall;
	}
	public void setItall(int itall) {
		this.itall = itall;
	}
	public String getIreli() {
		return ireli;
	}
	public void setIreli(String ireli) {
		this.ireli = ireli;
	}
	public int getIdrink() {
		return idrink;
	}
	public void setIdrink(int idrink) {
		this.idrink = idrink;
	}
	public int getIsmoke() {
		return ismoke;
	}
	public void setIsmoke(int ismoke) {
		this.ismoke = ismoke;
	}
	public String getQ1() {
		return q1;
	}
	public void setQ1(String q1) {
		this.q1 = q1;
	}
	public String getQ2() {
		return q2;
	}
	public void setQ2(String q2) {
		this.q2 = q2;
	}
	public String getQ3() {
		return q3;
	}
	public void setQ3(String q3) {
		this.q3 = q3;
	}
	public String getQ4() {
		return q4;
	}
	public void setQ4(String q4) {
		this.q4 = q4;
	}
	public String getQ5() {
		return q5;
	}
	public void setQ5(String q5) {
		this.q5 = q5;
	}
	public String getBlood() {
		return blood;
	}
	public void setBlood(String blood) {
		this.blood = blood;
	}
	public String getMbtitype() {
		return mbtitype;
	}
	public void setMbtitype(String mbtitype) {
		this.mbtitype = mbtitype;
	}
	@Override
	public String toString() {
		return "myidealDTO [id=" + id + ", gender=" + gender + ", loc=" + loc + ", itall=" + itall + ", ireli=" + ireli
				+ ", idrink=" + idrink + ", ismoke=" + ismoke + ", q1=" + q1 + ", q2=" + q2 + ", q3=" + q3 + ", q4="
				+ q4 + ", q5=" + q5 + ", blood=" + blood + ", mbtitype=" + mbtitype + "]";
	}
	
}
