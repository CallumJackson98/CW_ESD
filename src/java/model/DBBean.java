/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
                
                //System.out.println(rs.getString(1) + " " + rs.getString(2));
                
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
    
    // Create new record in TEMP_EMPLOYEE table
    public void addTempStaff(String data){
        
        try{
            
            state = con.createStatement();
            state.executeUpdate("INSERT INTO TEMP_EMPLOYEE VALUES" + data);
            state.close();
            //con.close();
            
        }catch (SQLException e){
            System.err.println("Error: " + e);
        }
 
    }
    
    // Return an array list of users waiting approvale
    public ArrayList<String> getApprovalUsers(){
        
        ArrayList approvalUsers = new ArrayList<String>();
        
        try {
            state = con.createStatement();
            rs = state.executeQuery("SELECT * from TEMP_EMPLOYEE");
            String userString;
            while(rs.next()){
                
                userString = rs.getString(1) + ", " + rs.getString(2) + ", " + rs.getString(3) + ", " + rs.getString(5);
                approvalUsers.add(userString);
                
            }
                  
        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }//try
        
        return approvalUsers;
        
    }
    
    // Accept/reject staff signup
    public void acceptRejectStaff(String ar, String uName){
        
        // Copy to staff table and delete from TEMP_EMPLOYEE
        if("Accept".equals(ar)){
            
            try{
                
                PreparedStatement st1 = con.prepareStatement
                ("INSERT INTO USERS (UNAME, PASSWD, ROLE)"
                    + " SELECT UNAME, PASSWORD, ROLE FROM TEMP_EMPLOYEE"
                    + " WHERE UNAME = ?");
                st1.setString(1, uName);
                st1.executeUpdate();
                
                PreparedStatement st = con.prepareStatement
                ("INSERT INTO EMPLOYEE (ENAME, EADDRESS, UNAME)"
                    + " SELECT ENAME, EADDRESS, UNAME FROM TEMP_EMPLOYEE"
                    + " WHERE UNAME = ?");
                st.setString(1, uName);
                st.executeUpdate();

                PreparedStatement st3 = con.prepareStatement("DELETE FROM TEMP_EMPLOYEE WHERE UNAME = ?");
                    st3.setString(1, uName);
                    st3.executeUpdate();
            
            }catch(Exception e){
                System.err.println("Error: " + e);
                //System.out.println("INSIDE ACCEPT CATCH");
            }
        }else{
            // Delete from TEMP_EMPLOYEE
            try{
                
                //state = con.createStatement();
                //state.executeUpdate("DELETE FROM TEMP_EMPLOYEE WHERE UNAME='" + uName + "'");
                
                PreparedStatement st = con.prepareStatement("DELETE FROM TEMP_EMPLOYEE WHERE UNAME = ?");
                st.setString(1, uName);
                st.executeUpdate();
                
            }catch(Exception e){
                System.err.println("Error: " + e);
            }
            
            
        }
        
    }
    
}
