package cn.shengyuan.yun.remote.trade;

import java.util.Map;

import cn.shengyuan.basic.model.Message;

/**
 * 理财提现处理接口
 * 
 * @author johney
 *
 */
public interface FinanceRemote {
	/** 用户ID */
	public static final String MEMBER_ID = "memberId";
	/** 资产编码 */
	public static final String ASSET_NO = "assetNo";
	/** 提现金额 */
	public static final String DRAW_CASH_AMOUNT = "drawCashAmount";
	/** 支付密码 */
	public static final String PAY_PASSWORD = "payPassword";
	/** 提现方式 */
	public static final String WITH_TYPE = "withType";
	/** 提款申请ID */
	public static final String DRAW_PLAN_ID = "drawPlanId";
	/** 提现串号(用于财务扫描兑现) */
	public static final String SERIAL_NUMBER = "serialNumber";
	/** 转账申请码(用于财务转账后通过该码修改状态) */
	public static final String DRAW_PLAN_SN = "drawPlanSn";
	/** 转账处理结果 */
	public static final String TRANSFER_RESULT = "transferResult";
	/** 转账流水号 */
	public static final String TRANSFER_SERIAL = "transferSerial";
	/** 操作人员ID */
	public static final String OPERATOR_NAME = "operator";
	/** 申请描述 */
	public static final String AUDIT_DESC = "auditdesc";

	/**
	 * 理财账户提现申请
	 * 
	 * @param params <br/>
	 *            *用户ID FinanceRemote.MEMBER_ID(Long) <br/>
	 *            *资产编码 FinanceRemote.ASSET_NO(String) <br/>
	 *            *提现金额 FinanceRemote.DRAW_CASH_AMOUNT(Double) <br/>
	 *            *支付密码 FinanceRemote.PAY_PASSWORD(String) <br/>
	 *            *提现方式 FinanceRemote.WITH_TYPE(Integer)(0：柜台提现、1：银行转账)
	 * 
	 * @return Message 不同的提现方式返回的数据不同 <br/>
	 *         FinanceRemote.SERIAL_NUMBER String 提现串号(财务提现) <br/>
	 *         FinanceRemote.DRAW_PLAN_SN String 转账申请号(银行转账)
	 * 
	 * @throws Exception
	 */
	public Message drawCashPlan(Map<String, Object> params) throws Exception;

	/**
	 * 理财账户银行转账操作结果处理
	 * 
	 * @param params <br/>
	 *            *提款申请ID FinanceRemote.DRAW_PLAN_ID(Long) <br/>
	 *            *处理结果 FinanceRemote.TRANSFER_RESULT(Integer)(0：转账失败、1：转账成功) <br/>
	 *            转账流水号 FinanceRemote.TRANSFER_SERIAL(String)(成功才有数据) <br/>
	 *            *操作人员 FinanceRemote.OPERATOR_NAME(String) <br/>
	 *            审核描述 FinanceRemote.AUDIT_DESC(String)
	 * @return Message
	 * 
	 * @throws Exception
	 */
	public Message dealTransferPlan(Map<String, Object> params) throws Exception;

	/**
	 * 理财账户提现兑现
	 * 
	 * @param params <br/>
	 *            *提现串号 FinanceRemote.SERIAL_NUMBER(String) <br/>
	 *            *操作人员 FinanceRemote.OPERATOR_NAME(String)
	 * 
	 * @return Message
	 * 
	 * @throws Exception
	 */
	public Message drawCashCheck(Map<String, Object> params) throws Exception;

	/**
	 * 根据提现串号获取提款信息
	 * 
	 * @param params <br/>
	 *            *提现串号 FinanceRemote.SERIAL_NUMBER(String)
	 * @return Message <br/>
	 *         FinanceRemote.MEMBER_ID Long 会员ID <br/>
	 *         FinanceRemote.ASSET_NO String 卡号 <br/>
	 *         FinanceRemote.DRAW_CASH_AMOUNT Double 金额
	 * @throws Exception
	 */
	public Message getDrawCashPlan(Map<String, Object> params) throws Exception;
}
