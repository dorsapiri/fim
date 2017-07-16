package com.fim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by dorsa on 7/10/17.
 */
@Controller
public class AppController {

    @RequestMapping(value = {"home","/"},method = RequestMethod.GET)
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
}
