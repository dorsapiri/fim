package com.fim.dao;

import com.fim.model.RegLog;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 8/28/17.
 */
@Repository("regLogDao")
public class RegLogDaoImpl extends AbstractDao<Integer,RegLog> implements RegLogDao {
    @Override
    public List<RegLog> findRegLogsByIp(String clientIp) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("clientIP",clientIp));
        List<RegLog> regLogs = criteria.list();
        return regLogs;
    }

    @Override
    public List<RegLog> findRegLogByEvent(String clientIp, int eventN) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("clientIP",clientIp)).add(Restrictions.eq("event",eventN));
        List<RegLog> regLogs = criteria.list();
        return regLogs;
    }
}
