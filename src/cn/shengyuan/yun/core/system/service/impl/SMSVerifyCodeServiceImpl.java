package cn.shengyuan.yun.core.system.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shengyuan.basic.service.impl.BaseServiceImpl;
import cn.shengyuan.tools.util.DateUtil;
import cn.shengyuan.tools.util.RandomUtil;
import cn.shengyuan.tools.util.StringUtil;
import cn.shengyuan.yun.core.system.dao.SMSVerifyCodeDao;
import cn.shengyuan.yun.core.system.entity.SMSVerifyCode;
import cn.shengyuan.yun.core.system.entity.SMSVerifyCode.Type;
import cn.shengyuan.yun.core.system.service.SMSVerifyCodeService;

@Service("smsVerifyCodeServiceImpl")
public class SMSVerifyCodeServiceImpl extends BaseServiceImpl<SMSVerifyCode, Long> implements SMSVerifyCodeService {
	
	@Resource(name="smsVerifyCodeDaoImpl")
	private SMSVerifyCodeDao smsVerifyCodeDao;

	@Resource(name="smsVerifyCodeDaoImpl")
	public void setSmsVerifyCodeDao(SMSVerifyCodeDao smsVerifyCodeDao) {
		super.setDao(smsVerifyCodeDao);
	}

	@Override
	public String createSMSVerifyCode(String identific, Type type) {
		if (StringUtil.isBlank(identific) || type == null) {
			return "";
		}

		String randomNum = RandomUtil.randomNum(6);
		Date expire = DateUtil.addMinutes(new Date(), type.getExpire());

		SMSVerifyCode smsVerifyCode = null;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mobile", identific);
		paramMap.put("type", type.getCode());
		List<SMSVerifyCode> svcList = smsVerifyCodeDao.query(paramMap);

		if (svcList != null && svcList.size() > 0) {
			smsVerifyCode = svcList.get(0);
			if (isExpire(smsVerifyCode)) {
				Date date = new Date();
				smsVerifyCode.setModifyDate(date);
				smsVerifyCode.setExpireDate(expire);
				smsVerifyCode.setCode(randomNum);
				smsVerifyCodeDao.update(smsVerifyCode);
				return randomNum;
			} else {
				return smsVerifyCode.getCode();
			}
		} else {
			smsVerifyCode = new SMSVerifyCode();
			Date currentdate = new Date();
			smsVerifyCode.setCreateDate(currentdate);
			smsVerifyCode.setModifyDate(currentdate);
			smsVerifyCode.setExpireDate(expire);
			smsVerifyCode.setMobile(identific);
			smsVerifyCode.setCode(randomNum);
			smsVerifyCode.setType(type.getCode());
			smsVerifyCodeDao.save(smsVerifyCode);
			return randomNum;
		}
	}

	/**
	 * 判断验证码是否过期
	 * 
	 * @param smsVerifyCode
	 * @return
	 */
	private boolean isExpire(SMSVerifyCode smsVerifyCode) {
		if (smsVerifyCode == null || smsVerifyCode.getExpireDate() == null) {
			return true;
		}
		if (new Date().getTime() > smsVerifyCode.getExpireDate().getTime()) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkSMSVerifyCode(String identific, String code, Type type) {
		if (StringUtil.isBlank(identific) || StringUtil.isBlank(code) || type == null) {
			return false;
		}

		SMSVerifyCode smsVerifyCode = null;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mobile", identific);
		paramMap.put("code", code);
		paramMap.put("type", type.getCode());
		List<SMSVerifyCode> svcList = smsVerifyCodeDao.query(paramMap);
		if (svcList != null && svcList.size() > 0) {
			smsVerifyCode = svcList.get(0);
			if (isExpire(smsVerifyCode)) {
				return false;
			} else {
				return true;
			}
		} else {
			return false;
		}
	}

	@Override
	public SMSVerifyCode getSMSVerifyCode(String mobile, int type) {
		return smsVerifyCodeDao.getSMSVerifyCode(mobile,type);
	}
	
	public SMSVerifyCode getSMSVerifyCode(String identific, Type type) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mobile", identific);
		paramMap.put("type", type.getCode());
		List<SMSVerifyCode> svcList = smsVerifyCodeDao.query(paramMap);
		return svcList.size() > 0 ? svcList.get(0) : null;
	}

	@Override
	public boolean isExpire(String identific, Type type) {
		SMSVerifyCode smsVerifyCode = getSMSVerifyCode(identific, type);
		return isExpire(smsVerifyCode);
	}

}
