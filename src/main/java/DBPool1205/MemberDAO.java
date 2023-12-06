package DBPool1205;

import common.DBConnPool;

public class MemberDAO extends DBConnPool{
	public MemberDAO() {
		super();
	}
	
	// 로그인 시 MBNUM 불러오기 + pass용으로 사용하기
	public MemberDTO getMemberNum(String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT MBNUM FROM MEMBER_LOGIN"
				+ " WHERE MEMBER_id='?', MEMBER_PWD='?'";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			System.out.println(query);
			if(rs.next()) {
				dto.setId(id);
				dto.setPwd(pwd);
				dto.setMbnum(rs.getInt("MBNUM"));
			}
			System.out.println("id: "+dto.getId()+" pwd: "+dto.getPwd()+" MBnum: "+dto.getMbnum());
		}
		catch(Exception e) {
			System.out.println("로그인 시도 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	
	// 마이페이지 정보 불러오기
	public MemberDTO getMemberProfile(String mbn) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT nickname, mail, phone FROM MEMBER_PROFILE"
				+ " WHERE MBNUM=?";
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
			System.out.println("닉네임: "+dto.getNickname()+" 이메일: "+dto.getEmail()+" 핸드폰: "+dto.getPhone());
		}
		catch (Exception e) {
			System.out.println("유저 프로필 조회 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
}
