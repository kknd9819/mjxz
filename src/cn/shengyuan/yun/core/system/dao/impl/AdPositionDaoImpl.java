package cn.shengyuan.yun.core.system.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.yun.core.system.dao.AdPositionDao;
import cn.shengyuan.yun.core.system.entity.AdPosition;

@Repository("adPositionDaoImpl")
public class AdPositionDaoImpl extends BaseDaoImpl<AdPosition, Long> implements AdPositionDao {

	@Override
	public List<AdPosition> findAdPositionList(Integer position, Integer count) {
		StringBuilder sqlQuery = new StringBuilder("select ap.* from yun_ad_position ap where 1=1 ");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(position != null && position >= 0){
			sqlQuery.append(" AND ap.position = :position ");
			paramMap.put("position", position);
		}
		if(count != null && count > 0){
			sqlQuery.append(" LIMIT 0,").append(count);
		}
		return super.query(sqlQuery.toString(), paramMap);
	}



}
