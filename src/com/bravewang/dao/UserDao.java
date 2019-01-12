package com.bravewang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bravewang.model.Comment;
import com.bravewang.model.Product;
import com.bravewang.model.Shop;
import com.bravewang.model.User;
import com.bravewang.util.DbUtil;

public class UserDao {

	/**
	 * 查询用户名是否存在
	 * 
	 * @param uname
	 * @return true:存在 false:不存在
	 */
	public boolean checkUn(String uname) {
		boolean flag = false;
		// 链接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_user WHERE uname = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uname);
			rs = psmt.executeQuery();
			while (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库链接
			DbUtil.close(rs, psmt, conn);
		}
		return flag;
	}

	/**
	 * 登录功能
	 * 
	 * @param user
	 *            传递参数
	 * @return true:成功 false:失败
	 */
	public boolean login(User user) {
		boolean flag = false;
		// 连接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_user WHERE uname = ? AND upwd = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getUname());
			psmt.setString(2, user.getUpwd());
			rs = psmt.executeQuery();
			while (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return flag;
	}

	/**
	 * 查询用户
	 * 
	 * @param schUserName
	 * @return
	 */
	public List<User> schUser(String schUserName) {
		// 连接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_user WHERE 1 = 1";

		List<User> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setUid(rs.getInt("uid"));
				u.setUname(rs.getString("uname"));
				u.setUpwd(rs.getString("upwd"));
				u.setUsex(rs.getString("usex"));
				u.setUemail(rs.getString("uemail"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}
	
	/**
	 * 查询用户，附带页码
	 * 
	 * @param schUserName
	 * @return
	 */
	public List<User> getUserByPage(String schUserName, int start, int pageSize) {
		// 连接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_user WHERE 1 = 1";
		if (!"".equals(schUserName) && schUserName != null) {
			sql = sql + " AND uname = ' " + schUserName + " ' ";
		}
		sql += " LIMIT " + start + "," + pageSize;

		List<User> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setUid(rs.getInt("uid"));
				u.setUname(rs.getString("uname"));
				u.setUpwd(rs.getString("upwd"));
				u.setUsex(rs.getString("usex"));
				u.setUemail(rs.getString("uemail"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库的连接
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}
	
	
	/**
	 * 查询评论
	 * 
	 * @param schUserName
	 * @return
	 */
	public List<Comment> schComment(String schComment) {
		// 连接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_comment WHERE 1 = 1";

		List<Comment> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Comment  c = new Comment();
				c.setCommentid(rs.getInt("comment_id"));
				c.setCommentuser(rs.getString("comment_user"));
				c.setCommentword(rs.getString("comment_word"));
				c.setCommentdate(rs.getDate("comment_date"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}
	
	/**
	 * 查询评论
	 * 
	 * @param schUserName
	 * @return
	 */
	public List<Comment> getCommentByPage(String schComment, int start, int pageSize) {
		// 连接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_comment WHERE 1 = 1";
		if (!"".equals(schComment) && schComment != null) {
			sql = sql + " AND uname = ' " + schComment + " ' ";
		}
		sql += " LIMIT " + start + "," + pageSize;

		List<Comment> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Comment  c = new Comment();
				c.setCommentid(rs.getInt("comment_id"));
				c.setCommentuser(rs.getString("comment_user"));
				c.setCommentword(rs.getString("comment_word"));
				c.setCommentdate(rs.getDate("comment_date"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库的连接
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}
	
	
	/**
	 * 查询购物车
	 * 
	 * @param schUserName
	 * @return
	 */
	public List<Shop> schShop(String schShop) {
		// 连接数据库
		System.out.println("查找购物车");
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_shop WHERE 1 = 1";

		List<Shop> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Shop s = new Shop();
				s.setSid(rs.getInt("sid"));
				s.setSpname(rs.getString("spname"));
				s.setSprice(rs.getInt("sprice"));
				s.setSnum(rs.getInt("snum"));
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}
	
	
	
	/**
	 * 查询产品
	 * 
	 * @param schShopinfo
	 * @return
	 */
	public List<Shop> getShopByPage(String schShopinfo, int start, int pageSize) {
		// 连接数据库
		System.out.println("查找购物车显示页数");
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_shop WHERE 1 = 1";
		if (!"".equals(schShopinfo) && schShopinfo != null) {
			sql = sql + " AND pname = ' " + schShopinfo + " ' ";
		}
		sql += " LIMIT " + start + "," + pageSize;

		List<Shop> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Shop s= new Shop();
				s.setSid(rs.getInt("sid"));
				s.setSpname(rs.getString("spname"));
				s.setSprice(rs.getInt("sprice"));
				s.setSnum(rs.getInt("snum"));
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库的连接
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}
	
	
	
	/**
	 * 查询产品
	 * 
	 * @param schUserName
	 * @return
	 */
	public List<Product> schProduct(String schProduct) {
		// 连接数据库
		System.out.println("查找产品");
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_product WHERE 1 = 1";

		List<Product> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Product  p = new Product();
				p.setPid(rs.getInt("pid"));
				p.setPname(rs.getString("pname"));
				p.setPrice(rs.getInt("price"));
				p.setPnum(rs.getInt("pnum"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}
	
	/**
	 * 查询产品
	 * 
	 * @param schUserName
	 * @return
	 */
	public List<Product> getProductByPage(String schProduct, int start, int pageSize) {
		// 连接数据库
		System.out.println("查找产品显示页数");
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_product WHERE 1 = 1";
		if (!"".equals(schProduct) && schProduct != null) {
			sql = sql + " AND pname = ' " + schProduct + " ' ";
		}
		sql += " LIMIT " + start + "," + pageSize;

		List<Product> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Product  p = new Product();
				p.setPid(rs.getInt("pid"));
				p.setPname(rs.getString("pname"));
				p.setPrice(rs.getInt("price"));
				p.setPnum(rs.getInt("pnum"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库的连接
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}

	

	/**
	 * 显示所有用户
	 * 
	 * @param showname
	 * @return
	 */
	public List<User> showAllUser(String showname) {
		// 连接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_user WHERE 1=1";

		List<User> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setUid(rs.getInt("uid"));
				u.setUname(rs.getString("uname"));
				u.setUpwd(rs.getString("upwd"));
				u.setUsex(rs.getString("usex"));
				u.setUemail(rs.getString("uemail"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库的连接
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}

	/**
	 * 显示所有产品
	 * 
	 * @param showproduct
	 * @return
	 */
	public List<Product> showAllProduct(String showproduct) {
		// 连接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_product WHERE 1=1";

		List<Product> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setPid(rs.getInt("pid"));
				p.setPname(rs.getString("pname"));
				p.setPrice(rs.getInt("price"));
				p.setPnum(rs.getInt("pnum"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库的连接
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}
	
	/**
	 * 购物车显示所有
	 * 
	 * @param showproduct
	 * @return
	 */
	public List<Shop> showAllShop(String showshop) {
		// 连接数据库
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_shop WHERE 1=1";

		List<Shop> list = new ArrayList<>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Shop s = new Shop();
				s.setSid(rs.getInt("sid"));
				s.setSpname(rs.getString("spname"));
				s.setSprice(rs.getInt("sprice"));
				s.setSnum(rs.getInt("snum"));
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库的连接
			DbUtil.close(rs, psmt, conn);
		}
		return list;
	}
	
	/**
	 * 进入购物车
	 * 
	 * @param shop
	 */
	public boolean toShop(Shop shop) {
		boolean flag = false;
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;

		String sql = "INSERT INTO bw_shop (sid,spname,sprice,snum) VALUES (?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, shop.getSid());
			psmt.setString(2, shop.getSpname());
			psmt.setInt(3, shop.getSprice());
			psmt.setInt(4, shop.getSnum());
			psmt.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(psmt, conn);
		}
		return flag;
	}
	

	/**
	 * 根据用户id查询用户信息
	 * 
	 * @param uid
	 * @return
	 */
	public User getUserById(int uid) {
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_user WHERE uid = ?";

		User user = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, uid);
			rs = psmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUid(rs.getInt("uid"));
				user.setUname(rs.getString("uname"));
				user.setUpwd(rs.getString("upwd"));
				user.setUsex(rs.getString("usex"));
				user.setUemail(rs.getString("uemail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return user;
	}
	
	
	/**
	 * 根据用户id查询用户信息
	 * 
	 * @param uid
	 * @return
	 */
	public User getUserByName(String uname) {
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_user WHERE uname = ?";

		User user = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uname);
			rs = psmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUid(rs.getInt("uid"));
				user.setUname(rs.getString("uname"));
				user.setUpwd(rs.getString("upwd"));
				user.setUsex(rs.getString("usex"));
				user.setUemail(rs.getString("uemail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return user;
	}
	
	
	/**
	 * 根据产品id查询用户信息
	 * 
	 * @param uid
	 * @return
	 */
	public Product getProductById(int pid) {
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bw_product WHERE pid = ?";

		Product  product = null;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pid);
			rs = psmt.executeQuery();
			while (rs.next()) {
				product = new Product();
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getInt("price"));
				product.setPnum(rs.getInt("pnum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(rs, psmt, conn);
		}
		return product;
	}

	/**
	 * 修改用户
	 * 
	 * @param user
	 */
	public boolean editUser(User user) {
		boolean flag = false;
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;

		String sql = "UPDATE bw_user SET uname = ?,upwd = ?,usex=?,uemail=? WHERE uid = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getUname());
			psmt.setString(2, user.getUpwd());
			psmt.setString(3, user.getUsex());
			psmt.setString(4, user.getUemail());
			psmt.setInt(5, user.getUid());
			psmt.executeUpdate();
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(psmt, conn);
		}
		return flag;
	}
	
	
	/**
	 * 修改产品
	 * 
	 * @param user
	 */
	public boolean editProduct(Product product) {
		boolean flag = false;
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;

		String sql = "UPDATE bw_product SET pname = ?,price = ?,pnum=?  WHERE pid = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, product.getPname());
			psmt.setInt(2, product.getPrice());
			psmt.setInt(3, product.getPnum());
			psmt.setInt(4, product.getPid());
			psmt.executeUpdate();
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(psmt, conn);
		}
		return flag;
	}

	/**
	 * 修改用户密码
	 * 
	 * @param user
	 */
	public void editUserpwd(User user) {
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;

		String sql = "UPDATE bw_user SET upwd = ? WHERE uid = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getUpwd());
			psmt.setInt(2, user.getUid());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(psmt, conn);
		}
	}

	/**
	 * 注册用户
	 * 
	 * @param user
	 */
	public boolean regUser(User user) {
		boolean flag = false;
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;

		String sql = "INSERT INTO bw_user (uname,upwd,usex,uemail) VALUES (?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getUname());
			psmt.setString(2, user.getUpwd());
			psmt.setString(3, user.getUsex());
			psmt.setString(4, user.getUemail());
			psmt.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(psmt, conn);
		}
		return flag;
	}

	/**
	 * 删除用户
	 * 
	 * @param uid
	 */
	public  void delUser(int uid) {
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;

		String sql = "DELETE FROM bw_user WHERE uid = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, uid);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(psmt, conn);
		}
	}
	
	
	/**
	 * 删除产品
	 * 
	 * @param pid
	 */
	public  void delProduct(int pid) {
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;

		String sql = "DELETE FROM bw_product WHERE pid = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pid);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(psmt, conn);
		}
	}
	
	
	/**
	 * 删除评论
	 * 
	 * @param commentid
	 */
	public  void delComment(int commentid) {
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;

		String sql = "DELETE FROM bw_comment WHERE comment_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commentid);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(psmt, conn);
		}
	}
	
	/**
	 * 删除购物车
	 * 
	 * @param sid
	 */
	public  void delShop(int sid) {
		Connection conn = DbUtil.getConn();
		PreparedStatement psmt = null;

		String sql = "DELETE FROM bw_shop WHERE sid = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, sid);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.close(psmt, conn);
		}
	}
	    
}
