package memberMG;

import java.sql.SQLException;

import  exffff.DBConnPool;

public class MemberDAO extends DBConnPool {
	
	// 아이디 찾기
	public MemberDTO getMemberId(String name, String cn, String phone) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT User_id FROM c##foodfinder.MEMBER_LOGIN " + "WHERE member_Login.mbnum "
				+ "IN (SELECT mbnum FROM c##foodfinder.MEMBER_PROFILE WHERE " + "name=? AND cn=? AND phone=?)";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);
			psmt.setString(2, cn);
			psmt.setString(3, phone);
			rs = psmt.executeQuery();

			System.out.println(query);
			if (rs.next()) {
				dto.setId(rs.getString("User_id"));
			}
			System.out.println(dto.getId());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	// 비밀번호 찾기
	public int updatePwd(String pw, String id) {
		int result = 0;
		String query = "UPDATE c##foodfinder.MEMBER_LOGIN SET User_Pwd =? " + "WHERE User_id = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, pw);
			psmt.setString(2, id);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 비밀번호 확인
	public String getPwdpass(int mbnum, String pwd) {
		String pass = "false";
		String query = "SELECT * From C##foodfinder.member_login WHERE mbnum=? and USER_pwd=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, mbnum);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			if (rs.next()) {
				pass = "true";
			}
		} catch (Exception e) {
			System.out.println("비밀번호 조회 중 예외 발생");
			e.printStackTrace();
		}
		return pass;
	}

	// 비밀번호 조회 성공 후 정보수정
	public void setProfile(String nickname, String email, String phone, int mbnum) {
		MemberDTO dto = new MemberDTO();
		String query = "UPDATE c##foodfinder.member_profile SET mail=?, phone=?, nickname=? WHERE mbnum=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, phone);
			psmt.setString(3, nickname);
			psmt.setInt(4, mbnum);
			psmt.executeUpdate();
			
		}
		catch (Exception e) {
			System.out.println("정보수정 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	// 회원가입1
	public MemberDTO insertRegister(String name, String cn, String mail, String phone, String nickname) {
		MemberDTO Vo = new MemberDTO();
		String insertQuery = "INSERT INTO c##foodfinder.member_profile(name, cn, mail, phone, nickname)  VALUES(?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(insertQuery);
			psmt.setString(1, name);
			psmt.setString(2, cn);
			psmt.setString(3, mail);
			psmt.setString(4, phone);
			psmt.setString(5, nickname);
			psmt.executeUpdate();

			System.out.println(insertQuery);
			System.out.println(name + cn + mail + phone + nickname);

			Vo.setName(name);
			Vo.setCn(cn);
			Vo.setEmail(mail);
			Vo.setPhone(phone);
			Vo.setNickname(nickname);

			System.out.println(Vo.getName());
			System.out.println(Vo.getCn());
			System.out.println(Vo.getEmail());
			System.out.println(Vo.getPhone());
			System.out.println(Vo.getNickname());

		} catch (Exception e) {
			System.out.println("회원가입 프로필정보 입력 중 예외 발생");
			e.printStackTrace();
		}
		return Vo;
	}

	// 회원가입 1.5
	public MemberDTO getMBNUM(String name, String cn, String email, String phone, String nickname) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT MBNUM FROM c##foodfinder.MEMBER_PROFILE WHERE NAME=? AND CN=? AND MAIL=? AND PHONE=? AND nickname=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);
			psmt.setString(2, cn);
			psmt.setString(3, email);
			psmt.setString(4, phone);
			psmt.setString(5, nickname);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setMbnum(rs.getInt("MBNUM"));
			}

		} catch (Exception e) {
			System.out.println("회원가입 후 MBNUM 조회 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 회원가입 2
	public MemberDTO insertLogin(int mbnum, String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		String query = "INSERT INTO c##foodfinder.MEMBER_LOGIN VALUES(?,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, mbnum);
			psmt.setString(2, id);
			psmt.setString(3, pwd);
			psmt.executeUpdate();

			if (rs.next()) {
				dto.setMbnum(rs.getInt("MBNUM"));
			}
			System.out.println(dto.getMbnum());
		} catch (Exception e) {
			System.out.println("회원가입 로그인 입력 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 회원가입 3 아이디 중복확인
	public int checkId(String id) {
		int idCheck = 0;
		String query = "SELECT USER_ID FROM c##foodfinder.MEMBER_LOGIN WHERE USER_ID=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next() || id.equals("")) {
				idCheck = 0;
			} else {
				idCheck = 1;
			}
		} catch (Exception e) {
			System.out.println("회원가입 아이디 중복확인 중 예외 발생");
			e.printStackTrace();
		} 
		return idCheck;	
	}
	
	//회원가입4 닉네임 중복확인
	public int checkNick(String nickname) {
		int nickCheck = 0;
		String query = "SELECT NICKNAME FROM c##foodfinder.MEMBER_PROFILE WHERE NICKNAME=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, nickname);
			rs = psmt.executeQuery();
			
			if(rs.next() || nickname.equals("")) {
				nickCheck = 0;
			} else {
				nickCheck = 1;
			}
		} catch (Exception e) {
			System.out.println("회원가입 닉네임 중복확인 중 예외 발생");
			e.printStackTrace();
		} 
		return nickCheck;	
	}
	// 내정보 읽어오기
	public MemberDTO getProfile(int mbn) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM C##FOODFINDER.MEMBER_PROFILE WHERE MBNUM=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, mbn);
			rs = psmt.executeQuery();

			System.out.println(query);

			if (rs.next()) {
				dto.setNickname(rs.getString("NICKNAME"));
				dto.setEmail(rs.getString("MAIL"));
				dto.setPhone(rs.getString("PHONE"));
			}
			System.out.println("별명 : " + dto.getNickname() + " 이메일: " + dto.getEmail() + " 핸드폰: " + dto.getPhone());
		} catch (Exception e) {
			System.out.println("유저 정보 불러오기 시도 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 로그인
	public MemberDTO getMember(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		System.out.println("DB DAO 실행중");
		String query = "SELECT * FROM C##FOODFINDER.MEMBER_LOGIN WHERE USER_ID=? AND USER_PWD=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			System.out.println("DAO 실행 완료 ID : " + uid + " PWD : " + upass);

			if (rs.next()) {
				dto.setMbnum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setPwd(rs.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//회원탈퇴
	public void deleteMember(int mbnum) {
		String query1 = "DELETE FROM C##FOODFINDER.MEMBER_LOGIN WHERE MBNUM=?";
		String query2 = "DELETE FROM C##FOODFINDER.MEMBER_PROFILE WHERE MBNUM=?";
		String query3 = "DELETE FROM C##FOODFINDER.DIARYBOARD WHERE MBNUM=?";
		String query4 = "DELETE FROM C##FOODFINDER.FOOD WHERE MBNUM=?";
		String query5 = "DELETE FROM C##FOODFINDER.REPLY WHERE MBNUM=?";
		try {
			psmt = con.prepareStatement(query1);
			psmt.setInt(1, mbnum);
			psmt.executeUpdate();
			
			psmt = con.prepareStatement(query5);
			psmt.setInt(1, mbnum);
			psmt.executeUpdate();
			
			psmt = con.prepareStatement(query3);
			psmt.setInt(1, mbnum);
			psmt.executeUpdate();
			
			psmt = con.prepareStatement(query4);
			psmt.setInt(1, mbnum);
			psmt.executeUpdate();
			
			psmt = con.prepareStatement(query2);
			psmt.setInt(1, mbnum);
			psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("회원탈퇴 중 예외 발생");
			e.printStackTrace();
		}
	}
}