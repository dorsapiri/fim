package com.fim.service;

import com.fim.model.RegKey;

import java.util.List;

/**
 * Created by dorsa on 8/28/17.
 */
public interface RegKeyService {
    void insertRegKey (RegKey regKey);
    boolean isRegKeyExist(RegKey regKey);
    List<RegKey> findByClientIP(String clientIP);
    void deleteRegKey(RegKey regKey);
    RegKey findById(int id);
}
