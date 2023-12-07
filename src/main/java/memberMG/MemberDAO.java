package memberMG;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {	
	
	//아이디 찾기
	public MemberDTO getMemberId(String name, String cn, String phone) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT User_id FROM MEMBER_LOGIN "
				+ "WHERE member_Login.mbnum "
				+ "IN (SELECT mbnum FROM MEMBER_PROFILE WHERE "
				+ "name=? AND cn=? AND phone=?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);
			psmt.setString(2, cn);
			psmt.setString(3, phone);
			rs = psmt.executeQuery();
			
			System.out.println(query);
			if(rs.next()) {
				dto.setId(rs.getString("User_id"));
			}
			System.out.println(dto.getId());
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	//비밀번호 찾기
	public int updatePwd(String pw, String id){
		int result = 0;
		String query = "UPDATE MEMBER_LOGIN SET User_Pwd =? "
					 + "WHERE User_id = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, pw);
			psmt.setString(2, id);
			result = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//로그인
	public MemberDTO getUSER_ID(String id, String pwd) {
		MemberDTO vo = new MemberDTO();
		String query = "SELECT * From member_login WHERE user_id=? AND user_pwd=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs=psmt.executeQuery();
			
			System.out.println(query);
			System.out.println(id + pwd);
			
			
			if(rs.next()) {
				vo.setId(rs.getString("user_id"));
				vo.setPwd(rs.getString("user_pwd"));
				vo.setMbnum(rs.getInt("mbnum"));
			}
			System.out.println(vo.getId());
			System.out.println(vo.getPwd());
			System.out.println(vo.getMbnum());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	//내정보 읽어오기
	public MemberDTO getProfile(String mbn) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM MEMBER_PROFILE WHERE MBNUM=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mbn);
			rs = psmt.executeQuery();
			
			System.out.println(query);
			
			if(rs.next()) {
				dto.setNickname(rs.getString("NICKNAME"));
				dto.setEmail(rs.getString("MAIL"));
				dto.setPhone(rs.getString("PHONE"));
			}
			System.out.println("별명 : "+dto.getNickname()+ " 이메일: "+ dto.getEmail()+ " 핸드폰: "+ dto.getPhone());
		} catch (Exception e) {
			System.out.println("유저 정보 불러오기 시도 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
}
