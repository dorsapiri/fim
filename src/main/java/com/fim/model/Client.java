package com.fim.model;

import javax.persistence.*;

/**
 * Created by dorsa on 7/25/17.
 */
@Entity
@Table(name = "tbl_client")
public class Client {
    @Column(name = "ip")
    private String clientIP;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "state")
    private int state;

    @Column(name = "add1")
    private String address1;

    @Column(name = "add2")
    private String address2;

    @Column(name = "add3")
    private String address3;

    @Column(name = "sub1")
    private boolean subTree1;

    @Column(name = "sub2")
    private boolean subTree2;

    @Column(name = "sub3")
    private boolean subTree3;

    public String getClientIP() {
        return clientIP;
    }

    public void setClientIP(String clientIP) {
        this.clientIP = clientIP;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getAddress3() {
        return address3;
    }

    public void setAddress3(String address3) {
        this.address3 = address3;
    }

    public boolean isSubTree1() {
        return subTree1;
    }

    public void setSubTree1(boolean subTree1) {
        this.subTree1 = subTree1;
    }

    public boolean isSubTree2() {
        return subTree2;
    }

    public void setSubTree2(boolean subTree2) {
        this.subTree2 = subTree2;
    }

    public boolean isSubTree3() {
        return subTree3;
    }

    public void setSubTree3(boolean subTree3) {
        this.subTree3 = subTree3;
    }
}
