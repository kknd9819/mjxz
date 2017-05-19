package cn.shengyuan.yun.core.system.entity;

import java.io.Serializable;

import cn.shengyuan.basic.dao.annotation.Entity;
import cn.shengyuan.basic.dao.annotation.Id;

@Entity(name = "yun_area_location")
public class AreaLocation implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7920777225795652227L;

	@Id
	private Long id;
	
	/** 街道地址 */
	private Long area;
	
	/** 最小经度 */
	private Double minLongitude;
	
	/** 最大经度 */
	private Double maxLongitude;
	
	/** 最小纬度 */
	private Double minLatitude;
	
	/** 最大纬度 */
	private Double maxLatitude;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getArea() {
		return area;
	}

	public void setArea(Long area) {
		this.area = area;
	}

	public Double getMinLongitude() {
		return minLongitude;
	}

	public void setMinLongitude(Double minLongitude) {
		this.minLongitude = minLongitude;
	}

	public Double getMaxLongitude() {
		return maxLongitude;
	}

	public void setMaxLongitude(Double maxLongitude) {
		this.maxLongitude = maxLongitude;
	}

	public Double getMinLatitude() {
		return minLatitude;
	}

	public void setMinLatitude(Double minLatitude) {
		this.minLatitude = minLatitude;
	}

	public Double getMaxLatitude() {
		return maxLatitude;
	}

	public void setMaxLatitude(Double maxLatitude) {
		this.maxLatitude = maxLatitude;
	}
}