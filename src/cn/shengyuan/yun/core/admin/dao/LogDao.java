package cn.shengyuan.yun.core.admin.dao;

import cn.shengyuan.basic.dao.base.BaseDao;
import cn.shengyuan.yun.core.admin.entity.Log;

/**
 * 日志持久层接口
 * @Date 2014-12-29
 * @author 欧志辉
 * @version 1.0
 */
public interface LogDao extends BaseDao<Log, Long> {

	/**
	 * 删除所有日志
	 */
	public void removeAll();
	
}