package cn.shengyuan.yun.core.system.entity;

import java.io.Serializable;
import java.util.Date;

import cn.shengyuan.basic.dao.annotation.Entity;
import cn.shengyuan.basic.dao.annotation.Id;

@Entity(name = "yun_sms_verify_code")
public class SMSVerifyCode implements Serializable {
	private static final long serialVersionUID = -4777796579048469069L;

	public enum Type {
		REGISTER(0, 2, "会员注册"), LOGIN(1, 2, "会员登录"), LOGINPWD(2, 2, "修改登录密码"), PAYPWD(3, 2, "修改支付密码"), MOBILE(4, 2, "手机号码变更"), BINDCARD(5, 2, "绑定一卡通");
		// 编号
		private int code;
		// 过期时长(分钟)
		private int expire;
		// 描述
		private String desc;

		private Type(int code, int expire, String desc) {
			this.code = code;
			this.expire = expire;
			this.desc = desc;
		}

		public int getCode() {
			return code;
		}

		public int getExpire() {
			return expire;
		}

		public String getDesc() {
			return desc;
		}

		public static Type getTypeByCode(int code) {
			for (Type t : Type.values()) {
				if (t.getCode() == code) {
					return t;
				}
			}
			return null;
		}
	}

	@Id
	private Long id;
	// 创建时间
	private Date createDate;
	// 修改时间
	private Date modifyDate;
	// 过期时间
	private Date expireDate;
	// 验证码
	private String code;
	// 手机号码
	private String mobile;
	// 验证类别
	private int type;

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

	public Date getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}
