package com.fim.service;

import com.fim.dao.LogDao;
import com.fim.model.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 8/13/17.
 */@Service("logService")
@Transactional
public class LogServiceImpl implements LogService{
    @Autowired
    LogDao logDao;
    @Override
    public List<Log> findLogsByIp(String clientIp) {
        return logDao.findLogsByIp(clientIp);
    }

    @Override
    public List<Log> findLogByEvent(String clientIp, int eventN) {
        return logDao.findLogByEvent(clientIp,eventN);
    }
}
