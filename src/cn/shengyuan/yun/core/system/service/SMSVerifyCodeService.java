package cn.shengyuan.yun.core.system.service;

import cn.shengyuan.basic.service.BaseService;
import cn.shengyuan.yun.core.system.entity.SMSVerifyCode;
import cn.shengyuan.yun.core.system.entity.SMSVerifyCode.Type;

public interface SMSVerifyCodeService extends BaseService<SMSVerifyCode, Long> {
	/**
	 * 生成验证码：
	 * 
	 * @param identific
	 *            识别串号(手机号、邮箱地址、微信号等等)
	 * @param type
	 *            业务类型
	 * @return
	 */
	String createSMSVerifyCode(String identific, Type type);

	/**
	 * 校验验证码
	 * 
	 * @param identific
	 *            识别串号(手机号、邮箱地址、微信号等等)
	 * @param code
	 *            待验证的码
	 * @param type
	 *            业务类型
	 * @return
	 */
	boolean checkSMSVerifyCode(String identific, String code, Type type);

	/**
	 * 获取短信验证码对象
	 * @param mobile
	 * @param type
	 * @return
	 */
	SMSVerifyCode getSMSVerifyCode(String mobile, int type);
	
	/**
	 * 根据串号及验证类型获取验证码对象
	 * 
	 * @param identific
	 * @param type
	 * @return
	 */
	SMSVerifyCode getSMSVerifyCode(String identific, Type type);

	/**
	 * 判断串号及验证类型的验证码是否过期
	 * 
	 * @param identific
	 * @param type
	 * @return
	 */
	boolean isExpire(String identific, Type type);

}
