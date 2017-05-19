package cn.shengyuan.yun.core.system.dao;

import java.util.List;

import cn.shengyuan.basic.dao.base.BaseDao;
import cn.shengyuan.yun.core.system.entity.AdPosition;

public interface AdPositionDao extends BaseDao<AdPosition, Long> {
	
	/**
	 * 根据位置获取指定数量的广告位
	 * @param position  位置
	 * @param count  数量
	 * @return
	 */
	public List<AdPosition> findAdPositionList(Integer position, Integer count);

}
