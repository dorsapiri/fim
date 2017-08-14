package com.fim.model;

import javax.persistence.*;

/**
 * Created by dorsa on 8/13/17.
 */
@Entity
@Table(name = "tbl_log")
public class Log {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "ip",columnDefinition = "varchar(45)")
    private String clientIP;

    @Column(name = "file_name",columnDefinition = "varchar(200)")
    private String fileName;

    @Column(name = "event")
    private int event;

    @Column(name = "log_date")
    private long logDate;

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

    public long getLogDate() {
        return logDate;
    }

    public void setLogDate(long logDate) {
        this.logDate = logDate;
    }
}
