package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class SomeDAO {
	
	Connection con;
	DBConnectionMgr mgr;
	public SomeDAO() {
		mgr = DBConnectionMgr.getInstance();
	}
//bbs table에 insert	
	public int insert(BbsDTO dto) throws Exception {
		int result = 0;
		con = mgr.getConnection();
		// 3.SQL문 결정/생성
		String sql = "insert into bbs values(?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getNo());
		ps.setString(2, dto.getId());
		ps.setString(3, dto.getStar());
		ps.setString(4, dto.getContent());
		ps.setDate(5, null);
		ps.setString(6, dto.getService());
		System.out.println("3.ok----------");
		
		// 4.DB로 SQL문 전송
		result = ps.executeUpdate();
		System.out.println("4.ok----------");
	
		mgr.freeConnection(con, ps);
		
		return result;
	}
//solve table에 insert
	public void solveInsert(solveDTO dto) {
		try {
			con = mgr.getConnection();
			//sql문 결정
			String sql = "insert into solve values (?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,dto.getId());
			ps.setString(2, dto.getGender());
			ps.setString(3,dto.getQ1());
			ps.setString(4,dto.getA1());
			ps.setString(5,dto.getQ2());
			ps.setString(6,dto.getA2());
			ps.setString(7,dto.getQ3());
			ps.setString(8,dto.getA3());
			System.out.println("3. sql문 결정 ok");
			//sql문 전송
			ps.executeUpdate();
			System.out.println("4. sql문 전송 ok");
			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//message table에 insert
	public void messageInsert(MessageDTO dto) {
		try {
			con = mgr.getConnection();
			//sql문 결정
			String sql = "insert into message values (?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getSendid());
			ps.setString(2, dto.getReceiveid());
			ps.setString(3, dto.getContent());
			System.out.println("3. sql문 결정 ok");
			//sql문 전송
			ps.executeUpdate();
			System.out.println("4. sql문 전송 ok");
			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<makequestDTO> questionList(makequestDTO dto) throws Exception {
		ArrayList<makequestDTO> list = new ArrayList<makequestDTO>();
		con =mgr.getConnection();
		// 3.SQL문 결정/생성
		String sql = "select * from makequest where category = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCategory());
		System.out.println("3.ok----------");
		
		// 4.DB로 SQL문 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4.ok----------");
		while (rs.next()) { 
			//결과로 가지고 온 테이블의 행을 한줄씩 내려가서 있는지 체크
			String question = rs.getString(2);
			String answer1 = rs.getString(3);
			String answer2 = rs.getString(4);
			String answer3 = rs.getString(5);
			makequestDTO dto2 = new makequestDTO();
			dto2.setCategory(dto.getCategory());
			dto2.setQuestion(question);
			dto2.setAnswer1(answer1);
			dto2.setAnswer2(answer2);
			dto2.setAnswer3(answer3);
			list.add(dto2);
		}
		mgr.freeConnection(con, ps, rs);
		return list;
	}
//쪽지 검색하기
	public ArrayList<MessageDTO> messageList(String id) throws Exception {
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		con =mgr.getConnection();
		// 3.SQL문 결정/생성
		String sql = "select * from message where receiveid = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		System.out.println("3.ok----------");
		
		// 4.DB로 SQL문 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4.ok----------");
		while (rs.next()) { 
			//결과로 가지고 온 테이블의 행을 한줄씩 내려가서 있는지 체크
			MessageDTO dto = new MessageDTO();
			String sendid = rs.getString(1);
			String content = rs.getString(3);
			dto.setSendid(sendid);
			dto.setReceiveid(id);
			dto.setContent(content);
			list.add(dto);
		}
		mgr.freeConnection(con, ps, rs);
		return list;
	}
	
	public makequestDTO answerList(String question) throws Exception {
		makequestDTO dto = new makequestDTO();
		con =mgr.getConnection();
		// 3.SQL문 결정/생성
		String sql = "select * from makequest where question = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, question);
		System.out.println("3.ok----------");
		
		// 4.DB로 SQL문 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4.ok----------");
		while (rs.next()) { 
			//결과로 가지고 온 테이블의 행을 한줄씩 내려가서 있는지 체크
			String answer1 = rs.getString(3);
			String answer2 = rs.getString(4);
			String answer3 = rs.getString(5);
			dto.setAnswer1(answer1);
			dto.setAnswer2(answer2);
			dto.setAnswer3(answer3);
		}
		mgr.freeConnection(con, ps, rs);
		return dto;
	}
	
	public solveDTO quizList(String gender) throws Exception {
		solveDTO dto2 = new solveDTO();
		con =mgr.getConnection();
		// 3.SQL문 결정/생성
		String sql = "select * from solve where gender =? order by rand() limit 1";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, gender);
		System.out.println("3.ok----------");
		
		// 4.DB로 SQL문 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4.ok----------");
		while (rs.next()) { 
			//결과로 가지고 온 테이블의 행을 한줄씩 내려가서 있는지 체크
			String id = rs.getString(1);
			String q1 = rs.getString(3);
			String a1 = rs.getString(4);
			String q2 = rs.getString(5);
			String a2 = rs.getString(6);
			String q3 = rs.getString(7);
			String a3 = rs.getString(8);
			dto2.setId(id);
			dto2.setGender(gender);
			dto2.setQ1(q1);
			dto2.setA1(a1);
			dto2.setQ2(q2);
			dto2.setA2(a2);
			dto2.setQ3(q3);
			dto2.setA3(a3);
		}
		mgr.freeConnection(con, ps, rs);
		return dto2;
	}
	
	//sc 검색
	public int myCount(String Id) {
	      int count = 0;
	      try {
	         con = mgr.getConnection();
	         //sql문 결정
	         String sql = "select * from member where id = ?";
	         PreparedStatement ps = con.prepareStatement(sql);
	         ps.setString(1, Id);
	         System.out.println("3. sql문 결정 ok");
	         //sql문 전송
	         ResultSet rs = ps.executeQuery();
	         System.out.println("4. sql문 전송 ok");
	         
	         if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
	            System.out.println("검색 결과가  있어요!");
	            count = rs.getInt(15);
	         }
	         mgr.freeConnection(con, ps);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return count;
	}
		
	//sc 업데이트
	public void updateSC(String id, int count) {
		try {
	         con = mgr.getConnection();
	         //sql문 결정
	         String sql = "update member set sc = ? where id = ?";
	         PreparedStatement ps = con.prepareStatement(sql);
	         ps.setInt(1, count);
	         ps.setString(2, id);
	         System.out.println("3. sql문 결정 ok");
	         //sql문 전송
	         ps.executeUpdate();
	         mgr.freeConnection(con, ps);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	}
	
	public ArrayList<BbsDTO> listAll(int x) throws Exception {
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		con = mgr.getConnection();
		// 3.SQL문 결정/생성
		String sql = "select * from bbs order by date desc limit ? , ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, x);
		ps.setInt(2, 5);
	
		System.out.println("3.ok----------");
		
		// 4.DB로 SQL문 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4.ok----------");
		while (rs.next()) { 
			BbsDTO dto = new BbsDTO();
			String no = rs.getString(1);
			String id = rs.getString(2);
			String star = rs.getString(3);
			String content = rs.getString(4);
			java.sql.Timestamp time = rs.getTimestamp(5);
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-mm-ss");
			String date = fm.format(time);
			String service = rs.getString(6);
			dto.setNo(no);
			dto.setId(id);
			dto.setStar(star);
			dto.setContent(content);
			dto.setDate(date);
			dto.setService(service);
			list.add(dto);
		}
		mgr.freeConnection(con, ps, rs);
		
		return list;
	}
	
//id 중복체크	
		public int idOver(memberDTO dto) { 
			int result = 0; //없을 때
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "select id from member where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, dto.getId());
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					System.out.println("검색 결과가  있어요!");
					result = 1;
					mgr.freeConnection(con, ps);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
//회원가입처리
	//member table에 insert
		public void memberInsert(memberDTO dto) {
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,dto.getId());
				ps.setString(2,dto.getPw());
				ps.setString(3,dto.getName());
				ps.setInt(4,dto.getAge());
				ps.setString(5,dto.getGender());
				ps.setString(6,dto.getLoc());
				ps.setString(7,dto.getBlood());
				ps.setInt(8,dto.getTall());
				ps.setString(9,dto.getReli());
				ps.setInt(10,dto.getDrink());
				ps.setInt(11,dto.getSmoke());
				ps.setString(12,dto.getMbtitype());
				ps.setString(13,dto.getTel());
				ps.setString(14,dto.getEmail());
				ps.setInt(15,dto.getSc());
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ps.executeUpdate();
				System.out.println("4. sql문 전송 ok");
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	//mit table에 insert
		public void mitInsert(mitDTO dto) {
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "insert into mit values (?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,dto.getId());
				ps.setInt(2, dto.getItall());
				ps.setString(3,dto.getIreli());
				ps.setInt(4,dto.getIdrink());
				ps.setInt(5,dto.getIsmoke());
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ps.executeUpdate();
				System.out.println("4. sql문 전송 ok");
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
	//question table에 insert
		public void questInsert(questionDTO dto) {
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "insert into question values (?,?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,dto.getId());
				ps.setString(2,dto.getQ1());
				ps.setString(3,dto.getQ2());
				ps.setString(4,dto.getQ3());
				ps.setString(5,dto.getQ4());
				ps.setString(6,dto.getQ5());
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ps.executeUpdate();
				System.out.println("4. sql문 전송 ok");
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	//로그인	
		public int loginCheck(memberDTO dto) {
			int result = 0;
			try {
				con = mgr.getConnection();
				//3)sql문 결정
				String sql = "select * from member where id = ? and pw = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, dto.getId());
				ps.setString(2, dto.getPw());
				System.out.println("3. sql문 결정 ok");
				//4)sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					System.out.println("검색 결과가  있어요!");
					result = 1;
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		//비밀번호 확인 DAO
		public int pwCheck(String id , String pw) {
			int result = 0;
			try {
				con = mgr.getConnection();
				//3)sql문 결정
				String sql = "select pw from member where id = ? and pw =?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pw);
				System.out.println("3. sql문 결정 ok");
				//4)sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					System.out.println("검색 결과가  있어요!");
					result = 1;
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		
		
// 멤버 테이블 검색
	public memberDTO myInfo(String Id) {
		memberDTO dto2 = null;
		try {
			con = mgr.getConnection();
			//sql문 결정
			String sql = "select * from member where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, Id);
			System.out.println("3. sql문 결정 ok");
			//sql문 전송
			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 전송 ok");
			
			if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
				System.out.println("검색 결과가  있어요!");
				dto2 = new memberDTO();
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				int age = rs.getInt(4);
				String gender = rs.getString(5);
				String tel = rs.getString(13);
				String email = rs.getString(14);
				String blood = rs.getString(7);
				dto2.setId(id);
				dto2.setPw(pw);
				dto2.setName(name);
				dto2.setAge(age);
				dto2.setGender(gender);
				dto2.setTel(tel);
				dto2.setEmail(email);
				dto2.setBlood(blood);
			}
			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(dto2);
		return dto2;
	}
	
	// 이상형 테이블 검색
		public mitDTO Iinfo(String Id) {
			mitDTO dto2 = null;
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "select * from mit where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, Id);
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					System.out.println("검색 결과가  있어요!");
					dto2 = new mitDTO();
					String id = rs.getString(1);
					int itall = rs.getInt(2);
					String ireli = rs.getString(3);
					int idrink = rs.getInt(4);
					int ismoke = rs.getInt(5);
					dto2.setId(id);
					dto2.setItall(itall);
					dto2.setIreli(ireli);
					dto2.setIdrink(idrink);
					dto2.setIsmoke(ismoke);
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return dto2;
		}
		
		// 멤버 테이블 검색
		public memberDTO myProfile(String Id) {
			memberDTO dto2 = null;
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "select loc,blood,tall,reli,drink,smoke,mbtitype,sc from member where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, Id);
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					System.out.println("검색 결과가  있어요!");
					dto2 = new memberDTO();
					String loc = rs.getString(1);
					String blood = rs.getString(2);
					int tall = rs.getInt(3);
					String reli = rs.getString(4);
					int drink = rs.getInt(5);
					int smoke = rs.getInt(6);
					String mbtitype = rs.getString(7);
					int sc = rs.getInt(8);
					dto2.setLoc(loc);
					dto2.setBlood(blood);
					dto2.setTall(tall);
					dto2.setReli(reli);
					dto2.setDrink(drink);
					dto2.setSmoke(smoke);
					dto2.setMbtitype(mbtitype);
					dto2.setSc(sc);
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return dto2;
		}
		
		
		//나의 프로필 없데이트
		public void myProfileUpdate(memberDTO dto) {
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "update member set loc = ?,blood=?,tall=?,reli=?,drink=?,smoke=?,mbtitype=? where id =? ";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, dto.getLoc());
				ps.setString(2, dto.getBlood());
				ps.setInt(3, dto.getTall());
				ps.setString(4, dto.getReli());
				ps.setInt(5, dto.getDrink());
				ps.setInt(6, dto.getSmoke());
				ps.setString(7, dto.getMbtitype());
				ps.setString(8, dto.getId());
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ps.executeUpdate();
				System.out.println("ok!!");
				mgr.freeConnection(con, ps);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//나의 이상형 프로필 업데이트 
		public void myidealUpdate(mitDTO dto) {
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "update mit set itall=?,ireli=?,idrink=?,ismoke=? where id =? ";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, dto.getItall());
				ps.setString(2, dto.getIreli());
				ps.setInt(3, dto.getIdrink());
				ps.setInt(4, dto.getIsmoke());
				ps.setString(5, dto.getId());
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ps.executeUpdate();
				System.out.println("ok!!");
				mgr.freeConnection(con, ps);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//개인질문 정보 업데이트 dao
		public void myquestionUpdate(questionDTO dto) {
			System.out.println(dto.getQ1());
			System.out.println(dto.getQ2());
			System.out.println(dto.getQ3());
			System.out.println(dto.getQ4());
			System.out.println(dto.getQ5());
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "update question set q1=?,q2=?,q3=?,q4=?,q5=? where id =? ";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, dto.getQ1());
				ps.setString(2, dto.getQ2());
				ps.setString(3, dto.getQ3());
				ps.setString(4, dto.getQ4());
				ps.setString(5, dto.getQ5());
				ps.setString(6, dto.getId());
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ps.executeUpdate();
				System.out.println("ok!!");
				mgr.freeConnection(con, ps);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		// 본인 질문 테이블 검색
		public questionDTO qInfo(String Id) {
			questionDTO dto2 = null;
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "select * from question where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, Id);
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					System.out.println("검색 결과가  있어요!");
					dto2 = new questionDTO();
					String id = rs.getString(1);
					String q1 = rs.getString(2);
					String q2 = rs.getString(3);
					String q3 = rs.getString(4);
					String q4 = rs.getString(5);
					String q5 = rs.getString(6);
					dto2.setId(id);
					dto2.setQ1(q1);
					dto2.setQ2(q2);
					dto2.setQ3(q3);
					dto2.setQ4(q4);
					dto2.setQ5(q5);
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return dto2;
		}
		
		public void myInfoUpdate(memberDTO dto) {
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "update member set  pw=? , email=? , tel = ? where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, dto.getPw());
				ps.setString(2, dto.getEmail());
				ps.setString(3, dto.getTel());
				ps.setString(4, dto.getId());
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				System.out.println("4. sql문 전송 ok");
				ps.executeUpdate();
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		//비밀번호 확인 DAO
		public int mbticheck(String id) {
			int result = 0;
			try {
				con = mgr.getConnection();
				//3)sql문 결정
				String sql = "select mbtitype from member where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, id);
				System.out.println("3. sql문 결정 ok");
				//4)sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					System.out.println("검색 결과가  있어요!");
					result = 1;
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("mbti검색 됨!!!");
			return result;
		}
		
		public void myMbtiUpdate(String id , String mbtitype) {
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "";
				int result = mbticheck(id);
				PreparedStatement ps = con.prepareStatement(sql);
				if (result == 1) {
					sql = "update member set  mbtitype=? where id = ?";
					ps = con.prepareStatement(sql);
					ps.setString(1, mbtitype);
					ps.setString(2, id);
					System.out.println("업데이트 됨!!!"+result+id+mbtitype);
				} else {
					System.out.println("됨?");
					sql = "insert into member(mbtitype) values (?)";
					ps.setString(1, mbtitype);
					System.out.println("인서트 됨!!!"+result+id+mbtitype);
				}
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				System.out.println("4. sql문 전송 ok");
				ps.executeUpdate();
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public memberDTO select(memberDTO dto) {
			memberDTO dto2 = null;
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "select * from member where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, dto.getId());
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					System.out.println("검색 결과가  있어요!");
					dto2 = new memberDTO();
					String id = rs.getString(1);
					String pw = rs.getString(2);
					String name = rs.getString(3);
					int age = rs.getInt(4);
					String gender = rs.getString(5);
					String loc = rs.getString(6);
					String blood = rs.getString(7);
					int tall = rs.getInt(8);
					String reli = rs.getString(9);
					int drink = rs.getInt(10);
					int smoke = rs.getInt(11);
					String mbtitype = rs.getString(12);
					String tel = rs.getString(13);
					String email = rs.getString(14);
					int sc = rs.getInt(15);
					dto2.setId(id);
					dto2.setPw(pw);
					dto2.setName(name);
					dto2.setAge(age);
					dto2.setGender(gender);
					dto2.setLoc(loc);
					dto2.setBlood(blood);
					dto2.setTall(tall);
					dto2.setReli(reli);
					dto2.setDrink(drink);
					dto2.setSmoke(smoke);
					dto2.setMbtitype(mbtitype);
					dto2.setTel(tel);
					dto2.setEmail(email);
					dto2.setSc(sc);
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return dto2;
		}
		
		//sql문 join을 활용하여 다른 테이블에 있는 아이디의 정보를 가져옴.
		//이성의 정보를 가져와야 하기 떄문에 여성일경우 gender 남성으로 남성일경우 
		//gender를 여성으로 바꿔서 sql문을 작성한다.
		public ArrayList<scoreDTO> selectgender(String gender) {
			if (gender.equals("여성")) {
				gender = "남성";
			}
			else {
				gender = "여성";
			}
			ArrayList<scoreDTO> list = new ArrayList<scoreDTO>();
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "select m.id , loc , tall ,drink , smoke, reli,q1,q2,q3,q4,q5,blood ,mbtitype  "
						+ "from member as m join question as q on m.id = q.id where m.gender = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, gender);
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				while(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					scoreDTO dto = new scoreDTO();
					String id = rs.getString(1);
					String loc = rs.getString(2);
					int tall = rs.getInt(3);
					int drink = rs.getInt(4);
					int smoke = rs.getInt(5);
					String reli = rs.getString(6);
					String q1 = rs.getString(7);
					String q2 = rs.getString(8);
					String q3 = rs.getString(9);
					String q4 = rs.getString(10);
					String q5 = rs.getString(11);
					String blood = rs.getString(12);
					String mbtitype = rs.getString(13);
					dto.setId(id);
					dto.setGender(gender);
					dto.setLoc(loc);
					dto.setTall(tall);
					dto.setDrink(drink);
					dto.setSmoke(smoke);
					dto.setReli(reli);
					dto.setQ1(q1);
					dto.setQ2(q2);
					dto.setQ3(q3);
					dto.setQ4(q4);
					dto.setQ5(q5);
					dto.setBlood(blood);
					dto.setMbtitype(mbtitype);
					list.add(dto);
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		public myidealDTO myMatchinginfo(String id) {
			myidealDTO dto = new myidealDTO();
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "select m.id , loc , q1,q2,q3,q4,q5,blood ,mbtitype  "
						+ "from member as m join question as q on m.id = q.id where m.id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, id);
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					String loc = rs.getString(2);
					String q1 = rs.getString(3);
					String q2 = rs.getString(4);
					String q3 = rs.getString(5);
					String q4 = rs.getString(6);
					String q5 = rs.getString(7);
					String blood = rs.getString(8);
					String mbtitype = rs.getString(9);
					dto.setId(id);
					dto.setLoc(loc);
					dto.setQ1(q1);
					dto.setQ2(q2);
					dto.setQ3(q3);
					dto.setQ4(q4);
					dto.setQ5(q5);
					dto.setBlood(blood);
					dto.setMbtitype(mbtitype);
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return dto;
		}
		
		public myidealDTO myMatchinginfo2(String Id) {
			myidealDTO dto2 = null;
			try {
				con = mgr.getConnection();
				//sql문 결정
				String sql = "select itall , ireli , idrink , ismoke from mit where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, Id);
				System.out.println("3. sql문 결정 ok");
				//sql문 전송
				ResultSet rs = ps.executeQuery();
				System.out.println("4. sql문 전송 ok");
				
				if(rs.next()) { //검색결과가 있는지 체크해주는 메소드
					System.out.println("검색 결과가  있어요!");
					dto2 = new myidealDTO();
					int itall = rs.getInt(1);
					String ireli = rs.getString(2);
					int idrink = rs.getInt(3);
					int ismoke = rs.getInt(4);
					dto2.setItall(itall);
					dto2.setIreli(ireli);
					dto2.setIdrink(idrink);
					dto2.setIsmoke(ismoke);
				}
				mgr.freeConnection(con, ps);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return dto2;
		}
		
//sc 데이터 0 으로 update
		public void updateSC2() {
			try {
		         con = mgr.getConnection();
		         //sql문 결정
		         String sql = "update member set sc = 0";
		         PreparedStatement ps = con.prepareStatement(sql);
		         System.out.println("3. sql문 결정 ok");
		         //sql문 전송
		         ps.executeUpdate();
		         mgr.freeConnection(con, ps);
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		}
		
		
				
}
