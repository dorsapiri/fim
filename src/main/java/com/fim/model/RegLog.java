package com.fim.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by dorsa on 8/28/17.
 */
@Entity
@Table(name = "tbl_reg_log")
public class RegLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "ip",columnDefinition = "varchar(45)")
    private String clientIP;

    @Column(name = "reg_key")
    private String regKey;

    @Column(name = "reg_value")
    private String regValue;

    @Column(name = "event")
    private int event;

    @Transient
    private String eventStatus;

    @Column(name = "log_date")
    private Long date;

    @Transient
    private Date dateD;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClientIP() {
        return clientIP;
    }

    public void setClientIP(String clientIP) {
        this.clientIP = clientIP;
    }

    public String getRegKey() {
        return regKey;
    }

    public void setRegKey(String regKey) {
        this.regKey = regKey;
    }

    public String getRegValue() {
        return regValue;
    }

    public void setRegValue(String regValue) {
        this.regValue = regValue;
    }

    public int getEvent() {
        return event;
    }

    public void setEvent(int event) {
        this.event = event;
    }

    public String getEventStatus() {
        return eventStatus;
    }

    public void setEventStatus(String eventStatus) {
        this.eventStatus = eventStatus;
    }

    public Long getDate() {
        return date;
    }

    public void setDate(Long date) {
        this.date = date;
    }

    public Date getDateD() {
        return dateD;
    }

    public void setDateD(Date dateD) {
        this.dateD = dateD;
    }
}
