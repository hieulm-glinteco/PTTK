/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import model.DishOrderDetail;

/**
 *
 * @author TT
 */
public class DishOrderDetailDAO extends DAO {

    public DishOrderDetailDAO() {
    }
    
    public boolean addDishToOrder(DishOrderDetail dod) {
        String sql = "INSERT INTO tblDishOrderDetail (orderId, dishId, quantity) VALUES (?, ?, ?)";
        try (
            PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setInt(1, dod.getOrder().getId());
            ps.setInt(2, dod.getDish().getId());
            ps.setInt(3, dod.getQuantity());

            int rows = ps.executeUpdate();
            return rows > 0; // thêm thành công

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
