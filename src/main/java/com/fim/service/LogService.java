package com.fim.service;

import com.fim.model.Log;

import java.util.List;

/**
 * Created by dorsa on 8/13/17.
 */
public interface LogService {
    List<Log> findLogsByIp(String clientIp);
    List<Log> findLogByEvent(String clientIp, int eventN);

}
