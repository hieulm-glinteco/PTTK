/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Dish;
import java.sql.*;
/**
 *
 * @author TT
 */
public class DishDAO extends DAO{

    public DishDAO() {
    }
    
    public List<Dish> getListDishByName(String name){
        List<Dish> list = new ArrayList<>();
        String sql = "select * from tblDish where name like ?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Dish dish = new Dish();
                dish.setId(rs.getInt("id"));
                dish.setName(rs.getString("name"));
                dish.setPrice(rs.getFloat("price"));
                dish.setDescription(rs.getString("description"));
                list.add(dish);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public Dish getDishById(String id){
        Dish dish = new Dish();
        String sql = "select * from tblDish where id = ?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                dish.setId(rs.getInt("id"));
                dish.setName(rs.getString("name"));
                dish.setPrice(rs.getFloat("price"));
                dish.setDescription(rs.getString("description"));
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return dish;
    }
    
    public void updateDish(Dish dish, String name, float price, String description){
        String sql = "update tblDish set name = ?, price = ?, description = ? where id = ?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, name);
            st.setFloat(2, price);
            st.setString(3, description);
            st.setInt(4, dish.getId());
            st.executeUpdate();
        }catch(SQLException e){
            
        }
    }
}
