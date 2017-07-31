package com.fim.controller;

import com.fim.model.Client;
import com.fim.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 7/10/17.
 */
@Controller
public class AppController {

    @Autowired
    private ClientService clientService;


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
    @RequestMapping(value = {"admin"}, method = RequestMethod.GET)
    public String viewAdminPage(ModelMap model){

        List<Client> clients = clientService.allClients();
        model.addAttribute("clients",clients);
        Client client = new Client();
        model.addAttribute("client",client);

        int maxClient = 10;
        if (clients.size()>= maxClient){
            model.addAttribute("clientAddError",true);
        }else if (clients.size()< maxClient){
            model.addAttribute("clientAddError",false);
        }


        return "admin";
    }
    @RequestMapping(value = "admin", method = RequestMethod.POST)
    public String adminPost(@Valid Client client, BindingResult result, ModelMap model){
        if (result.hasErrors()) {
            System.out.println("There are errors");
            return "add-client";
        }

        clientService.insertClient(client);
        return "redirect:/";
    }

    @RequestMapping(value = "remove-client-{clientState}", method = RequestMethod.GET)
    public String removeClient(@PathVariable int clientState){
        clientService.deleteClient(clientService.findByState(clientState));
        return "redirect:/";
    }
    @RequestMapping(value = "edit-client-{clientState}", method = RequestMethod.GET)
    public String editClirnt(@PathVariable int clientState,ModelMap model){
        model.addAttribute("client",clientService.findByState(clientState));
        model.addAttribute("editClient",true);
        return "edit-client";
    }


}
