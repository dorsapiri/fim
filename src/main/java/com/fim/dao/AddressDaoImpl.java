package com.fim.dao;

import com.fim.model.Address;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 8/13/17.
 */
@Repository("addressDao")
public class AddressDaoImpl extends AbstractDao<Integer,Address> implements AddressDao {
    @Override
    public void insertAddress(Address address) {
        persist(address);
    }

    @Override
    public boolean isAddressExist(Address address) {
        List<Address> addresses = findByClientIP(address.getClientIP());
        for (Address ad:addresses){
            if(ad.getAddress().equals(address.getAddress())){
                return true;
            }
        }
        return false;
    }

    @Override
    public List<Address> findByClientIP(String clientIP) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("clientIP",clientIP));
        List<Address> addresses = (List<Address>) criteria.list();
        return addresses;
    }

    @Override
    public void deleteAddress(Address address) {
        delete(address);
    }

    @Override
    public Address findById(int id) {
        Address address = getByKey(id);
        return address;
    }
}
