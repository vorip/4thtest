package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;


public class ProductDAO {
	DBConnectionMgr mgr;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public ProductDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public void insert(ProductDTO dto){
		try {
			con = mgr.getConnection();
			String sql = "insert into product values(?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, dto.getId());
			ps.setString(2, dto.getpName());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getPrice());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert문 에러");
			
		} finally {
			mgr.freeConnection(con,ps);
			
		}

	}
	public void update(ProductDTO dto) {
		try {
			con = mgr.getConnection();
			
			String sql = "update product set content=?, price=? where id=?";
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getContent());
			ps.setString(2, dto.getPrice());
			ps.setInt(3, dto.getId());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update문에러");
		}finally {
			mgr.freeConnection(con,ps);
		}
	}

	public ProductDTO select(int inputId) {
		ProductDTO dto = null;
		try {

			con = mgr.getConnection();

			String sql = "select * from product where id="+inputId;
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new ProductDTO();
				int id = rs.getInt(1);
				String pName = rs.getString(2);
				String content = rs.getString(3);
				String price = rs.getString(4);
				
				dto.setId(id);
				dto.setpName(pName);
				dto.setContent(content);
				dto.setPrice(price);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("select문 에러");
		} finally {
			mgr.freeConnection(con,ps,rs);
		}
		return dto;

	}
	public void delete(int id) {
		try {
			
			con = mgr.getConnection();
			
			String sql = "delete from product where id = "+id;
			
			ps = con.prepareStatement(sql);
			
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete에러");
		}finally {
			mgr.freeConnection(con,ps);
		}
	}
	public ArrayList<ProductDTO> selectAll(){
		ArrayList<ProductDTO> list=new ArrayList<ProductDTO>();
		ProductDTO dto = null;
		try {

			con = mgr.getConnection();

			String sql = "select * from product";
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();
			while (rs.next()) {
				dto=new ProductDTO();
				int id = rs.getInt(1);
				String pName = rs.getString(2);
				String content = rs.getString(3);
				String price = rs.getString(4);
				
				dto.setId(id);
				dto.setpName(pName);
				dto.setContent(content);
				dto.setPrice(price);
				
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("select문 에러");
		} finally {
			mgr.freeConnection(con,ps,rs);
		}
		if(list.get(0)==null) {
			return null;
		}else {
			return list;
		}
	}
	
	
	
	
}
