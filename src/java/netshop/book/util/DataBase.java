package netshop.book.util;

/**
 * <p>
 * 数据库连接专用包 </p>
 *
 * @version 1.0
 */
import java.sql.*;

public class DataBase {

    public Connection conn;
    public Statement stmt;
    public ResultSet rs = null;
    public String sqlStr = "";

    public Connection connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String url = "jdbc:mysql://127.0.0.1/bookstore?useSSL=false";
            conn = DriverManager.getConnection(url, "root", "root");
            stmt = conn.createStatement();
        } catch (Exception ee) {
            System.out.println("connect db error:" + ee.getMessage());
        }
        return conn;
    }

    public static void main(String[] args) {
        Connection cs = new DataBase().connect();
    }
}
