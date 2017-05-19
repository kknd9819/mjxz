package cn.shengyuan.yun.core.system.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.basic.model.Page;
import cn.shengyuan.tools.util.StringUtil;
import cn.shengyuan.yun.core.system.dao.AdDao;
import cn.shengyuan.yun.core.system.entity.Ad;

@Repository("adDaoImpl")
public class AdDaoImpl extends BaseDaoImpl<Ad, Long> implements AdDao {

	public Page<Ad> findPage(int pageSize,int pageNumber,Map<String, Object> paramMap){
		StringBuilder sqlQuery = new StringBuilder("select a.*,ap.name adPositionName from yun_ad a left join yun_ad_position ap on a.ad_position = ap.id where 1=1 ");
		Map<String, Object> params = new HashMap<String, Object>();
		if (MapUtils.getInteger(paramMap, "isPublic") != null) {
			sqlQuery.append(" and a.is_public = :isPublic ");
			params.put("isPublic", MapUtils.getLong(paramMap, "isPublic"));
		}
		if (MapUtils.getLong(paramMap, "adPositionId") != null ) {
			sqlQuery.append(" and a.ad_position = :adPositionId ");
			params.put("adPositionId", MapUtils.getLong(paramMap, "adPositionId"));
		}
		if (!StringUtil.isEmpty(MapUtils.getString(paramMap, "title"))) {
			sqlQuery.append(" and a.title like :title ");
			params.put("title", "%" + MapUtils.getString(paramMap, "title") + "%");
		}
		if (!StringUtil.isEmpty(MapUtils.getString(paramMap, "name"))) {
			sqlQuery.append(" and ap.name like :name ");
			params.put("name", "%" + MapUtils.getString(paramMap, "name") + "%");
		}
		String sqlCount = "select count(*) from (" + sqlQuery.toString() + ") t___";
		
		if (StringUtil.isNotEmpty(MapUtils.getString(paramMap, "orderProperty"))) {
			sqlQuery.append(" order by " + MapUtils.getString(paramMap, "orderProperty") + " " + MapUtils.getString(paramMap, "orderDirection"));
		}
		return super.queryForPage(sqlQuery.toString(), sqlCount, pageSize, pageNumber, params);
	}
	
	@Override
	public List<Ad> findAdByAdPositionIds(List<Long> adPositionIds) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sqlQuery = new StringBuilder("select * from yun_ad ");
		 
		StringBuilder whereQuery =new StringBuilder(" where end_date >=:date and begin_date <=:date ");
		params.put("date", new Date());
		if (adPositionIds != null && adPositionIds.size() > 0) {
			whereQuery.append(" and ad_position in (:adPositionIds)");
			params.put("adPositionIds", adPositionIds);
		}
		whereQuery.append(" order by orders asc ");
		sqlQuery.append(whereQuery);
		return super.query(sqlQuery.toString(), params);
	}

	@Override
	public List<Ad> findAdByCode(String code) {
		if (StringUtil.isEmpty(code)) {
			return null;
		}
		StringBuilder sqlQuery = new StringBuilder("select * from yun_ad where ad_position_code=:code");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("code", code);
		return query(sqlQuery.toString(), params);
	}

	
}
