package cn.shengyuan.yun.core.system.dao;

import cn.shengyuan.basic.dao.base.BaseDao;
import cn.shengyuan.yun.core.system.entity.SMSVerifyCode;

public interface SMSVerifyCodeDao extends BaseDao<SMSVerifyCode, Long> {

	public SMSVerifyCode getSMSVerifyCode(String mobile, int type);

	int updateOverdueDate(Long id);

	
	
}
