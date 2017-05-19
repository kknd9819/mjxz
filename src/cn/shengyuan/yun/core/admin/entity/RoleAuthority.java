package cn.shengyuan.yun.core.admin.entity;

import java.io.Serializable;

import cn.shengyuan.basic.dao.annotation.Entity;
/**
 * 角色权限关联实体
 * @Date 2015-01-02
 * @author 欧志辉
 * @version 1.0
 */
@Entity(name = "xx_role_authority")
public class RoleAuthority implements Serializable {
	
	private static final long serialVersionUID = -4581145189896753889L;
	
	/** 角色ID */
	private Long roleId;
	
	/** 权限值 */
	private String authority;
	
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

	/**
	 * @return 权限值
	 */
	public String getAuthority() {
		return authority;
	}

	/**
	 * @param authority 权限值
	 */
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
}