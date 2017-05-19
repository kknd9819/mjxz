package cn.shengyuan.yun.core.system.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import cn.shengyuan.basic.dao.annotation.Entity;
import cn.shengyuan.basic.dao.annotation.Id;
import cn.shengyuan.basic.dao.annotation.Transient;
import cn.shengyuan.yun.core.system.enums.AdPositionType;

/**
 * 广告位
 * 
 * @author tanh
 *
 */
@Entity(name = "yun_ad_position")
public class AdPosition implements Serializable {
	private static final long serialVersionUID = -1822220262707011098L;

	@Id
	private Long id;

	// 广告位标识code
	private String code;

	// 创建日期
	private Date createDate;

	// 修改日期
	private Date modifyDate;

	// 广告位名称
	private String name;

	// 描述
	private String description;
	
	//广告位置(例如首页、商家首页 详见AdPositionType枚举)
	private Integer position;
	
	// 广告列表 
	@Transient
	private List<Ad> adList;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public List<Ad> getAdList() {
		return adList;
	}

	public void setAdList(List<Ad> adList) {
		this.adList = adList;
	}

	public String getTypeName() {
		return AdPositionType.value(position);
	}
}
