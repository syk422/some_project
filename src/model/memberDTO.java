package model;

public class memberDTO {
String id;
String pw;
String name;
int age;
String gender;
String loc;
String blood;
int tall;
String reli;
int drink;
int smoke;
String mbtitype;
String tel;
String email;
int sc;

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
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
public String getBlood() {
	return blood;
}
public void setBlood(String blood) {
	this.blood = blood;
}
public int getTall() {
	return tall;
}
public void setTall(int tall) {
	this.tall = tall;
}
public String getReli() {
	return reli;
}
public void setReli(String reli) {
	this.reli = reli;
}
public int getDrink() {
	return drink;
}
public void setDrink(int drink) {
	this.drink = drink;
}
public int getSmoke() {
	return smoke;
}
public void setSmoke(int smoke) {
	this.smoke = smoke;
}
public String getMbtitype() {
	return mbtitype;
}
public void setMbtitype(String mbtitype) {
	this.mbtitype = mbtitype;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getSc() {
	return sc;
}
public void setSc(int sc) {
	this.sc = sc;
}
@Override
public String toString() {
	return "memberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", age=" + age + ", gender=" + gender + ", loc="
			+ loc + ", blood=" + blood + ", tall=" + tall + ", reli=" + reli + ", drink=" + drink + ", smoke=" + smoke
			+ ", mbtitype=" + mbtitype + ", tel=" + tel + ", email=" + email + ", sc=" + sc + "]";
}

}
