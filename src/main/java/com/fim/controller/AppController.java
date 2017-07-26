package com.fim.controller;

import com.fim.model.Client;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 7/10/17.
 */
@Controller
public class AppController {

    @RequestMapping(value = {"/","home"},method = RequestMethod.GET)
    public String viewHome(){
        return "home-second";
    }
    @RequestMapping(value = "report",method = RequestMethod.GET)
    public String viewReport(){
        return "report";
    }

    @RequestMapping(value = "settings",method = RequestMethod.GET)
    public String viewSettings(){
        return "settings";
    }
    @RequestMapping(value = "dashboard",method = RequestMethod.GET)
    public String viewDashboard(){
        return "dashboard";
    }
    @RequestMapping(value = "file-monitoring",method = RequestMethod.GET)
    public String viewFileMonitoring(){
        return "file-monitoring";
    }
    @RequestMapping(value = "admin", method = RequestMethod.GET)
    public String viewAdminPage(ModelMap model){

        List<Client> clients = new ArrayList<>();

        Client client1 = new Client();
        client1.setClientIP("123.456.76.7");
        client1.setState(2);
        client1.setAddress1("C:\\ProgramFiles1");
        client1.setAddress2("C:\\ProgramFiles2");
        client1.setAddress3("C:\\ProgramFiles3");
        client1.setSubTree1(true);
        client1.setSubTree2(true);
        client1.setSubTree3(true);
        clients.add(client1);

        model.addAttribute("clients",clients);
        return "admin";
    }
}
