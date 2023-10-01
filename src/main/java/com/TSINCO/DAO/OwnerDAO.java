package com.TSINCO.DAO;

import com.TSINCO.model.Owner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OwnerDAO {

    public List<Owner> getOwnerList() {
        List<Owner> ownerList = new ArrayList<>();
        Connection con = ConnectionDAO.connectionDB();
        try {
//            String query = "SELECT * FROM owner LIMIT ? OFFSET ?";
            String query = "SELECT * FROM owner WHERE delete_flag = 0 ORDER BY id DESC";

            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);
//            ps.setInt(1, limit);
//            ps.setInt(2, offset);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Owner o = new Owner();
                o.setId(rs.getLong("id"));
                o.setName(rs.getString("name"));
                o.setNational_code(rs.getString("national_code"));
                o.setAge(rs.getInt("age"));
                o.setTotal_toll_paid(rs.getInt("total_toll_paid"));
                o.setDelete_flag(rs.getInt("delete_flag"));

                ownerList.add(o);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return ownerList;
    }


//    public static int getOwnerListSize(){
//        int count = 0;
//        try {
//            String query = "SELECT COUNT(*) c FROM owner";
//
//            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                count = rs.getInt("c");
//            }
//
//            rs.close();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return count;
//    }

    public int addOwner(Owner o) {
        Connection con = ConnectionDAO.connectionDB();
        PreparedStatement ps = null;
        String query = "INSERT INTO owner (name, national_code, age, total_toll_paid) VALUES (?,?,?,?)";
        int insertRes = 0;

        try {
            if (con != null) {
                ps = con.prepareStatement(query);

                ps.setString(1, o.getName());
                ps.setString(2, o.getNational_code());
                ps.setInt(3, o.getAge());
                ps.setInt(4, o.getTotal_toll_paid());
                ps.executeUpdate();
//                res = ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return insertRes;
        }
        insertRes =  1;
        return insertRes;
    }


    public int deleteOwner(Owner o) {
        Connection con = ConnectionDAO.connectionDB();
        PreparedStatement ps = null;
        String query = "DELETE FROM owner WHERE id = ?";
        int res = 0;

        try {
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setLong(1, o.getId());
                res = ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return res;
    }

    public int logicalDeleteOwner(Owner o) {
        Connection con = ConnectionDAO.connectionDB();
        PreparedStatement ps = null;
        String query = "UPDATE owner SET delete_flag = 1 WHERE id = ?";
        int ldRes = 0;

        try {
            if (con != null) {
                ps = con.prepareStatement(query);
                ps.setLong(1, o.getId());
                ldRes = ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return ldRes;
    }

    public int updateOwner(Owner o) {
        Connection con = ConnectionDAO.connectionDB();
        PreparedStatement ps = null;
        String query = "UPDATE owner SET name = ?, national_code = ?, age = ?, total_toll_paid = ? WHERE id = ?";
        int res = 0;

        try {

            ps = con.prepareStatement(query);

            ps.setString(1, o.getName());
            ps.setString(2, o.getNational_code());
            ps.setInt(3, o.getAge());
            ps.setInt(4, o.getTotal_toll_paid());
            ps.setLong(5, o.getId());
            res = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return res;
    }


    public Owner getOwnerById(int id) {
        List<Owner> ownerList = new ArrayList<>();
        Connection con = ConnectionDAO.connectionDB();
        Owner o = new Owner();
        try {
//            String query = "SELECT * FROM owner LIMIT ? OFFSET ?";
            String query = "SELECT * FROM owner WHERE id = ? AND delete_flag = 0";

            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);
            ps.setLong(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                o.setId(rs.getLong("id"));
                o.setName(rs.getString("name"));
                o.setNational_code(rs.getString("national_code"));
                o.setAge(rs.getInt("age"));
                o.setTotal_toll_paid(rs.getInt("total_toll_paid"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return o;

    }

    public List<Owner> getOwnerListByInput(String name, String national_code, int age, int total_toll_paid) {
        Connection con = ConnectionDAO.connectionDB();
        List<Owner> oList = new ArrayList<>();

        try {
            String query = "SELECT * FROM owner ";
            int i = 0;


            if ((name != null && !name.isEmpty()) ||
                    (national_code != null && !national_code.isEmpty()) ||
                    (age != -1) ||
                    (total_toll_paid != -1)) {
                query += " WHERE delete_flag = 0 AND ";
                if (name != null && !name.isEmpty()) {
                    query += " name LIKE ?";
                    i++;
                }
                if (national_code != null && !national_code.isEmpty()) {
                    query += " national_code LIKE ?";
                    i++;
                }
                if (age != -1) {
                    if (i > 0) {
                        query += " AND ";
                    }
                    query += " age = ?";
                    i++;
                }
                if (total_toll_paid != -1) {
                    if (i > 0) {
                        query += " AND ";
                    }
                    query += " total_toll_paid = ?";
                    i++;
                }
            }


            PreparedStatement ps = ConnectionDAO.con.prepareStatement(query);

            //  Here I set the input value in the query
            int count = 1;
            if (name != null && !name.isEmpty()) {
                ps.setString(count, "%" + name + "%");
                ++count;
            }
            if (national_code != null && !national_code.isEmpty()) {
                ps.setString(count, "%" + national_code + "%");
                ++count;
            }
            if (age != -1) {
                ps.setInt(count, age);
                ++count;
            }
            if (total_toll_paid != -1) {
                ps.setInt(count, total_toll_paid);
                ++count;
            }


            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Owner o = new Owner();

                o.setId(rs.getLong("id"));
                o.setName(rs.getString("name"));
                o.setNational_code(rs.getString("national_code"));
                o.setAge(rs.getInt("age"));
                o.setTotal_toll_paid(rs.getInt("total_toll_paid"));

                oList.add(o);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return oList;
    }
}
