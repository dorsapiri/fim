package com.fim.dao;

import com.fim.model.Client;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 7/26/17.
 */
@Repository("clientDao")
public class ClientDaoImpl extends AbstractDao<Integer,Client> implements ClientDao {
    @Override
    public void insertClient(Client newClient) {
        persist(newClient);
    }

    @Override
    public void deleteClient(Client client) {
        delete(client);
    }

    @Override
    public List<Client> allClient() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("state"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        List<Client> clients = criteria.list();
        return clients;
    }
}
