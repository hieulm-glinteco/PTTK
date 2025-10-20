/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Order;
import java.sql.*;

/**
 *
 * @author TT
 */
public class OrderDAO extends DAO {

    public OrderDAO() {
    }
    
    public int addOrder(int trId){
        int orderId = -1;
        String sql = "INSERT INTO tblOrder(date, status, TableReservationid) VALUES (?, ?, ?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setDate(1, new Date(System.currentTimeMillis()));
            ps.setString(2, "Pending");
            ps.setInt(3, trId);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return orderId;
    }
    
    public Order getOrderById(String id){
        Order order = new Order();
        String sql = "select * from tblOrder where id = ?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                order.setId(rs.getInt("id"));
                order.setDate(rs.getDate("date"));
                order.setStatus(rs.getString("status"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return order;
    }
    
}
