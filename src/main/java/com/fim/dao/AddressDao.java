package com.fim.dao;

import com.fim.model.Address;

import java.util.List;

/**
 * Created by dorsa on 8/13/17.
 */
public interface AddressDao {
    void insertAddress (Address address);
    boolean isAddressExist(Address address);
    List<Address> findByClientIP(String clientIP);
    void deleteAddress(Address address);
    Address findById(int id);
}
