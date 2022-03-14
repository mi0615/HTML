package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class EmpDAO {
	private EmpDAO() throws Exception {
		//1. 드라이버 로딩
	} 
	private static EmpDAO instance  = null;
	public static EmpDAO getInstance() throws Exception {
		if(instance == null) {
		instance = new EmpDAO();
		}
		return instance;
	}//싱글톤 패턴(접속자가 들어올때마다 여러번 뜨지 않게 하기 위해)
	
	public void insert(EmpVO vo) throws Exception{
		PreparedStatement  ps = null;
		Connection con = null;
		try {
		//2. 연결객체 얻어오기
		con = DriverManager.getConnection("jdbc:oracle:thin:@119.197.89.252:1521:xe", "scott", "tiger");
		//3. sql 문장 : INSERT 문장
		String sql = "INSERT INTO emp(empno, ename, deptno, job, sal) VALUES(?,?,?,?,?)";
		//4. 전송객체
		ps = con.prepareStatement(sql);
		ps.setInt(1, vo.getEmpno());
		ps.setString(2, vo.getEname());
		ps.setInt(3, vo.getDeptno());
		ps.setString(4, vo.getJob());
		ps.setInt(5, vo.getSal());
		//5. 전송 (executeUpdate())
		ps.executeUpdate();
		
		//[6] 닫기
		}finally {
		ps.close();
		}
	
	}
	

}
