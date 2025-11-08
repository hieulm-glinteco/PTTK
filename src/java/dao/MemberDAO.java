/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import model.Member;

/**
 *
 * @author TT
 */
public class MemberDAO extends DAO{

    public MemberDAO() {
    }
    
    public Member isLogin(String username, String password){
        Member member = new Member();
        String role = "";
        String sql = "select * from tblMember where username = ? and password = ?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                role += rs.getString("role");
                member.setId(rs.getInt("id"));
                member.setName(rs.getString("name"));
                member.setRole(rs.getString("role"));
            }
            return member;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
