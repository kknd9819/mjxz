package cn.shengyuan.yun.core.admin.entity;

import java.io.Serializable;

import cn.shengyuan.basic.dao.annotation.Entity;
/**
 * 后台管理员角色管理关系
 * @Date 2015-01-02
 * @author 欧志辉
 * @version 1.0
 */
@Entity(name = "xx_admin_role")
public class AdminRole implements Serializable {
	
	private static final long serialVersionUID = 1773924760040204142L;
	
	/** 管理员ID */
	private Long adminId;

	/** 角色ID */
	private Long roleId;

	/**
	 * @return adminId 后台管理员ID
	 */
	public Long getAdminId() {
		return adminId;
	}

	/**
	 * @param 后台管理员ID
	 */
	public void setAdminId(Long adminId) {
		this.adminId = adminId;
	}

	/**
	 * @return roleId 角色ID
	 */
	public Long getRoleId() {
		return roleId;
	}

	/**
	 * @param 角色ID
	 */
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	

}