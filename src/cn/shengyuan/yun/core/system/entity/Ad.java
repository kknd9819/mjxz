package cn.shengyuan.yun.core.system.entity;

import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import cn.shengyuan.basic.dao.annotation.Entity;
import cn.shengyuan.basic.dao.annotation.Id;
import cn.shengyuan.basic.dao.annotation.Transient;
import cn.shengyuan.yun.core.system.enums.AdType;

/**
 * 广告
 * 
 * @author tanh
 *
 */
@Entity(name = "yun_ad")
public class Ad implements Serializable {

	private static final long serialVersionUID = -8222266288115125333L;

	@Id
	private Long id;

	// 创建日期
	private Date createDate;

	// 修改日期
	private Date modifyDate;

	// 名称
	private String title;

	// 图片
	private String image;

	// 类型
	private Integer type;

	// 广告属性1
	private String attribute_value1;

	// 广告属性2
	private String attribute_value2;

	// 广告属性3
	private String attribute_value3;

	// 广告属性4
	private String attribute_value4;

	// 广告属性5
	private String attribute_value5;

	// 起始日期
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date beginDate;

	// 结束日期
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endDate;

	// 排序
	private Integer orders;

	// 广告位ID
	private Long adPosition;

	// 广告位CODE
	private String adPositionCode;
	
	//广告位名称
	@Transient
	private String adPositionName;

	public String getAdPositionName() {
		return adPositionName;
	}

	public void setAdPositionName(String adPositionName) {
		this.adPositionName = adPositionName;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getAttribute_value1() {
		return attribute_value1;
	}

	public void setAttribute_value1(String attribute_value1) {
		this.attribute_value1 = attribute_value1;
	}

	public String getAttribute_value2() {
		return attribute_value2;
	}

	public void setAttribute_value2(String attribute_value2) {
		this.attribute_value2 = attribute_value2;
	}

	public String getAttribute_value3() {
		return attribute_value3;
	}

	public void setAttribute_value3(String attribute_value3) {
		this.attribute_value3 = attribute_value3;
	}

	public String getAttribute_value4() {
		return attribute_value4;
	}

	public void setAttribute_value4(String attribute_value4) {
		this.attribute_value4 = attribute_value4;
	}

	public String getAttribute_value5() {
		return attribute_value5;
	}

	public void setAttribute_value5(String attribute_value5) {
		this.attribute_value5 = attribute_value5;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getOrders() {
		return orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	public Long getAdPosition() {
		return adPosition;
	}

	public void setAdPosition(Long adPosition) {
		this.adPosition = adPosition;
	}

	public String getAdPositionCode() {
		return adPositionCode;
	}

	public void setAdPositionCode(String adPositionCode) {
		this.adPositionCode = adPositionCode;
	}
	
	public String getTypeName() {
		return AdType.value(type);
	}
}
