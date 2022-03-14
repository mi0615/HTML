package info;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class InfoDAO {
	private InfoDAO() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@119.197.89.252:1521:xe";
		String id = "mint";
		String pw = "mint"; 
	}
	private static InfoDAO instance = null;
	public static InfoDAO getInstance() throws Exception{
		if(instance == null) {
			instance = new InfoDAO();
		}
		return instance;
	}
	public void insert(InfoVO vo) throws Exception{
		PreparedStatement ps = null;
		Connection con = null;
		 try {
			 con = DriverManager.getConnection("jdbc:oracle:thin:@119.197.89.252:1521:xe","mint","mint");
			 
			 String sql = "INSERT INTO info(name, gender, job, hobby, partner) VALUES(?,?,?,?,?)";
			 
			 ps = con.prepareStatement(sql);
			 
			 ps.setString(1, vo.getName());
			 ps.setString(2, vo.getGender());
			 ps.setString(3, vo.getJob());
			 ps.setString(4, vo.getHobby());
			 ps.setString(5, vo.getPartner());
			 
			 ps.executeUpdate();
		 }finally {
			 ps.close();
			 con.close();
		 }
	}
}
