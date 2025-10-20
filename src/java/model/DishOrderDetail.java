/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TT
 */
public class DishOrderDetail {
    private int id, quantity;
    private Dish dish;
    private Order order;

    public DishOrderDetail() {
    }

    public DishOrderDetail(int id, int quantity, Dish dish, Order order) {
        this.id = id;
        this.quantity = quantity;
        this.dish = dish;
        this.order = order;
    }
    
    public DishOrderDetail(Order order, Dish dish, int quantity) {
        this.order = order;
        this.dish = dish;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
    
    
}
