/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Jake
 */
public class DBBean {
    
    private Connection con;
    private Statement state;
    private ResultSet rs;

    // Get a connection to the database
    public boolean getConnection() {

        boolean flag = false;
        
        try {

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/ESD_CW_DB", "username", "password");
            flag = true;

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error: " + e);
        }

        return flag;

    }
    
    // Verify that user exists for logon
    public int verifyUser(String uName, String pwd){
        
        int userType = -1;
        
        try {
            state = con.createStatement();
            rs = state.executeQuery("SELECT * from USERS");
            while(rs.next()){
                
                System.out.println(rs.getString(1) + " " + rs.getString(2));
                
                if(rs.getString(1).equals(uName) && rs.getString(2).equals(pwd)){
                    
                    switch (rs.getString(3)) {
                        case "doctor":
                            userType = 0;
                            break;
                        case "nurse":
                            userType = 1;
                            break;
                        case "patient":
                            userType = 2;
                            break;
                        case "admin":
                            userType = 3;
                            break;
                        default:
                            break;
                    }
                    break;
                    
                }
                
            }
            
        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }//try
        
        return userType;
        
    }
    
    // Create new record in CLIENTS table
    public void addClient(String data){
        
        try{
            
            state = con.createStatement();
            state.executeUpdate("INSERT INTO CLIENTS (cName, cAddress, cType, uName) VALUES" + data);
            state.close();
            //con.close();
            
        }catch (SQLException e){
            System.err.println("Error: " + e);
        }
 
    }
    
    // Create new record in USERS table
    public void addUser(String data){
        
        try{
            
            state = con.createStatement();
            state.executeUpdate("INSERT INTO USERS VALUES" + data);
            state.close();
            //con.close();
            
        }catch (SQLException e){
            System.err.println("Error: " + e);
        }
 
    }
    
    
}
