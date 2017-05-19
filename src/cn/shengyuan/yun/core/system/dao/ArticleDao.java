package cn.shengyuan.yun.core.system.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.shengyuan.basic.dao.base.BaseDao;
import cn.shengyuan.basic.model.Page;
import cn.shengyuan.yun.core.system.entity.Article;

public interface ArticleDao extends BaseDao<Article, Long> {
	/**
	 * 根据条件分页查询文章
	 * 
	 * @param articleCategoryId
	 *            文章分类
	 * @param tagIds
	 *            文章标签ID集
	 * @param limit
	 *            每页数
	 * @param pageNo
	 *            当前页
	 * @return
	 */
	Page<Article> findArticlePage(Long articleCategoryId, int limit, int pageNo);

	/**
	 * 查找文章 仅包含已发布文章
	 * 
	 * @param articleCategoryId
	 *            文章分类ID
	 * @param beginDate
	 *            起始日期
	 * @param endDate
	 *            结束日期
	 * @param first
	 *            起始记录
	 * @param count
	 *            数量
	 * @return List<Article>
	 */
	public List<Article> findList(Long articleCategoryId, Date beginDate, Date endDate, Integer first, Integer count);

	/**
	 * 查找已发布文章
	 * @return List<Article>
	 */
	public List<Article> findPublicArticles();
	
	/**
	 * 查找文章
	 * @param first 起始记录
	 * @param count 数量
	 * @return List<Article>
	 */
	public List<Article> findList(Integer first, Integer count);
	
	/**
	 * 更新点击数，并返回目前点击数
	 * 
	 * @param id
	 * @return
	 */
	public long updateHits(Long id);
	
	/**
	 * 分页查询
	 * @param pageSize
	 * @param pageNumber
	 * @param paramMap
	 * @return
	 */
	public Page<Article> findPage(int pageSize, int pageNumber, Map<String, Object> paramMap);
	
	/**
	 * 关联查询文章分类表查询 文章
	 * @param id
	 * @return
	 */
	public Article getArticleWithCategoryName(Long id);
}
