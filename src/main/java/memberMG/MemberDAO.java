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
		} finally {
			close();
		}
		return dto;
	}
	
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
			}
			System.out.println(vo.getId());
			System.out.println(vo.getPwd());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public MemberDTO getRegister(String name, String cn, String email, String phone, String nickname) {
		MemberDTO Vo = new MemberDTO();
		String insertQuery = "INSERT INTO member_profile(name, cn, email, phone, nickname)  VALUES(?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(insertQuery);
			psmt.setString(1, name);
			psmt.setString(2, cn);
			psmt.setString(3, email);
			psmt.setString(4, phone);
			psmt.setString(5, nickname);
			psmt.executeUpdate();

			
			System.out.println(insertQuery);
			System.out.println(name + cn + email + phone + nickname);
			
			if((this.rs != null && this.rs.next())) {
				Vo.setName(rs.getString("name"));
				Vo.setCn(rs.getString("cn"));
				Vo.setEmail(rs.getString("email"));
				Vo.setPhone(rs.getString("phone"));
				Vo.setNickname(rs.getString("nickname"));
			}
			
			System.out.println(Vo.getName());
			System.out.println(Vo.getCn());
			System.out.println(Vo.getEmail());
			System.out.println(Vo.getPhone());
			System.out.println(Vo.getNickname());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return Vo;
	} 
}
