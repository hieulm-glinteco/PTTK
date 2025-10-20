package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    protected Connection conn;

    public DAO() {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=PTTK;encrypt=true;trustServerCertificate=true";
            String username = "sa";
            String password = "1";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Kết nối thành công!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }
}
