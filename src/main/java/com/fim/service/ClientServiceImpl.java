package com.fim.service;

import com.fim.dao.ClientDao;
import com.fim.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 7/26/17.
 */
@Service("clientService")
@Transactional
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientDao clientDao;
    @Override
    public void insertClient(Client newClient) {
        clientDao.insertClient(newClient);
    }

    @Override
    public void deleteClient(Client client) {
        clientDao.deleteClient(client);
    }

    @Override
    public void updateClient(Client preClient) {
        Client entity = clientDao.findByIP(preClient.getClientIP());
        if (entity!=null){
            entity.setState(preClient.getState());
        }
    }

    @Override
    public List<Client> allClients() {
        return clientDao.allClient();
    }

    @Override
    public Client findByIP(String IP) {
        return clientDao.findByIP(IP);
    }

    @Override
    public Client findByState(int state) {
        return clientDao.findByState(state);
    }
}
