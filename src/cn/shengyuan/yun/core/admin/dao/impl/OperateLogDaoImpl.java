/**
 * 
 */
package cn.shengyuan.yun.core.admin.dao.impl;


import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.yun.core.admin.dao.OperateLogDao;
import cn.shengyuan.yun.core.admin.entity.OperateLog;


/**
 * @author Administrator
 *
 */
@Repository("operateLogDaoImpl")
public class OperateLogDaoImpl extends BaseDaoImpl<OperateLog, Long> implements OperateLogDao{
	
	@Override
	public void saveOperateLog(OperateLog log) {
//		String sql = "INSERT INTO xx_operate_log(create_date,modify_date, content, ip,operation,operator)"
//				+"VALUES (:create_date,:modify_date,:content,:ip,:operation,:operator)";
//		Map param = new HashMap();
//		param.put("create_date",log.getCreateDate());
//		param.put("modify_date",log.getModifyDate());
//		param.put("content",log.getContent());
//		param.put("ip",log.getIp());
//		param.put("operation",log.getOperation());
//		param.put("operator",log.getOperator());
		super.save(log);
	}

}
