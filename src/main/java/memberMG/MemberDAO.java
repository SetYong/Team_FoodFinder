package memberMG;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	public MemberDTO getMemberId(String name, String cn, String phone) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT id FROM MEMBER_LOGIN "
				+ "WHERE member_Login.mbnum "
				+ "IN (SELECT mbnum FROM MEMBER_PROFILE WHERE "
				+ "name=? AND cn=? AND phone=?);";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);
			psmt.setString(2, cn);
			psmt.setString(3, phone);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
			}
		} catch(Exception e) {
			
		}
		return dto;
	}
}
