package com.fim.dao;

import com.fim.model.Log;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 8/13/17.
 */
@Repository("logDao")
public class LogDaoImpl extends AbstractDao<Integer,Log> implements LogDao{

    @Override
    public List<Log> findLogsByIp(String clientIp) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("clientIP",clientIp));
        List<Log> logs = criteria.list();
        return logs;
    }

    @Override
    public List<Log> findLogByEvent(String clientIp, int eventN) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("clientIP",clientIp)).add(Restrictions.eq("event",eventN));
        List<Log> logs = criteria.list();
        return logs;
    }
}
