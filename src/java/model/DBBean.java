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
                        case "client":
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
                
                userString = rs.getString(1) + "; " + rs.getString(2) + "; " + rs.getString(3) + "; " + rs.getString(5);
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
                ("INSERT INTO EMPLOYEE (ENAME, EADDRESS, UNAME, SHIFT)"
                    + " SELECT ENAME, EADDRESS, UNAME, SHIFT FROM TEMP_EMPLOYEE"
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
    
    // Function to return all users in the USERS table
    public ArrayList<String> getAllUsers(){
        
        ArrayList allUsers = new ArrayList<String>();
        
        try {
            state = con.createStatement();
            rs = state.executeQuery("SELECT * from USERS");
            String userString;
            while(rs.next()){
                
                userString = rs.getString(1) + " || " + rs.getString(3);
                allUsers.add(userString);
                
            }
                  
        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }//try
        
        return allUsers;
        
    }
    
    public void deleteUser(String uName){
        
        // Delete users
        try{
            
            // Delete from clients or employees first (holds foreign key)
            PreparedStatement st = con.prepareStatement("DELETE FROM CLIENTS WHERE UNAME = ?");
            st.setString(1, uName);
            st.executeUpdate();
            
            PreparedStatement st1 = con.prepareStatement("DELETE FROM EMPLOYEE WHERE UNAME = ?");
            st1.setString(1, uName);
            st1.executeUpdate();
               
            // Delete from users
            PreparedStatement st3 = con.prepareStatement("DELETE FROM USERS WHERE UNAME = ?");
            st3.setString(1, uName);
            st3.executeUpdate();
            
        }catch(Exception e){
            System.err.println("Error: " + e);
        }
        
    }
    
    // Get all patients of a defined type
    public ArrayList<String> getAllPatientsOfType(String type){
        
        ArrayList allOfType = new ArrayList<String>();
        
        try {
            state = con.createStatement();
            rs = state.executeQuery("SELECT * from CLIENTS where CTYPE='"+type+"'");
            String userString;
            while(rs.next()){
                
                userString = rs.getString(2) + " || " + rs.getString(3) + " || " + rs.getString(4) + " || " + rs.getString(5);
                allOfType.add(userString);
                
            }
                  
        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }//try
        
        return allOfType;
        
    }
    
    // Add prescription request to prescription table
    public void addRequestedPrescription(String uName, String drugName){
        
        try{
            
            String data = "('"+uName+"','"+drugName+"')";
            
            state = con.createStatement();
            state.executeUpdate("INSERT INTO TEMP_PRESCRIPTIONS (uName, drug_Name) VALUES" + data);
            state.close();
            
        }catch(Exception e){
            
            System.err.println("Error: " + e);
            
        }
        
    }
    
    // Get all requested prescriptions
    public ArrayList<String> getRequestedPrescriptions(){
        
        ArrayList requestedPrescriptions = new ArrayList<String>();
        
        try {
            state = con.createStatement();
            rs = state.executeQuery("SELECT * from TEMP_PRESCRIPTIONS");
            String userString;
            while(rs.next()){
                
                userString = rs.getString(1) + ", " + rs.getString(2) + ", " + rs.getString(3);
                requestedPrescriptions.add(userString);
                
            }
                  
        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }//try
        
        return requestedPrescriptions;
        
    }
    
    public void acceptRejectPrescription(String ar, String prescriptionID){
        
        // Copy to staff table and delete from TEMP_PRESCRIPTIONS
        if("Accept".equals(ar)){
            
            try{
                
                PreparedStatement st1 = con.prepareStatement
                ("INSERT INTO PRESCRIPTIONS (UNAME, DRUG_NAME)"
                    + " SELECT UNAME, DRUG_NAME FROM TEMP_PRESCRIPTIONS"
                    + " WHERE PRESCRIPTION_ID = ?");
                st1.setString(1, prescriptionID);
                st1.executeUpdate();

                PreparedStatement st2 = con.prepareStatement("DELETE FROM TEMP_PRESCRIPTIONS WHERE PRESCRIPTION_ID = ?");
                    st2.setString(1, prescriptionID);
                    st2.executeUpdate();
            
            }catch(Exception e){
                System.err.println("Error: " + e);
            }
        }else{
            // Delete from TEMP_PRESCRIPTIONS
            try{
                
                PreparedStatement st = con.prepareStatement("DELETE FROM TEMP_PRESCRIPTIONS WHERE PRESCRIPTION_ID = ?");
                st.setString(1, prescriptionID);
                st.executeUpdate();
                
            }catch(Exception e){
                System.err.println("Error: " + e);
            }
            
            
        }
        
    }
    
    // Verify that appointment for staff member is free
    public boolean checkIfAppExists(String date, String time, String eID){
        
        try {
            state = con.createStatement();
            rs = state.executeQuery("SELECT * from BOOKING_SLOTS");
            while(rs.next()){
                
                if(rs.getString(4).equals(date) && rs.getString(5).equals(time) && rs.getString(2).equals(eID)){
                    
                    return true;
                    
                }
                
            }
            
        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }//try
        
        return false;
        
    }
    
    // Add booking to booking table
    public void addBooking(String eID, String cID, String date, String time){
        
        try{
            
            String data = "("+eID+","+cID+",'"+date+"','"+time+"')";
            
            System.out.println(data);
            
            state = con.createStatement();
            state.executeUpdate("INSERT INTO BOOKING_SLOTS (EID, CID, SDATE, STIME) VALUES" + data);
            state.close();
            
        }catch(Exception e){
            
            System.err.println("Error: " + e);
            
        }
        
    }
    
    // Function to get user ID
    public String getUserID(String uName, String tableName){
        
        int col = 4;
        if("CLIENTS".equals(tableName)){
            col = 5;
        }
        
        try {
            state = con.createStatement();
            rs = state.executeQuery("SELECT * from " + tableName);
            while(rs.next()){
                
                if(rs.getString(col).equals(uName)){
                    
                    return rs.getString(1);
                    
                }
                
            }
            
        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }//try
        
        return "null";
        
    }
    
    // Function to get staff ID based on type and shift pattern
    public String getStaffID(String sType, String shift){
        
        try {
            
            String uName = "";
            String sID = "";
            
            state = con.createStatement();
            rs = state.executeQuery("SELECT * from EMPLOYEE");
            while(rs.next()){
                
                if(rs.getString(5).equals(shift)){
                    
                    uName = rs.getString(4);
                    sID = rs.getString(1);
                    
                    if(checkTypeMatches(sType, uName)){
                        
                        return sID;
                        
                    }
                    
                }
                
            }
            
        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }//try
        
        return "null";
        
    }
    
    public boolean checkTypeMatches(String sType, String uName){
        
        ResultSet rs1;
        
        try {
            
            state = con.createStatement();
            rs1 = state.executeQuery("SELECT * from USERS");
            while(rs1.next()){
                
                if(rs1.getString(3).equals(sType) && rs1.getString(1).equals(uName)){
                    
                    return true;
                    
                }
                
            }
            
        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }//try
        
        return false;
        
    }
    
}
