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
    LocalDateTime startDate = LocalDate.now().atStartOfDay();
    LocalDateTime endDate = startDate.plusDays(15);
    ArrayList<LocalDateTime> dates = new ArrayList<LocalDateTime>();

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{
            PreparedStatement selectFreeAppointments = con.prepareStatement("SELECT * from APPOINTMENTS WHERE DATE > ? AND DATE < ?");
            selectFreeAppointments.setString(1, startDate.toString());
            selectFreeAppointments.setString(2, endDate.toString());

            ArrayList<appointment> appointments = getAppointments(selectFreeAppointments);

        } catch (SQLException ex) {
        Logger.getLogger(AppointmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        request.setAttribute("AppointmentList", allAppointments);
            
        
        response.sendRedirect("PatientDashboard.jsp");
        

    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            ArrayList<appointment> appointments = new ArrayList<appointment>();
            try{
                PreparedStatement selectFreeAppointments = con.prepareStatement("SELECT * from APPOINTMENTS WHERE DATE > ? AND DATE < ?");
                selectFreeAppointments.setString(1, startDate.toString());
                selectFreeAppointments.setString(2, endDate.toString());
                appointments = getAppointments(selectFreeAppointments);
            
            } catch (SQLException ex) {
            Logger.getLogger(AppointmentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            for (int d = 0 ; d < DAYS.between(startDate, endDate); d++){
                //Open from 10 til 4
                for (int t = 10 ; t < 16 ; t += 0.25){
                    LocalDateTime date = (startDate.plus(d, DAYS).plusHours(t));
                    appointment thisApp = appointments.get(appointments.size() - 1);
                    LocalDateTime thisAppDate = LocalDateTime.of(thisApp.getDate(), thisApp.getTime());
                    
                    if (thisAppDate.isBefore(date)){
                        
                    }
                    
                }
            
            }





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
         
        
    }
    
        
}
