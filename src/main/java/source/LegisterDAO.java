package source;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LegisterDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	String sql="";
	
	private LegisterVO vo=null;
	
	public LegisterDAO() { //생성자로 객체 생성되자마자 DB연결하기
		String url="jdbc:mysql://localhost:3306/javaweb";
		String user="root";
		String password="0929";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패");
		} catch (SQLException e) {
			System.out.println("Database 연동 실패");
		}
	}
	
	public void pstmtClose() {
		 if(pstmt!=null) {
			 try {pstmt.close();}
			 catch(SQLException e) {}
		 }
	}
	
	public void rsClose() {
		if(rs!=null) {
			try {
				rs.close();
				pstmtClose();
			} catch(SQLException e) {} //닫는덴 문제가 없다.
		}
	}
	public LegisterVO login(String id, String pwd) {
		vo=new LegisterVO();
		
		try {
			sql="select * from member where id=? and pwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			
			if(rs.next()){ //rs는 지금 bof를 가르키고 있기 때문에 rs.next를 해주는거다.
				vo.setId(rs.getString("id"));
				vo.setPassword(rs.getString("pwd")); 
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 : "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	
	public void legister(LegisterVO vo) {
		try { //jsp 폼에서 값 받고 legisterok에서 vo로 값 넘겨주고 dao에서 vo에 있는 값을 불러서 db에 작
			sql="insert into member values(default,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getGender());
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("SQL 오류:"+e.getMessage());
		} finally {
			pstmtClose();
		}
	}
}