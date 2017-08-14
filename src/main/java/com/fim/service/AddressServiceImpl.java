package com.fim.service;

import com.fim.dao.AddressDao;
import com.fim.model.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 8/13/17.
 */
@Service("addressService")
@Transactional
public class AddressServiceImpl implements AddressService {
    @Autowired
    AddressDao addressDao;
    @Override
    public void insertAddress(Address address) {
        addressDao.insertAddress(address);
    }

    @Override
    public boolean isAddressExist(Address address) {
        return addressDao.isAddressExist(address);
    }

    @Override
    public List<Address> findByClientIP(String clientIP) {
        return addressDao.findByClientIP(clientIP);
    }

    @Override
    public void deleteAddress(Address address) {
        addressDao.deleteAddress(address);
    }

    @Override
    public Address findById(int id) {
        return addressDao.findById(id);
    }
}
