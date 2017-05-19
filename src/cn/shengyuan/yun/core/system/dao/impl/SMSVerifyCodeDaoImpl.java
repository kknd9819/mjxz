package cn.shengyuan.yun.core.system.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.yun.core.system.dao.SMSVerifyCodeDao;
import cn.shengyuan.yun.core.system.entity.SMSVerifyCode;


@Repository("smsVerifyCodeDaoImpl")
public class SMSVerifyCodeDaoImpl extends BaseDaoImpl<SMSVerifyCode, Long> implements SMSVerifyCodeDao{
	private static final String QUERY = "SELECT id,create_date,modify_date,expire_date,code,mobile,type FROM yun_sms_verify_code ";
	@Override
	public SMSVerifyCode getSMSVerifyCode(String mobile, int type) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mobile", mobile);
	    paramMap.put("type", type);
	        
		StringBuilder sql = new StringBuilder(100);
		sql.append(QUERY);
        sql.append(" WHERE mobile=:mobile and type=:type");
       
        List<SMSVerifyCode> list =  query(sql.toString(), paramMap);

        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
	}
	


	@Override
	public int updateOverdueDate(Long id) {
		String sql = "UPDATE yun_sms_verify_code SET overdue_date = :overdueDate,modify_date = :modifyDate WHERE id = :id";
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("overdueDate", null);
		paramMap.put("modifyDate", new Date());
		paramMap.put("id", id);
		return super.update(sql, paramMap);
	}

}
