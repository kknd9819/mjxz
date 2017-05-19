package cn.shengyuan.yun.core.system.entity;

import java.io.Serializable;
import java.util.Date;

import cn.shengyuan.basic.dao.annotation.Entity;
import cn.shengyuan.basic.dao.annotation.Id;

/**
 * 内容反馈
 * 
 * @author zs
 *
 */
@Entity(name = "yun_feedback")
public class FeedBack implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6260480605731793416L;

	@Id
	private Long id;

	// 创建日期
	private Date createDate;

	// 会员ID
	private Long memberId;

	// 终端
	private Integer terminal;

	// 内容
	private String content;

	// 联系方式
	private String contact;

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

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Integer getTerminal() {
		return terminal;
	}

	public void setTerminal(Integer terminal) {
		this.terminal = terminal;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

}
