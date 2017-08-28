package com.fim.service;

import com.fim.dao.RegLogDao;
import com.fim.model.RegLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dorsa on 8/28/17.
 */
@Service("regLogService")
@Transactional
public class RegLogServiceImpl implements RegLogService {

    @Autowired
    RegLogDao regLogDao;

    @Override
    public List<RegLog> findRegLogsByIp(String clientIp) {
        return regLogDao.findRegLogsByIp(clientIp);
    }

    @Override
    public List<RegLog> findRegLogByEvent(String clientIp, int eventN) {
        return regLogDao.findRegLogByEvent(clientIp,eventN);
    }
}
