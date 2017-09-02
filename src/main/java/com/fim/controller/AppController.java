package com.fim.controller;

import com.fim.model.*;
import com.fim.service.*;
//import javafx.util.Pair;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by dorsa on 7/10/17.
 */
@Controller
@SessionAttributes("roles")
public class AppController {

//  event string file monitor
    public static final int ENTRY_CREATE=1;
    public static final int ENTRY_DELETE=2;
    public static final int ENTRY_MODIFY=3;
    public static final int ENTRY_RENAME=4;
    public static final int ENTRY_SECURITY=5;

//    events string log monitor
    public static final int VALUE_CREATE = 1;
    public static final int VALUE_DELETE = 2;
    public static final int VALUE_MODIFY = 3;

    @Autowired
    private ClientService clientService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private RegKeyService regKeyService;

    @Autowired
    private LogService logService;

    @Autowired
    private RegLogService regLogService;

    /*@Autowired
    AuthenticationTrustResolver authenticationTrustResolver;*/

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
        return "/login";
        /*if (isCurrentAuthenticationAnonymous()) {
            return "/login";
        } else {
            return "redirect:admin";
        }*/
    }
    /*@RequestMapping(value = "login",method = RequestMethod.POST)
    public String afterLogin(){
        User user =userService.findBySSO(getPrincipal());
        if(user.getUserProfiles().contains("ADMIN")){
            return "redirect:/admin/";
        }
        return "redirect:/";
    }*/
    /**
     * This method handles logout requests.
     * Toggle the handlers if you are RememberMe functionality is useless in your app.
     */
    @RequestMapping(value="logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
//            new SecurityContextLogoutHandler().logout(request, response, auth);
            persistentTokenBasedRememberMeServices.logout(request, response, auth);
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect: login?logout";
    }
    /**
     * This method returns true if users is already authenticated [logged-in], else false.
     */
    /*private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }*/

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


        return "my_home";
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
        if (preClient!=null && !preClient.isRemoveClient()){
            System.out.println("This client exsist");
            return "add-client";
        }
        if (preClient!=null && preClient.isRemoveClient()){
            System.out.println("Changes didn't commit yet.");
            return "add-client";
        }
        client.setNewClient(true);
        client.setRemoveClient(false);
        client.setAddressChange(false);
        client.setRegKeyChange(false);
        clientService.insertClient(client);
        return "redirect:/admin/";
    }

    @RequestMapping(value = "admin/remove-client-{clientIP}", method = RequestMethod.GET)
    public String removeClient(@PathVariable String clientIP){
        Client removedClient = clientService.findByIP(clientIP);
        removedClient.setRemoveClient(true);
        clientService.updateClient(removedClient);
//        clientService.deleteClient();
        return "redirect:/admin/clients?item=0";
    }
    @RequestMapping(value = "admin/add-address-client-{clientIP}",method = RequestMethod.GET)
    public String getAddresses(@PathVariable String clientIP, ModelMap model){
        Client client = clientService.findByIP(clientIP);
        model.addAttribute("client",client);
        Address address = new Address();
        model.addAttribute("address",address);

        model.addAttribute("clientAddresses",addressService.findByClientIP(clientIP));
        return "client-profile";
    }
    @RequestMapping(value = "admin/add-address-client-{clientIP}",method = RequestMethod.POST)
    public String addAddress(@Valid Address address,BindingResult result,ModelMap model){

        Client client = clientService.findByIP(address.getClientIP());
        if (result.hasErrors()){
            return "redirect:/admin/add-address-client-"+client.getClientIP();
        }
        model.addAttribute("address",address);

        if (addressService.isAddressExist(address)){
            model.addAttribute("alert",true);
            return "client-profile";
        }
        client.setAddressChange(true);
        clientService.updateClient(client);

        addressService.insertAddress(address);
        return "redirect:/admin/add-address-client-"+client.getClientIP();
    }
    @RequestMapping(value = "admin/remove-address-{addressId}",method = RequestMethod.GET)
    public String removeAddress(@PathVariable int addressId, ModelMap model){

        Client client = clientService.findByIP(addressService.findById(addressId).getClientIP());
        client.setAddressChange(true);
        clientService.updateClient(client);

        addressService.deleteAddress(addressService.findById(addressId));
        return "redirect:/admin/add-address-client-"+client.getClientIP();
    }

    @RequestMapping(value = "admin/add-registry-key-client-{clientIP}",method = RequestMethod.GET)
    public String newRegistryKey(@PathVariable String clientIP, ModelMap model){
        Client client = clientService.findByIP(clientIP);
        model.addAttribute("client",client);
        RegKey regKey = new RegKey();
        model.addAttribute("regKey",regKey);

        model.addAttribute("clientRegKeys",regKeyService.findByClientIP(clientIP));
        return "regkey";
    }

    @RequestMapping(value = "admin/add-registry-key-client-{clientIP}",method = RequestMethod.POST)
    public String addRegistryKey(@Valid RegKey regKey,BindingResult result,ModelMap model){
        Client client = clientService.findByIP(regKey.getClientIP());
        if (result.hasErrors()){
            return "redirect:/admin/add-registry-key-client-"+client.getClientIP();
        }
        model.addAttribute("regKey",regKey);
        if (regKeyService.isRegKeyExist(regKey)){
            model.addAttribute("alert",true);
            return "client-profile";
        }

        if (result.hasErrors()){
            return "redirect:/admin/add-registry-key-client-"+client.getClientIP();
        }
        client.setRegKeyChange(true);
        clientService.updateClient(client);
        regKeyService.insertRegKey(regKey);
        return "redirect:/admin/add-registry-key-client-"+client.getClientIP();
    }

    @RequestMapping(value = "admin/remove-regkey-{regkeyId}", method = RequestMethod.GET)
    public String removeRegkey(@PathVariable int regkeyId, ModelMap model){
        Client client = clientService.findByIP(regKeyService.findById(regkeyId).getClientIP());

        client.setAddressChange(true);
        clientService.updateClient(client);

        regKeyService.deleteRegKey(regKeyService.findById(regkeyId));
        return "redirect:/admin/add-registry-key-client-"+client.getClientIP();
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
        List<Log> logs = logService.findLogsByIp(clientIP);
        for (Log l: logs){
            switch (l.getEvent()){
                case ENTRY_CREATE:
                    l.setEventStatus("ENTRY_CREATE");
                    break;
                case ENTRY_DELETE:
                    l.setEventStatus("ENTRY_DELETE");
                    break;
                case ENTRY_MODIFY:
                    l.setEventStatus("ENTRY_MODIFY");
                    break;
                case ENTRY_RENAME:
                    l.setEventStatus("ENTRY_RENAME");
                    break;
                case ENTRY_SECURITY:
                    l.setEventStatus("ENTRY_SECURITY");
                    break;
            }

            l.setDateD(new Date(l.getLogDate()));
        }
        model.addAttribute("logs",logs);
        return "full-logs";
    }
    @RequestMapping(value = "admin",method = RequestMethod.GET)
    public String adminViewPage(){
        return "administration";
    }


    @RequestMapping(value = "admin/view-reglogs-{clientIP}", method = RequestMethod.GET)
    public String viewRegKeyLogs(ModelMap model,@PathVariable String clientIP){
        model.addAttribute("client",clientService.findByIP(clientIP));
        List<RegLog> regLogs = regLogService.findRegLogsByIp(clientIP);
        for (RegLog rl:regLogs){
            switch (rl.getEvent()){
                case VALUE_CREATE:
                    rl.setEventStatus("VALUE_CREATE");
                    break;
                case VALUE_DELETE:
                    rl.setEventStatus("VALUE_DELETE");
                    break;
                case VALUE_MODIFY:
                    rl.setEventStatus("VALUE_MODIFY");
                    break;
            }

            rl.setDateD(new Date(rl.getDate()));
        }
        model.addAttribute("regLogs",regLogs);
        return "reglogs";
    }

    @RequestMapping(value = "admin/change-password" , method = RequestMethod.GET)
    public String viewChangePassword( ModelMap model){
        User adminUser = userService.findBySSO("admin");
        model.addAttribute("adminuser",adminUser);
        return "change-pass";
    }
    @RequestMapping(value = "admin/change-password" , method = RequestMethod.POST)
    public String changePassword(@Valid User adminuser, BindingResult result){
        User admin = userService.findBySSO("admin");
        adminuser.setSsoId(admin.getSsoId());
        adminuser.setUserProfiles(admin.getUserProfiles());
        adminuser.setCreateDate(admin.getCreateDate());
        if(result.hasErrors()){
            return "change-pass";
        }
        userService.updateUser(adminuser);
        return "redirect:/admin";
    }

}
