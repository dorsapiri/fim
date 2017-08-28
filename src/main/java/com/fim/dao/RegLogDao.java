package com.fim.dao;

import com.fim.model.RegLog;

import java.util.List;

/**
 * Created by dorsa on 8/28/17.
 */
public interface RegLogDao {
    List<RegLog> findRegLogsByIp(String clientIp);
    List<RegLog> findRegLogByEvent(String clientIp, int eventN);
}
