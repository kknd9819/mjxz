package cn.shengyuan.yun.core.admin.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 菜单菜单权限关联关系
 * @Date 2015-1-9
 * @author 欧志辉
 * @version 1.0
 */
public class MenuMenuValue implements Serializable {
	
	private static final long serialVersionUID = 6865659774722627456L;

	private Long id;

	/** 创建日期 */
	private Date createDate;

	/** 修改日期 */
	private Date modifyDate;
	
	/** 名称 */
	private String name;

	/** 全称 */
	private String fullName;

	/** 树路径 */
	private String treePath;
	
	/**权限值ID*/
	private Long menuValue;
	
	/** 层级 */
	private Integer grade;
	
	/**上级菜单ID*/
	private Long parent;
	
	/** 排序 */
	private Integer orders;
	
	/** 菜单权限值 */
	private String vName;
	
	/**
	 * 获取ID
	 * @return ID
	 */
	public Long getId() {
		return id;
	}

	/**
	 * 设置ID
	 * @param id ID
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 获取创建日期
	 * @return 创建日期
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * 设置创建日期
	 * @param createDate 创建日期
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * 获取修改日期
	 * @return 修改日期
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * 设置修改日期
	 * @param modifyDate 修改日期
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	/**
	 * 获取上级菜单ID
	 * @return 上级菜单ID
	 */
	public Long getParent() {
		return parent;
	}
	
	/**
	 * 设置上级菜单ID
	 * @param parentId 上级菜单ID
	 */
	public void setParent(Long parent) {
		this.parent = parent;
	}
	
	/**
	 * 获取层级
	 * @return 层级
	 */
	public Integer getGrade() {
		return grade;
	}

	/**
	 * 设置层级
	 * @param grade 层级
	 */
	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	/**
	 * 获取名称
	 * @return 名称
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置名称
	 * @param name 名称
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 获取全称
	 * @return 全称
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * 设置全称
	 * @param fullName 全称
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * 获取树路径
	 * @return 树路径
	 */
	public String getTreePath() {
		return treePath;
	}

	/**
	 * 设置树路径
	 * @param treePath 树路径
	 */
	public void setTreePath(String treePath) {
		this.treePath = treePath;
	}
	
	/**
	 * 获取权限值ID
	 * @return 权限值ID
	 */
	public Long getMenuValue() {
		return menuValue;
	}
	
	/**
	 * 设置权限值ID
	 * @param menuValue 权限值ID
	 */
	public void setMenuValue(Long menuValue) {
		this.menuValue = menuValue;
	}

	/**
	 * 获取拍
	 * @return 排序
	 */
	public Integer getOrders() {
		return orders;
	}

	/**
	 * 设置排序
	 * @param orders 排序
	 */
	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	/**
	 * @return the vName
	 */
	public String getvName() {
		return vName;
	}

	/**
	 * @param vName the vName to set
	 */
	public void setvName(String vName) {
		this.vName = vName;
	}
	
}