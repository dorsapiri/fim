package com.fim.controller;

import com.fim.model.*;
import com.fim.service.*;
import javafx.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 7/10/17.
 */
@Controller
@SessionAttributes("roles")
public class AppController {

    public final static int NEW_CLIENT=1;
    public final static int REMOVE_CLIENT=2;
    public final static int ADDRESS_CHANGED=3;
    public final static int CLIENT_APPROVED=4;

    public static final int ENTRY_CREATE=1;
    public static final int ENTRY_DELETE=2;
    public static final int ENTRY_MODIFY=3;
    public static final int ENTRY_RENAME=4;
    public static final int ENTRY_SECURITY=5;

    @Autowired
    private ClientService clientService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private LogService logService;

    @Autowired
    AuthenticationTrustResolver authenticationTrustResolver;

    @Autowired
    PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

    @Autowired
    MessageSource messageSource;

    @Autowired
    UserService userService;

    @Autowired
    UserProfileService userProfileService;

    /**
     * This method handles login GET requests.
     * If users is already logged-in and tries to goto login page again, will be redirected to list page.
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginPage() {
        if (isCurrentAuthenticationAnonymous()) {
            return "login";
        } else {
            return "redirect:admin";
        }
    }
    /**
     * This method returns true if users is already authenticated [logged-in], else false.
     */
    private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }

    @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return userProfileService.findAll();
    }

    @RequestMapping(value = "access_denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        return "access_denied";
    }


    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }

        return userName;
    }
    @ModelAttribute("loggedinuserName")
    private  String getPrincipalName(){
        User user = userService.findBySSO(getPrincipal());
        if (user==null){
            return getPrincipal();
        }
        return user.getFirstName();
    }

    @RequestMapping(value = {"/","home"},method = RequestMethod.GET)
    public String viewHome(){
        return "home-second";
//        return "home";
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
//    @RequestMapping(value = {"admin"}, method = RequestMethod.GET)
    @RequestMapping(value = {"admin/clients"}, method = RequestMethod.GET)
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


//        return "admin";
        return "clients";
    }
//    @RequestMapping(value = "admin", method = RequestMethod.POST)
    @RequestMapping(value = "admin/clients", method = RequestMethod.POST)
    public String adminPost(@Valid Client client, BindingResult result, ModelMap model){
        if (result.hasErrors()) {
            System.out.println("There are errors");
            return "add-client";
        }

        Client preClient = clientService.findByIP(client.getClientIP());
        if (preClient!=null && preClient.getState()!=REMOVE_CLIENT){
            System.out.println("This client exsist");
            return "add-client";
        }
        if (preClient!=null && preClient.getState()==REMOVE_CLIENT){
            System.out.println("Changes didn't commit yet.");
            return "add-client";
        }
        client.setState(NEW_CLIENT);
        clientService.insertClient(client);
        return "redirect:/admin/";
    }

    @RequestMapping(value = "remove-client-{clientIP}", method = RequestMethod.GET)
    public String removeClient(@PathVariable String clientIP){
        Client removedClient = clientService.findByIP(clientIP);
        removedClient.setState(REMOVE_CLIENT);
        clientService.updateClient(removedClient);
//        clientService.deleteClient();
        return "redirect:/";
    }
    @RequestMapping(value = "add-address-client-{clientIP}",method = RequestMethod.GET)
    public String getAddresses(@PathVariable String clientIP, ModelMap model){
        Client client = clientService.findByIP(clientIP);
        model.addAttribute("client",client);
        Address address = new Address();
        model.addAttribute("address",address);

        model.addAttribute("clientAddresses",addressService.findByClientIP(clientIP));
        return "client-profile";
    }
    @RequestMapping(value = "add-address-client-{clientIP}",method = RequestMethod.POST)
    public String addAddress(@Valid Address address,ModelMap model){
        model.addAttribute("address",address);
        if (addressService.isAddressExist(address)){
            model.addAttribute("alert",true);
            return "client-profile";
        }
        Client client = clientService.findByIP(address.getClientIP());
        if (client.getState()==CLIENT_APPROVED){
            client.setState(ADDRESS_CHANGED);
            clientService.updateClient(client);
        }
        addressService.insertAddress(address);
        return "client-profile";
    }
    @RequestMapping(value = "remove-address-{addressId}",method = RequestMethod.GET)
    public String removeAddress(@PathVariable int addressId, ModelMap model){


        Client client = clientService.findByIP(addressService.findById(addressId).getClientIP());
        if (client.getState()==CLIENT_APPROVED){
            client.setState(ADDRESS_CHANGED);
            clientService.updateClient(client);
        }
        addressService.deleteAddress(addressService.findById(addressId));
        return "client-profile";
    }
    @RequestMapping(value = "admin/log",method = RequestMethod.GET)
    public String viewLogs(ModelMap model){
        List<Client> clients = clientService.allClients();
        /*List<Log> logs = new ArrayList<>();
        for (Client cl:clients){
            logs.addAll(logService.findLogsByIp(cl.getClientIP()));
        }*/
        /*Pair<String,LogEvents> logEventsPair = null;*/
        List<LogEvents> logEventss= new ArrayList<>();
        List<Log> created = new ArrayList<>();
        List<Log> deleted = new ArrayList<>();
        List<Log> modified = new ArrayList<>();
        List<Log> renamed = new ArrayList<>();
        List<Log> security = new ArrayList<>();
        for (Client cli:clients){
            LogEvents logEvents = new LogEvents();
            logEvents.setClientIP(cli.getClientIP());
            created = logService.findLogByEvent(cli.getClientIP(),ENTRY_CREATE);
            deleted = logService.findLogByEvent(cli.getClientIP(),ENTRY_DELETE);
            modified = logService.findLogByEvent(cli.getClientIP(),ENTRY_MODIFY);
            renamed = logService.findLogByEvent(cli.getClientIP(),ENTRY_RENAME);
            security = logService.findLogByEvent(cli.getClientIP(),ENTRY_SECURITY);
            logEvents.setCreated(created.size());
            logEvents.setDeleted(deleted.size());
            logEvents.setModified(modified.size());
            logEvents.setRenamed(renamed.size());
            logEvents.setSecurity(security.size());
            logEventss.add(logEvents);
        }
        model.addAttribute("logEventss",logEventss);
        return "log";
    }
    @RequestMapping(value = "admin/full-logs-{clientIP}",method = RequestMethod.GET)
    public String viewClientLogs(ModelMap model, @PathVariable String clientIP){
        model.addAttribute("client",clientService.findByIP(clientIP));
        model.addAttribute("logs",logService.findLogsByIp(clientIP));
        return "home";
    }
    @RequestMapping(value = "admin",method = RequestMethod.GET)
    public String adminViewPage(){
        return "administration";
    }

}
