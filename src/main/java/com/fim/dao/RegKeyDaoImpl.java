package com.fim.dao;


import com.fim.model.RegKey;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dorsa on 8/28/17.
 */
@Repository("regKeyDao")
public class RegKeyDaoImpl extends AbstractDao<Integer,RegKey> implements RegKeyDao {

    @Override
    public void insertRegKey(RegKey regKey) {
        persist(regKey);
    }

    @Override
    public boolean isRegKeyExist(RegKey regKey) {
        List<RegKey> regKeys = findByClientIP(regKey.getClientIP());
        for (RegKey re:regKeys){
            if(re.getRegKey().equals(regKey.getRegKey())){
                return true;
            }
        }
        return false;
    }

    @Override
    public List<RegKey> findByClientIP(String clientIP) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("clientIP",clientIP));
        List<RegKey> regKeys = (List<RegKey>) criteria.list();
        return regKeys;
    }

    @Override
    public void deleteRegKey(RegKey regKey) {
        delete(regKey);
    }

    @Override
    public RegKey findById(int id) {
        RegKey regKey = getByKey(id);
        return regKey;
    }
}
