/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.TableReservation;
import java.sql.*;
import model.Customer;
import model.Table;

/**
 *
 * @author TT
 */
public class TableReservationDAO extends DAO {

    public TableReservationDAO() {
    }

    public List<TableReservation> getTableReservationByCustomerName(String name) {
        List<TableReservation> list = new ArrayList<>();
        String sql = """
            SELECT tr.id, tr.date, tr.status,
                   m.id AS customer_id, m.name AS customer_name, m.dob, m.address,
                   m.phone, m.email, m.role, m.username, m.password,
                   t.id AS table_id, t.name AS table_name, t.location, t.description
            FROM tblTableReservation AS tr
            JOIN tblMember AS m ON tr.Customerid = m.id
            JOIN tblTable AS t ON tr.Tableid = t.id
            WHERE m.name LIKE ?
        """;

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("customer_name"));
                customer.setDob(rs.getDate("dob"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setEmail(rs.getString("email"));
                customer.setRole(rs.getString("role"));
                customer.setUsername(rs.getString("username"));
                customer.setPassword(rs.getString("password"));

                Table table = new Table();
                table.setId(rs.getInt("table_id"));
                table.setName(rs.getString("table_name"));
                table.setLocation(rs.getString("location"));
                table.setNote(rs.getString("description"));

                TableReservation tr = new TableReservation();
                tr.setId(rs.getInt("id"));
                tr.setDate(rs.getDate("date"));
                tr.setStatus(rs.getString("status"));
                tr.setCustomer(customer);
                tr.setTable(table);

                list.add(tr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<TableReservation> getTableReservationByPhone(String phone) {
        List<TableReservation> list = new ArrayList<>();
        String sql = """
            SELECT tr.id, tr.date, tr.status,
                   m.id AS customer_id, m.name AS customer_name, m.dob, m.address,
                   m.phone, m.email, m.role, m.username, m.password,
                   t.id AS table_id, t.name AS table_name, t.location, t.description
            FROM tblTableReservation AS tr
            JOIN tblMember AS m ON tr.Customerid = m.id
            JOIN tblTable AS t ON tr.Tableid = t.id
            WHERE m.name LIKE ?
        """;

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + phone + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("customer_name"));
                customer.setDob(rs.getDate("dob"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setEmail(rs.getString("email"));
                customer.setRole(rs.getString("role"));
                customer.setUsername(rs.getString("username"));
                customer.setPassword(rs.getString("password"));

                Table table = new Table();
                table.setId(rs.getInt("table_id"));
                table.setName(rs.getString("table_name"));
                table.setLocation(rs.getString("location"));
                table.setNote(rs.getString("description"));

                TableReservation tr = new TableReservation();
                tr.setId(rs.getInt("id"));
                tr.setDate(rs.getDate("date"));
                tr.setStatus(rs.getString("status"));
                tr.setCustomer(customer);
                tr.setTable(table);

                list.add(tr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public TableReservation getTableReservationById(String id) {
        TableReservation tr = new TableReservation();
                String sql = """
            SELECT tr.id, tr.date, tr.status,
                   m.id AS customer_id, m.name AS customer_name, m.dob, m.address,
                   m.phone, m.email, m.role, m.username, m.password,
                   t.id AS table_id, t.name AS table_name, t.location, t.description
            FROM tblTableReservation AS tr
            JOIN tblMember AS m ON tr.Customerid = m.id
            JOIN tblTable AS t ON tr.Tableid = t.id
            WHERE tr.id LIKE ?
        """;

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + id + "%");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("customer_name"));
                customer.setDob(rs.getDate("dob"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setEmail(rs.getString("email"));
                customer.setRole(rs.getString("role"));
                customer.setUsername(rs.getString("username"));
                customer.setPassword(rs.getString("password"));

                Table table = new Table();
                table.setId(rs.getInt("table_id"));
                table.setName(rs.getString("table_name"));
                table.setLocation(rs.getString("location"));
                table.setNote(rs.getString("description"));

                tr.setId(rs.getInt("id"));
                tr.setDate(rs.getDate("date"));
                tr.setStatus(rs.getString("status"));
                tr.setCustomer(customer);
                tr.setTable(table);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tr;
    }
}
