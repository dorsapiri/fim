package com.fim.model;

/**
 * Created by dorsa on 8/13/17.
 */
public class LogEvents {
    private String clientIP;
    private int created;
    private int deleted;
    private int modified;
    private int renamed;
    private int security;

    public String getClientIP() {
        return clientIP;
    }

    public void setClientIP(String clientIP) {
        this.clientIP = clientIP;
    }

    public int getCreated() {
        return created;
    }

    public void setCreated(int created) {
        this.created = created;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public int getModified() {
        return modified;
    }

    public void setModified(int modified) {
        this.modified = modified;
    }

    public int getRenamed() {
        return renamed;
    }

    public void setRenamed(int renamed) {
        this.renamed = renamed;
    }

    public int getSecurity() {
        return security;
    }

    public void setSecurity(int security) {
        this.security = security;
    }
}
