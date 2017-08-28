package com.fim.service;

import com.fim.dao.RegKeyDao;
import com.fim.model.RegKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 8/28/17.
 */
@Service("regKeyService")
@Transactional
public class RegKeyServiceImpl implements RegKeyService {

    @Autowired
    RegKeyDao regKeyDao;

    @Override
    public void insertRegKey(RegKey regKey) {
        regKeyDao.insertRegKey(regKey);
    }

    @Override
    public boolean isRegKeyExist(RegKey regKey) {
        return regKeyDao.isRegKeyExist(regKey);
    }

    @Override
    public List<RegKey> findByClientIP(String clientIP) {
        return regKeyDao.findByClientIP(clientIP);
    }

    @Override
    public void deleteRegKey(RegKey regKey) {
        regKeyDao.deleteRegKey(regKey);
    }

    @Override
    public RegKey findById(int id) {
        return regKeyDao.findById(id);
    }
}
