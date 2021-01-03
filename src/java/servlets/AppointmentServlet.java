/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import static java.time.temporal.ChronoUnit.DAYS;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBBean;
import java.util.ArrayList;


/**
 *
 * @author callu
 */
public class AppointmentServlet extends HttpServlet {
    private Connection con;
    private Statement state;
    private ResultSet rs;
    DBBean db = new DBBean();
    boolean bool = db.getConnection();
    LocalDateTime startDate = setToMidnight(LocalDateTime.now());
    LocalDateTime endDate = startDate.plusDays(15);
    ArrayList<LocalDateTime> dates = new ArrayList<LocalDateTime>();
    Logger logger = Logger.getLogger(getClass().getName());
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("hehrher");
        appointment newAppointment = new appointment(0, "FREE", 0, 0, startDate.toLocalDate(), endDate.toLocalTime());
        writeAppointment(newAppointment, "INSERT");
        //updateDB();
        
        
        logger.info("hereeeeee");
        
        ArrayList<appointment> appointments = new ArrayList<>();
        
        try{
            PreparedStatement selectFreeAppointments = con.prepareStatement("SELECT * from APPOINTMENTS WHERE DATE > ? AND DATE < ?");
            selectFreeAppointments.setString(1, startDate.toString());
            selectFreeAppointments.setString(2, endDate.toString());
            
            appointments = getAppointments(selectFreeAppointments);

        } catch (SQLException ex) {
        Logger.getLogger(AppointmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        request.setAttribute("AppointmentList", appointments);
        request.getRequestDispatcher("BookAppointment.jsp").forward(request, response);
        
        

    }
    
    
    protected void updateDB(){
        ArrayList<appointment> allAppointments = new ArrayList<>();
        ArrayList<LocalDateTime> newDateTimes = new ArrayList<>();
        
        int max_ID = 0;
        try{
            PreparedStatement selectFreeAppointments = con.prepareStatement("SELECT * MAX(SLOT_ID) FROM APPOINTMENTS");
            ArrayList<appointment> maxIDAppointment = getAppointments(selectFreeAppointments);
            max_ID = maxIDAppointment.get(0).getSlot_ID();
        } catch (SQLException ex) {
            Logger.getLogger(AppointmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        DateTimeFormatter format = DateTimeFormatter.ISO_DATE_TIME;
        int count = 0;
        PreparedStatement checkAppointment;
        appointment newAppointment;
        for (LocalDateTime d = startDate ; d.isBefore(endDate) ; d = d.plusMinutes(15)){
            if (d.isAfter(d.withHour(10)) && d.isBefore(d.withHour(16))){
                try{
                    checkAppointment = con.prepareStatement("SELECT * FROM APPOINTMENTS WHERE DATE = ? AND TIME = ?");
                    checkAppointment.setString(1, d.toString());
                    checkAppointment.setString(2, d.toString());
                    newAppointment = getAppointments(checkAppointment).get(0);
                } catch (SQLException ex) {
                    count += 1;
                    newDateTimes.add(d);
                    log(d.format(format));
                    newAppointment = new appointment(max_ID + count, "FREE", 0, 0, d.toLocalDate(), d.toLocalTime());
                    writeAppointment(newAppointment, "INSERT");
                }
                allAppointments.add(newAppointment);
                
            }
        }
        
        
    }
    
    private int writeAppointment(appointment newAppointment, String op) {
        try{
            PreparedStatement write;
            
            if ("INSERT".equals(op)){
                write = con.prepareStatement("INSERT INTO APPOINTMENTS (SLOT_ID, APPOINTMENT_VALUE, PATIENT_ID, DOCTOR_ID, DATE, TIME) VALUES (?, ?, ?, ?, ?, ?)");
                write.setInt(1, newAppointment.getSlot_ID());
                write.setString(2, newAppointment.getAppointment_Value());
                write.setInt(3, newAppointment.getPatient_ID());
                write.setInt(4, newAppointment.getDoctor_ID());
                write.setString(5, newAppointment.getDate().toString());
                write.setString(6, newAppointment.getTime().toString());
                write.executeUpdate();
                
            }
            
            else if ("UPDATE".equals(op)){
                write = con.prepareStatement("UPDATE APPOINTMENTS SET APPOINTMENT_VALUE = ? WHERE SLOT_ID = ?");
                
                write.setString(1, newAppointment.appointment_Value);
                write.setInt(2, newAppointment.slot_ID);
                
                write.executeQuery();
            }
            return(1);
        } catch (SQLException ex) {
            Logger.getLogger(AppointmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return(0);
    }


    private ArrayList<appointment> getAppointments(PreparedStatement SQLQuery) {
        ArrayList<appointment> appointments = new ArrayList<>();
        try{
            ResultSet rs = SQLQuery.executeQuery();
            int slot_ID;
            String appointment_Value;
            int patient_ID;
            int doctor_ID;
            LocalDate date;
            LocalTime time;
            while(rs.next()){
                slot_ID = rs.getInt("SLOT_ID");
                appointment_Value = rs.getString("APPOINTMENT_VALUE");
                patient_ID = rs.getInt("PATIENT_ID");
                doctor_ID = rs.getInt("DOCTOR_ID");
                date = (rs.getDate("DATE")).toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                time = (rs.getTime("TIME")).toLocalTime();;
                appointment newAppointment = new appointment(slot_ID, appointment_Value, patient_ID, doctor_ID, date, time);
                appointments.add(newAppointment);
            }
        
        } catch (SQLException ex) {
            Logger.getLogger(AppointmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return(appointments);
    }
    
    


    private LocalDateTime setToMidnight(LocalDateTime dateTimeToConvert){
        return(dateTimeToConvert.withHour(0).withMinute(0).withSecond(0));
    }
        
}
