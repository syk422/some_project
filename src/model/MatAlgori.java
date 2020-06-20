package model;

import java.util.ArrayList;

public class MatAlgori {
	

	public ArrayList<allscoreDTO> matAlgori(myidealDTO medto, ArrayList<scoreDTO> list) {
		ArrayList<allscoreDTO> result = new ArrayList<allscoreDTO>();

		for (scoreDTO youdto : list) {
			allscoreDTO dto = new allscoreDTO();
			System.out.println(medto.toString());
			System.out.println(youdto.toString());
			int Tscore = 0;
			int Pscore = 0;
			int Qscore = 0;
			int Bscore = 0;
			int Mscore = 0;
			System.out.println(medto);
			System.out.println(youdto);
			if (medto.getLoc().equals(youdto.getLoc())) { // 지역이 같으면 +2점
				Tscore = Tscore + 10;
				Pscore = Pscore + 10;
			}
			if (medto.getItall() <= youdto.getTall()) { // 내 이상형 키보다 상대방의 키가 클경우 +2점
				Tscore = Tscore + 4;
				Pscore = Pscore + 4;
			}
			if (medto.getIreli().equals(youdto.getReli()) || medto.getIreli().equals("상관없음")) {
				// 내 이상형의 종교와 상대방의 종교가 같거나 내 이상형의 종교가 상관없음이라면 +2점
				Tscore = Tscore + 3;
				Pscore = Pscore + 3;
			}
			if (medto.getIdrink() == youdto.getDrink() || medto.getIdrink() == 0) {
				// 내 이상형의 주량과 상대방의 주량이 일치하거나 내 이상형의 주량이 상관없음 이라면 +2점
				Tscore = Tscore + 8;
				Pscore = Pscore + 8;
			}
			if (medto.getIsmoke() == youdto.getSmoke() || medto.getIsmoke() == 0) {
				// 내 이상형의 흡연여부가 상대방의 흡연여부와 같거나 상관없음 이라면 +2점
				Tscore = Tscore + 5;
				Pscore = Pscore + 5;
			}
			if (medto.getQ1().equals(youdto.getQ1())) { // 본인이 선택한 질문과 상대방의 질문이 같다면 +2점
				Tscore = Tscore + 4;
				Qscore = Qscore + 4;
			}
			if (medto.getQ2().equals(youdto.getQ2())) {
				Tscore = Tscore + 4;
				Qscore = Qscore + 4;
			}
			if (medto.getQ3().equals(youdto.getQ3())) {
				Tscore = Tscore + 4;
				Qscore = Qscore + 4;
			}
			if (medto.getQ4().equals(youdto.getQ4())) {
				Tscore = Tscore + 4;
				Qscore = Qscore + 4;
			}
			if (medto.getQ5().equals(youdto.getQ5())) {
				Tscore = Tscore + 4;
				Qscore = Qscore + 4;
			}
			if (medto.getGender().equals("여성")) {
				// 매칭하는 사람이 여성
				if (medto.getBlood().equals("A")) {
					// 여성이고 혈액형이 A형
					if (youdto.getBlood().equals("A")) {
						// 남성이 A형일 때
						Tscore = Tscore + 21;
						Bscore = Bscore + 21;
					}
					if (youdto.getBlood().equals("B")) {
						// 남성이 B형일 때
						Tscore = Tscore + 6;
						Bscore = Bscore + 6;
					}
					if (youdto.getBlood().equals("O")) {
						// 남성이 O형일 때
						Tscore = Tscore + 28;
						Bscore = Bscore + 28;
					}
					if (youdto.getBlood().equals("AB")) {
						// 남성이 AB형일 때
						Tscore = Tscore + 19;
						Bscore = Bscore + 19;
					}
				}
				if (medto.getBlood().equals("B")) {
					// 여성이고 혈액형이 B형
					if (youdto.getBlood().equals("A")) {
						// 남성이 A형일 때
						Tscore = Tscore + 7;
						Bscore = Bscore + 7;
					}
					if (youdto.getBlood().equals("B")) {
						// 남성이 B형일 때
						Tscore = Tscore + 19;
						Bscore = Bscore + 19;
					}
					if (youdto.getBlood().equals("O")) {
						// 남성이 O형일 때
						Tscore = Tscore + 22;
						Bscore = Bscore + 22;
					}
					if (youdto.getBlood().equals("AB")) {
						// 남성이 AB형일 때
						Tscore = Tscore + 24;
						Bscore = Bscore + 24;
					}
				}
				if (medto.getBlood().equals("O")) {
					// 여성이고 혈액형이 O형
					if (youdto.getBlood().equals("A")) {
						// 남성이 A형일 때
						Tscore = Tscore + 27;
						Bscore = Bscore + 27;
					}
					if (youdto.getBlood().equals("B")) {
						// 남성이 B형일 때
						Tscore = Tscore + 24;
						Bscore = Bscore + 24;
					}
					if (youdto.getBlood().equals("O")) {
						// 남성이 O형일 때
						Tscore = Tscore + 12;
						Bscore = Bscore + 12;
					}
					if (youdto.getBlood().equals("AB")) {
						// 남성이 AB형일 때
						Tscore = Tscore + 9;
						Bscore = Bscore + 9;
					}
				}
				if (medto.getBlood().equals("AB")) {
					// 여성이고 혈액형이 AB형
					if (youdto.getBlood().equals("A")) {
						// 남성이 A형일 때
						Tscore = Tscore + 15;
						Bscore = Bscore + 15;
					}
					if (youdto.getBlood().equals("B")) {
						// 남성이 B형일 때
						Tscore = Tscore + 25;
						Bscore = Bscore + 25;
					}
					if (youdto.getBlood().equals("O")) {
						// 남성이 O형일 때
						Tscore = Tscore + 10;
						Bscore = Bscore + 10;
					}
					if (youdto.getBlood().equals("AB")) {
						// 남성이 AB형일 때
						Tscore = Tscore + 27;
						Bscore = Bscore + 27;
					}
				}
			} // 매칭하는 사람이 여성일 때

			if (medto.getGender().equals("남성")) {
				// 매칭하는 사람이 남성
				if (medto.getBlood().equals("A")) {
					// 남성이고 혈액형이 A형
					if (youdto.getBlood().equals("A")) {
						// 여성이 A형일 때
						Tscore = Tscore + 21;
						Bscore = Bscore + 21;
					}
					if (youdto.getBlood().equals("B")) {
						// 여성이 B형일 때
						Tscore = Tscore + 7;
						Bscore = Bscore + 7;
					}
					if (youdto.getBlood().equals("O")) {
						// 여성이 O형일 때
						Tscore = Tscore + 27;
						Bscore = Bscore + 27;
					}
					if (youdto.getBlood().equals("AB")) {
						// 여성이 AB형일 때
						Tscore = Tscore + 15;
						Bscore = Bscore + 15;
					}
				}
				if (medto.getBlood().equals("B")) {
					// 남성이고 혈액형이 B형
					if (youdto.getBlood().equals("A")) {
						// 여성이 A형일 때
						Tscore = Tscore + 6;
						Bscore = Bscore + 6;
					}
					if (youdto.getBlood().equals("B")) {
						// 여성이 B형일 때
						Tscore = Tscore + 19;
						Bscore = Bscore + 19;
					}
					if (youdto.getBlood().equals("O")) {
						// 여성이 O형일 때
						Tscore = Tscore + 24;
						Bscore = Bscore + 24;
					}
					if (youdto.getBlood().equals("AB")) {
						// 여성이 AB형일 때
						Tscore = Tscore + 25;
						Bscore = Bscore + 25;
					}
				}
				if (medto.getBlood().equals("O")) {
					// 남성이고 혈액형이 O형
					if (youdto.getBlood().equals("A")) {
						// 여성이 A형일 때
						Tscore = Tscore + 28;
						Bscore = Bscore + 28;
					}
					if (youdto.getBlood().equals("B")) {
						// 여성이 B형일 때
						Tscore = Tscore + 22;
						Bscore = Bscore + 22;
					}
					if (youdto.getBlood().equals("O")) {
						// 여성이 O형일 때
						Tscore = Tscore + 12;
						Bscore = Bscore + 12;
					}
					if (youdto.getBlood().equals("AB")) {
						// 여성이 AB형일 때
						Tscore = Tscore + 10;
						Bscore = Bscore + 10;
					}
				}
				if (medto.getBlood().equals("AB")) {
					// 남성이고 혈액형이 AB형
					if (youdto.getBlood().equals("A")) {
						// 여성이 A형일 때
						Tscore = Tscore + 19;
						Bscore = Bscore + 19;
					}
					if (youdto.getBlood().equals("B")) {
						// 여성이 B형일 때
						Tscore = Tscore + 24;
						Bscore = Bscore + 24;
					}
					if (youdto.getBlood().equals("O")) {
						// 여성이 O형일 때
						Tscore = Tscore + 9;
						Bscore = Bscore + 9;
					}
					if (youdto.getBlood().equals("AB")) {
						// 여성이 AB형일 때
						Tscore = Tscore + 27;
						Bscore = Bscore + 27;
					}
				}

			} // 매칭하는 사람이 남성일 때
			
			if (medto.getMbtitype().equals("INFP")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
			}// 매칭자의 mbti유형이 INFP 일때
			
			if (medto.getMbtitype().equals("ENFP")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
			}// 매칭자의 mbti유형이 ENFP 일때
			
			if (medto.getMbtitype().equals("INFJ")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
			}// 매칭자의 mbti유형이 INFJ 일때
			
			if (medto.getMbtitype().equals("ENFJ")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
			}// 매칭자의 mbti유형이 ENFJ 일때
			if (medto.getMbtitype().equals("INTJ")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
			}// 매칭자의 mbti유형이 INTJ 일때
			
			if (medto.getMbtitype().equals("ENTJ")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
			}// 매칭자의 mbti유형이 ENTJ 일때
			
			if (medto.getMbtitype().equals("INTP")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
			}// 매칭자의 mbti유형이 INTP 일때
			
			if (medto.getMbtitype().equals("ENTP")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
			}// 매칭자의 mbti유형이 ENTP 일때
			
			if (medto.getMbtitype().equals("ISFP")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
			}// 매칭자의 mbti유형이 ISFP 일때
			
			if (medto.getMbtitype().equals("ESFP")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
			}// 매칭자의 mbti유형이 ESFP 일때
			
			if (medto.getMbtitype().equals("ISTP")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
			}// 매칭자의 mbti유형이 ISTP 일때
			
			if (medto.getMbtitype().equals("ESTP")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
			}// 매칭자의 mbti유형이 ESTP일때
			
			if (medto.getMbtitype().equals("ISFJ")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
			}// 매칭자의 mbti유형이 ISFJ 일때
			
			if (medto.getMbtitype().equals("ESFJ")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
			}// 매칭자의 mbti유형이 ESFJ 일때
			
			if (medto.getMbtitype().equals("ISTJ")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
			}// 매칭자의 mbti유형이 ISTJ 일때
			
			if (medto.getMbtitype().equals("ESTJ")) {
				if (youdto.getMbtitype().equals("INFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFP")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ENFJ")) {
					Mscore = Mscore + 4;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("INTJ")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 8;
				}
				if (youdto.getMbtitype().equals("ENTJ")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("INTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ENTP")) {
					Mscore = Mscore + 8;
					Tscore = Tscore + 4;
				}
				if (youdto.getMbtitype().equals("ISFP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESFP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISTP")) {
					Mscore = Mscore + 16;
					Tscore = Tscore + 16;
				}
				if (youdto.getMbtitype().equals("ESTP")) {
					Mscore = Mscore + 12;
					Tscore = Tscore + 12;
				}
				if (youdto.getMbtitype().equals("ISFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ESFJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ISTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
				if (youdto.getMbtitype().equals("ESTJ")) {
					Mscore = Mscore + 20;
					Tscore = Tscore + 20;
				}
			}// 매칭자의 mbti유형이 ESTJ 일때
			
			dto.setId(youdto.getId());
			dto.setTscore(Tscore);
			dto.setMscore(Mscore);
			dto.setQscore(Qscore);
			dto.setPscore(Pscore);
			dto.setBscore(Bscore);
			result.add(dto);
			//result 리스트에 아이디 와 각종 점수들을 dto로 넣음.
		} // for 구문
		
		
		
		return result;
	}
	
	
	

}
