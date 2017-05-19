package cn.shengyuan.yun.core.system.entity;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.shengyuan.basic.dao.annotation.Entity;
import cn.shengyuan.basic.dao.annotation.Id;
import cn.shengyuan.basic.dao.annotation.Transient;
import cn.shengyuan.tools.util.StringUtil;

@Entity(name = "yun_area")
public class Area implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8709135308724218883L;

	@Id
	private Long id;
	
	/** 创建日期 */
	private Date createDate;

	/** 修改日期 */
	private Date modifyDate;

	/** 树路径分隔符 */
	@Transient
	private static final String TREE_PATH_SEPARATOR = ",";

	/** 名称 */
	private String name;

	/** 全称 */
	private String fullName;

	/** 树路径 */
	private String treePath;

	/** 上级地区 */
	private Long parent;

	/** 排序 */
	private Long orders;
	
	/**级别*/
	private Long levels;
	
	/**邮编*/
	private String zip;
	
	/**是否是直辖市*/
	private Boolean municipality;
	
	@Transient
	private List<Area> childrenArea = new ArrayList<Area>();
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getTreePath() {
		return treePath;
	}
	
	public List<Long> getPathIDs() {
		List<Long> ids = new ArrayList<Long>();
		for (String pathId : treePath.split(",")) {
			if (StringUtil.isNotBlank(pathId)) {
				ids.add(Long.valueOf(pathId));
			}
		}
		ids.add(id);
		return ids;
	}

	public void setTreePath(String treePath) {
		this.treePath = treePath;
	}

	public Long getParent() {
		return parent;
	}

	public void setParent(Long parent) {
		this.parent = parent;
	}

	public Long getOrders() {
		return orders;
	}

	public void setOrders(Long orders) {
		this.orders = orders;
	}

	public List<Area> getChildrenArea() {
		return childrenArea;
	}

	public void setChildrenArea(List<Area> childrenArea) {
		this.childrenArea = childrenArea;
	}

	public Long getLevels() {
		return levels;
	}

	public void setLevels(Long levels) {
		this.levels = levels;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public Boolean getMunicipality() {
		return municipality;
	}

	public void setMunicipality(Boolean municipality) {
		this.municipality = municipality;
	}
	
}