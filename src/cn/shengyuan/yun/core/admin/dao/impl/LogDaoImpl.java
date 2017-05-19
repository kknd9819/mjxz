package cn.shengyuan.yun.core.admin.dao.impl;


import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.yun.core.admin.dao.LogDao;
import cn.shengyuan.yun.core.admin.entity.Log;

/**
 * 日志持久层实现
 * @Date 2014-12-29
 * @author 欧志辉
 * @version 1.0
 */
@Repository("logDaoImpl")
public class LogDaoImpl extends BaseDaoImpl<Log, Long> implements LogDao {

	public void removeAll() {
		String sql = "delete from xx_log";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		super.delete(sql, paramMap);
	}

}