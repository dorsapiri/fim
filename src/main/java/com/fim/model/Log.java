package com.fim.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by dorsa on 8/13/17.
 */
@Entity
@Table(name = "tbl_log")
public class Log {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "ip",columnDefinition = "varchar(45)")
    private String clientIP;

    @Column(name = "file_name",columnDefinition = "varchar(255)")
    private String fileName;

    @Column(name = "event")
    private int event;

    @Transient
    private String eventStatus;

    @Column(name = "log_date")
    private long logDate;

    @Transient
    private Date dateD;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getClientIP() {
        return clientIP;
    }

    public void setClientIP(String clientIP) {
        this.clientIP = clientIP;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
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

    public long getLogDate() {
        return logDate;
    }

    public void setLogDate(long logDate) {
        this.logDate = logDate;
    }

    public Date getDateD() {
        return dateD;
    }

    public void setDateD(Date dateD) {
        this.dateD = dateD;
    }
}
