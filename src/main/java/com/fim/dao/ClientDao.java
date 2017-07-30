package com.fim.dao;

import com.fim.model.Client;

import java.util.List;

/**
 * Created by dorsa on 7/26/17.
 */
public interface ClientDao {
    void insertClient(Client newClient);
    void deleteClient(Client client);
    List<Client> allClient();
}
