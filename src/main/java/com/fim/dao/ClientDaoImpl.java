package com.fim.dao;

import com.fim.model.Client;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
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
        Criteria criteria = createEntityCriteria();
//        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);\
        criteria.add(Restrictions.not(Restrictions.eq("isRemoveClient",true)));
        List<Client> clients = criteria.list();
        return clients;
    }

    @Override
    public Client findByState(int state) {
        return getByKey(state);
    }

    @Override
    public Client findByIP(String IP) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("clientIP",IP));
        Client client=(Client) criteria.uniqueResult();
        return client;
    }
}
