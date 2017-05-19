package cn.shengyuan.yun.core.system.entity;

import java.io.Serializable;
import java.util.Date;

import cn.shengyuan.basic.dao.annotation.Entity;
import cn.shengyuan.basic.dao.annotation.Id;

@Entity(name = "yun_sn")
public class Sn implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7590015642409562653L;

	@Id
	private Long id;
	private Date createDate;
	private Date modifyDate;

	/** 类型 */
	private int type;

	/** 末值 */
	private Long lastValue;

	/**
	 * 类型
	 */
	public enum Type {

		/** 充值订单SN */
		recharge(0, "充值订单SN"),

		/** 交易订单SN */
		trade(1, "交易订单SN"),

		/** 付款单SN */
		payment(2, "付款单SN"),

		/** 退款单SN */
		refunds(3, "退款单SN"),

		/** 转账支付流水SN */
		transfer(4, "转账支付流水SN"),

		/** 薪资支付流水SN */
		salary(5, "薪资支付流水SN"),
		
		/** 提款申请流水SN */
		withdrawal(6, "提款申请流水SN");

		private Type(int code, String name) {
			this.code = code;
			this.TypeName = name;
		}

		private int code;
		private String TypeName;

		public int getCode() {
			return code;
		}

		public String getTypeName() {
			return TypeName;
		}

		public static String value(int code) {
			for (Type t : Type.values()) {
				if (t.getCode() == code) {
					return t.getTypeName();
				}
			}
			return null;
		}
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * 获取类型
	 * 
	 * @return 类型
	 */
	public int getType() {
		return type;
	}

	/**
	 * 设置类型
	 * 
	 * @param type 类型
	 */
	public void setType(int type) {
		this.type = type;
	}

	/**
	 * 获取末值
	 * 
	 * @return 末值
	 */
	public Long getLastValue() {
		return lastValue;
	}

	/**
	 * 设置末值
	 * 
	 * @param lastValue 末值
	 */
	public void setLastValue(Long lastValue) {
		this.lastValue = lastValue;
	}
}
