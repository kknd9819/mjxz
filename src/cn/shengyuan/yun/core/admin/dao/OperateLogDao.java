package cn.shengyuan.yun.core.admin.dao;

import cn.shengyuan.yun.core.admin.entity.OperateLog;


public interface OperateLogDao {
	
	/**保存操作日志*/
	public void saveOperateLog(OperateLog log);

}
