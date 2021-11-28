package board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDataBean {
	Connection con;
	PreparedStatement ps;  
	ResultSet rs;
	  
	static DataSource ds;
	static {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			ds = (DataSource)envContext.lookup("jdbc/oracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	protected List<BoardDBBean> makeList(ResultSet rs) throws SQLException {
		List<BoardDBBean> list = new ArrayList<BoardDBBean>();
		while(rs.next()) {
			BoardDBBean dto = new BoardDBBean();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			list.add(dto);
		}
		return list;
	}
	public List<BoardDBBean> listBoard() throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select * from board order by num desc";
			//나중에 쓴 글이 먼저 나오도록 소트를 했습니다.
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<BoardDBBean> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int insertBoard(BoardDBBean dto) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "insert into board "
					+ "values(board_seq.nextval, ?,?,?,?,sysdate,0,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getPasswd());
			ps.setString(5, dto.getContent());
			ps.setString(6, dto.getIp());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	protected void plusReadcount(int num) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "update board set readcount = readcount + 1 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public BoardDBBean getBoard(int num, String mode) throws SQLException {
		if (mode.equals("content")) {
			plusReadcount(num);
		}
		try {
			con = ds.getConnection();
			String sql = "select * from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<BoardDBBean> getBoard = makeList(rs);
			return getBoard.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public boolean isPassword(int num, String passwd) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select passwd from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString(1);
				if (dbPass.equals(passwd)) {
					return true;
				}
			}
			return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	public int deleteBoard(int num, String passwd) throws SQLException {
		if (!isPassword(num, passwd)) {
			return -1;	//비밀번호가 틀렸으면 -1을 반환
		}
		try {
			con = ds.getConnection();
			String sql = "delete from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int updateBoard(BoardDBBean dto) throws SQLException {
		if (!isPassword(dto.getNum(), dto.getPasswd())) {
			return -1;
		}
		try {
			con = ds.getConnection();
			String sql = "update board set writer=?, "
					+ "email = ?, subject=?, content=? where num = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getNum());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}










