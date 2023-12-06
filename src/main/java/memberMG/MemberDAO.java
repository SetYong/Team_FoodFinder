package memberMG;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {
	
	
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
		}
		return dto;
	}
	
	public MemberDTO getMemberNum(String mbn) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT nickname, mail, phone FROM member_profile "
				+ "WHERE mbnum=? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mbn);
			rs = psmt.executeQuery();
			
			System.out.println(query);
			if(rs.next()) {
				dto.setNickname(rs.getString("nickname"));
				dto.setEamil(rs.getString("mail"));
				dto.setPhone(rs.getString("phone"));
			}
			System.out.println(dto.getId());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
