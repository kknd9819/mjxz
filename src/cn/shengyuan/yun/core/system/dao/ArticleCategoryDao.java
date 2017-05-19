package cn.shengyuan.yun.core.system.dao;

import java.util.List;

import cn.shengyuan.basic.dao.base.BaseDao;
import cn.shengyuan.yun.core.system.entity.ArticleCategory;

public interface ArticleCategoryDao extends BaseDao<ArticleCategory, Long> {
	
	/**
	 * 根据位置获取文章顶级分类
	 * @param position 位置
	 * @return
	 */
	public List<ArticleCategory> findRoots(Integer position);

	/**
	 * 文章子分类数据查询
	 * @param parentCategoryId 父级分类ID
	 * @param position 位置
	 * @return
	 */
	public List<ArticleCategory> findArticleCategoryList(Long parentCategoryId, Integer position);

	/**
	 * 获取文章分类的父级分类集合
	 * @param childCategoryId
	 * @return
	 */
	public List<ArticleCategory> findParentCategoryList(Long childCategoryId);

	/**
	 * 查找商品分类,排除指定分类及子类
	 * @param excludeId
	 * @return List<ProductCategory>
	 */
	public List<ArticleCategory> findArticleCategories(Long excludeId);
	
	/**
	 * 根据id查找所有的子孙类
	 * @param articleCategoryId
	 * @return
	 */
	public List<ArticleCategory> findAllChildren(Long articleCategoryId);
}
