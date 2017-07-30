package com.fim.service;

import com.fim.model.Client;

import java.util.List;

/**
 * Created by dorsa on 7/26/17.
 */
public interface ClientService {
    void insertClient(Client newClient);
    void deleteClient(Client client);
    Client updateClient(Client preClient);
    List<Client> allClients();
    Client findByIP(String IP);
    Client findByState(int state);
}
