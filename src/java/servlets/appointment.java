
package servlets;

import java.time.LocalDate;
import java.time.LocalTime;

public class appointment {
    
    int slot_ID;
    String appointment_Value;
    int patient_ID;
    int doctor_ID;
    LocalDate date;
    LocalTime time;
    
    public appointment(int slot_ID, String appointment_Value, int patient_ID, int doctor_ID, LocalDate date, LocalTime time){
        slot_ID = slot_ID;
        appointment_Value = appointment_Value;
        patient_ID = patient_ID;
        doctor_ID = doctor_ID;
        date = date;
        time = time;
    }


    public int getSlot_ID() {
        return slot_ID;
    }

    public void setSlot_ID(int slot_ID) {
        this.slot_ID = slot_ID;
    }

    public String getAppointment_Value() {
        return appointment_Value;
    }

    public void setAppointment_Value(String appointment_Value) {
        this.appointment_Value = appointment_Value;
    }

    public int getPatient_ID() {
        return patient_ID;
    }

    public void setPatient_ID(int patient_ID) {
        this.patient_ID = patient_ID;
    }

    public int getDoctor_ID() {
        return doctor_ID;
    }

    public void setDoctor_ID(int doctor_ID) {
        this.doctor_ID = doctor_ID;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }
    
    
    
}
