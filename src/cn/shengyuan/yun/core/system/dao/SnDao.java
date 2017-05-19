package cn.shengyuan.yun.core.system.dao;

import cn.shengyuan.basic.dao.base.BaseDao;
import cn.shengyuan.yun.core.system.entity.Sn;
import cn.shengyuan.yun.core.system.entity.Sn.Type;

public interface SnDao extends BaseDao<Sn, Long> {
	/**
	 * 生成序列号
	 * 
	 * @param type 类型
	 * @return 序列号
	 */
	String generate(Type type);
}
