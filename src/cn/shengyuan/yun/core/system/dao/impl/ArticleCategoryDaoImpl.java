package cn.shengyuan.yun.core.system.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.tools.util.StringUtil;
import cn.shengyuan.yun.core.system.dao.ArticleCategoryDao;
import cn.shengyuan.yun.core.system.entity.ArticleCategory;

@Repository("articleCategoryDaoImpl")
public class ArticleCategoryDaoImpl extends BaseDaoImpl<ArticleCategory, Long> implements ArticleCategoryDao {

	@Override
	public List<ArticleCategory> findRoots(Integer position) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String sqlQuery = "SELECT * FROM yun_article_category WHERE parent IS NULL";
		if (position != null) {
			sqlQuery += " AND position = :position";
			paramMap.put("position", position);
		}
		sqlQuery += " ORDER BY orders ASC";

		return query(sqlQuery, paramMap);
	}

	@Override
	public List<ArticleCategory> findArticleCategoryList(Long parentCategoryId, Integer position) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String sqlQuery = "SELECT * FROM yun_article_category WHERE 1 = 1";
		if (parentCategoryId != null) {
			sqlQuery += " AND parent = :parent";
			paramMap.put("parent", parentCategoryId);
		}
		if (position != null) {
			sqlQuery += " AND position = :position";
			paramMap.put("position", position);
		}
		sqlQuery += " ORDER BY orders ASC";

		return query(sqlQuery, paramMap);
	}

	@Override
	public List<ArticleCategory> findParentCategoryList(Long childCategoryId) {
		List<ArticleCategory> list = new ArrayList<ArticleCategory>();

		ArticleCategory category = get(childCategoryId);
		if (category != null && category.getTreePath() != null) {
			for (String cid : category.getTreePath().split(",")) {
				if (StringUtil.isNotBlank(cid)) {
					ArticleCategory parent = get(Long.valueOf(cid));
					list.add(parent);
				}
			}
		}
		return list;
	}
	@Override
	public List<ArticleCategory> findArticleCategories(Long excludeId) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuffer sqlQuery = new StringBuffer();
		sqlQuery.append("select * from yun_article_category where 1 = 1");
		if (excludeId != null) {
			sqlQuery.append(" and id <> :id and tree_path not like :excludeId");
			params.put("excludeId", "%," + excludeId + ",%");
			params.put("id", excludeId);
		}
		sqlQuery.append(" order by orders desc");
		return query(sqlQuery.toString(), params);
	}

	@Override
	public List<ArticleCategory> findAllChildren(Long articleCategoryId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id","%" + articleCategoryId + "%");
		String sql = "SELECT * from yun_article_category WHERE tree_path like :id";
		return query(sql, params);
	}
}
