package cn.shengyuan.yun.core.system.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.regex.Pattern;

import cn.shengyuan.basic.dao.annotation.Entity;
import cn.shengyuan.basic.dao.annotation.Id;
import cn.shengyuan.basic.dao.annotation.Transient;

@Entity(name = "yun_article")
public class Article implements Serializable {
	private static final long serialVersionUID = -2758134136329501181L;

	@Id
	private Long id;

	// 创建日期
	private Date createDate;

	// 修改日期
	private Date modifyDate;

	// 标题
	private String title;

	// 作者
	private String author;

	// 内容
	private String content;

	// 页面标题
	private String seoTitle;

	// 页面关键词
	private String seoKeywords;

	// 页面描述
	private String seoDescription;

	// 是否发布
	private Boolean isPublication;

	// 是否置顶
	private Boolean isTop;

	// 点击数
	private Long hits;

	// 文章分类
	private Long articleCategory;
	
	// 文章分类名称
	@Transient
	private String articleCategoryName;
	
	/**静态化路径*/
	@Transient
	private String staticPath;

	public String getArticleCategoryName() {
		return articleCategoryName;
	}

	public void setArticleCategoryName(String articleCategoryName) {
		this.articleCategoryName = articleCategoryName;
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSeoTitle() {
		return seoTitle;
	}

	public void setSeoTitle(String seoTitle) {
		this.seoTitle = seoTitle;
	}

	public String getSeoKeywords() {
		return seoKeywords;
	}

	public void setSeoKeywords(String seoKeywords) {
		this.seoKeywords = seoKeywords;
	}

	public String getSeoDescription() {
		return seoDescription;
	}

	public void setSeoDescription(String seoDescription) {
		this.seoDescription = seoDescription;
	}

	public Boolean getIsPublication() {
		return isPublication;
	}

	public void setIsPublication(Boolean isPublication) {
		this.isPublication = isPublication;
	}

	public Boolean getIsTop() {
		return isTop;
	}

	public void setIsTop(Boolean isTop) {
		this.isTop = isTop;
	}

	public Long getHits() {
		return hits;
	}

	public void setHits(Long hits) {
		this.hits = hits;
	}

	public Long getArticleCategory() {
		return articleCategory;
	}

	public void setArticleCategory(Long articleCategory) {
		this.articleCategory = articleCategory;
	}
	
	public String getStaticPath() {
		return staticPath;
	}

	public void setStaticPath(String staticPath) {
		this.staticPath = staticPath;
	}

}
