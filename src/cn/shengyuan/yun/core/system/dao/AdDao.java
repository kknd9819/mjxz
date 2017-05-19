package cn.shengyuan.yun.core.system.dao;

import java.util.List;
import java.util.Map;

import cn.shengyuan.basic.dao.base.BaseDao;
import cn.shengyuan.basic.model.Page;
import cn.shengyuan.yun.core.system.entity.Ad;

public interface AdDao extends BaseDao<Ad, Long> {

	/**
	 * 根据广告位code集合查询所有未过期的广告
	 * @param adPositionIds 广告位ID list
	 * @return List<Ad> 广告列表
	 */
	public List<Ad> findAdByAdPositionIds(List<Long> adPositionIds);
	
	/**
	 * 根据广告位code查询广告
	 * @param code 广告位编码
	 * @return
	 */
	public List<Ad> findAdByCode(String code);
	
	public Page<Ad> findPage(int pageSize, int pageNumber, Map<String, Object> paramMap);
}
