package com.fim.dao;

import com.fim.model.Log;

import java.util.List;

/**
 * Created by dorsa on 8/13/17.
 */
public interface LogDao {
    List<Log> findLogsByIp(String clientIp);
    List<Log> findLogByEvent(String clientIp, int eventN);
}
