package cn.shengyuan.yun.core.system.dao.impl;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.basic.model.Page;
import cn.shengyuan.tools.util.StringUtil;
import cn.shengyuan.yun.core.system.dao.ArticleDao;
import cn.shengyuan.yun.core.system.entity.Article;

@Repository("articleDaoImpl")
public class ArticleDaoImpl extends BaseDaoImpl<Article, Long> implements ArticleDao {

	@Override
	public Page<Article> findArticlePage(Long articleCategoryId,int limit, int pageNo) {
		Map<String, Object> params = new HashMap<String, Object>();

		String sqlQuery = "SELECT a.id, a.title, a.content,a.author, a.is_publication, a.is_top, a.hits, a.article_category, a.create_date, a.modify_date";

		String sqlCount = "SELECT COUNT(a.id)";

		String sqlWhere = " FROM yun_article a";

		if (articleCategoryId != null) {
			sqlWhere += " LEFT JOIN yun_article_category ac ON (a.article_category = ac.id AND ac.id = :articleCategoryId)";
			params.put("articleCategoryId", articleCategoryId);
		}
		sqlWhere += " WHERE 1 = 1 and a.is_publication=1 ";

		if (articleCategoryId != null) {
			sqlWhere += " AND ac.id IS NOT NULL";
		}

		sqlWhere += " ORDER	BY a.create_date DESC";
		sqlQuery += sqlWhere;
		sqlCount += sqlWhere;

		return queryForPage(sqlQuery, sqlCount, limit, pageNo, params);
	}

	@Override
	public List<Article> findList(Long articleCategoryId, Date beginDate, Date endDate, Integer first, Integer count) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuilder sqlSB = new StringBuilder("select * from yun_article where is_publication = 1");
		if (articleCategoryId != null) {
			sqlSB.append(" and article_category = :articleCategoryId");
			paramMap.put("articleCategoryId", articleCategoryId);
		}
		if (beginDate != null) {
			sqlSB.append(" and create_date >= :beginDate");
			paramMap.put("beginDate", beginDate);
		}
		if (endDate != null) {
			sqlSB.append(" and create_date <= :endDate");
			paramMap.put("endDate", endDate);
		}
		sqlSB.append(" limit ").append(first).append(",").append(count);
		return super.query(sqlSB.toString(), paramMap);
	}

	@Override
	public List<Article> findPublicArticles() {
		StringBuilder sqlSB = new StringBuilder("select * from yun_article where is_publication = 1");
		return super.query(sqlSB.toString());
	}

	@Override
	public List<Article> findList(Integer first, Integer count) {
		StringBuilder sqlSB = new StringBuilder("select * from yun_article where 1 = 1");
		sqlSB.append(" limit ").append(first).append(",").append(count);
		return super.query(sqlSB.toString());
	}

	@Override
	public long updateHits(Long id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		String updateSql = "UPDATE yun_article SET hits = (hits + 1) WHERE id = :id";
		update(updateSql, paramMap);

		String selectSql = "SELECT hits FROM yun_article WHERE id = :id";
		Long hits = queryForObject(selectSql, paramMap, Long.class);
		if (hits != null) {
			return hits;
		}
		return 0;
	}

	@Override
	public Page<Article> findPage(int pageSize, int pageNumber, Map<String, Object> paramMap) {

		StringBuilder sqlQuery = new StringBuilder("select a.*,ac.name articleCategoryName from yun_article a left join yun_article_category ac on a.article_category = ac.id where 1 =1  ");

		Map<String, Object> params = new HashMap<String, Object>();

		if (MapUtils.getLong(paramMap, "articleCategory") != null) {
			sqlQuery.append(" and a.article_category = :articleCategory ");
			params.put("articleCategory", MapUtils.getLong(paramMap, "articleCategory"));
		}
		if (!StringUtil.isEmpty(MapUtils.getString(paramMap, "title"))) {
			sqlQuery.append(" and a.title like :title ");
			params.put("title", "%" + MapUtils.getString(paramMap, "title") + "%");
		}
		if (!StringUtil.isEmpty(MapUtils.getString(paramMap, "name"))) {
			sqlQuery.append(" and ac.name like :name ");
			params.put("name", "%" + MapUtils.getString(paramMap, "name") + "%");
		}
		String sqlCount = "select count(*) from (" + sqlQuery.toString() + ") t___";

		if (StringUtil.isNotEmpty(MapUtils.getString(paramMap, "orderProperty"))) {
			sqlQuery.append(" order by " + MapUtils.getString(paramMap, "orderProperty") + " " + MapUtils.getString(paramMap, "orderDirection"));
		}else{
			sqlQuery.append(" order by a.article_category,a.create_date desc");
		}
		return super.queryForPage(sqlQuery.toString(), sqlCount, pageSize, pageNumber, params);
	}

	@Override
	public Article getArticleWithCategoryName(Long id) {
		if (null == id)
			return null;
		String sql = "select a.id,a.create_date as createDate,a.modify_date as modifyDate,a.title,a.author,a.content,a.seo_title as seoTitle,a.seo_keywords as seoKeywords,"
				+ "a.seo_description as seoDescription,a.is_publication as isPublication,a.is_top as isTop,a.hits,a.article_category as articleCategory," + "c.name as articleCategoryName from yun_article a LEFT JOIN yun_article_category c on a.article_category=c.id where a.id="
				+ id;
		List<Article> list = super.query(sql);
		if (list.size() > 0)
			return list.get(0);
		return null;
	}

}
