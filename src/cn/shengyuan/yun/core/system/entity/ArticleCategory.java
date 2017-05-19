package cn.shengyuan.yun.core.system.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import cn.shengyuan.basic.dao.annotation.Entity;
import cn.shengyuan.basic.dao.annotation.Id;
import cn.shengyuan.tools.util.StringUtil;
import cn.shengyuan.yun.core.system.enums.ArticleCategoryPosition;

@Entity(name = "yun_article_category")
public class ArticleCategory implements Serializable {
	private static final long serialVersionUID = 6825177699298720867L;
	
	/** 树路径分隔符 */
	public static final String TREE_PATH_SEPARATOR = ",";

	/** 访问路径前缀 */
	private static final String PATH_PREFIX = "/article/list";

	/** 访问路径后缀 */
	private static final String PATH_SUFFIX = ".jhtml";

	@Id
	private Long id;

	// 创建日期
	private Date createDate;

	// 修改日期
	private Date modifyDate;

	// 名称
	private String name;

	// 排序
	private Integer orders;

	// 树路径
	private String treePath;

	// 层级
	private Integer grade;

	// 上级分类
	private Long parent;

	// 位置
	private Integer position;

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

	public Integer getOrders() {
		return orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	public String getTreePath() {
		return treePath;
	}

	public void setTreePath(String treePath) {
		this.treePath = treePath;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Long getParent() {
		return parent;
	}

	public void setParent(Long parent) {
		this.parent = parent;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}
	
	public String getTypeName(){
		return ArticleCategoryPosition.value(position);
	}
	
	/**
	 * 获取访问路径
	 * 
	 * @return 访问路径
	 */
	@JsonProperty
	public String getPath() {
		if (getId() != null) {
			return PATH_PREFIX + "/" + getId() + PATH_SUFFIX;
		}
		return null;
	}

	public List<Long> getTreePathIds() {
		List<Long> ids = new ArrayList<Long>();
		for (String pathId : treePath.split(",")) {
			if (StringUtil.isNotBlank(pathId)) {
				ids.add(Long.valueOf(pathId));
			}
		}
		return ids;
	}
}
