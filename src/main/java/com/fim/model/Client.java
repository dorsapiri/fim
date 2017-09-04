package com.fim.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by dorsa on 7/25/17.
 */
@Entity
@Table(name = "tbl_client")
public class Client implements Serializable {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;


    @Column(name = "ip",columnDefinition = "varchar(45)")
    private String clientIP;


    @Column(name = "last_connection")
    private long lastConnection;

    @Transient
    private Date lastcon;

    @Transient
    private boolean longConnect;

    @Column(name = "new_client")
    private boolean isNewClient;

    @Column(name = "remove_client")
    private boolean isRemoveClient;

    @Column(name = "address_change")
    private boolean isAddressChange;

    @Column(name = "reg_key_change")
    private boolean isRegKeyChange;


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


    public long getLastConnection() {
        return lastConnection;
    }

    public void setLastConnection(long lastConnection) {
        this.lastConnection = lastConnection;
    }

    public Date getLastcon() {
        return lastcon;
    }

    public void setLastcon(Date lastcon) {
        this.lastcon = lastcon;
    }

    public boolean isLongConnect() {
        return longConnect;
    }

    public void setLongConnect(boolean longConnect) {
        this.longConnect = longConnect;
    }

    public boolean isNewClient() {
        return isNewClient;
    }

    public void setNewClient(boolean newClient) {
        isNewClient = newClient;
    }

    public boolean isRemoveClient() {
        return isRemoveClient;
    }

    public void setRemoveClient(boolean removeClient) {
        isRemoveClient = removeClient;
    }

    public boolean isAddressChange() {
        return isAddressChange;
    }

    public void setAddressChange(boolean addressChange) {
        isAddressChange = addressChange;
    }

    public boolean isRegKeyChange() {
        return isRegKeyChange;
    }

    public void setRegKeyChange(boolean regKeyChange) {
        isRegKeyChange = regKeyChange;
    }
}
