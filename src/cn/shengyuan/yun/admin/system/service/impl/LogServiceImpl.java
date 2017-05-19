package cn.shengyuan.yun.admin.system.service.impl;

import cn.shengyuan.basic.model.Order;
import cn.shengyuan.basic.model.Page;
import cn.shengyuan.basic.service.impl.BaseServiceImpl;
import cn.shengyuan.tools.util.StringUtil;
import cn.shengyuan.yun.admin.system.service.LogService;
import cn.shengyuan.yun.admin.web.Pageable;
import cn.shengyuan.yun.core.admin.dao.LogDao;
import cn.shengyuan.yun.core.admin.entity.Log;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 日志服务层实现
 * @Date 2014-12-30
 * @author 欧志辉
 * @version 1.0
 */
@Service("logServiceImpl")
public class LogServiceImpl extends BaseServiceImpl<Log, Long> implements LogService {

	@Resource(name = "logDaoImpl")
	private LogDao logDao;

	@Resource(name = "logDaoImpl")
	public void setLogDao(LogDao logDao) {
		super.setDao(logDao);
	}

	public void clear() {
		logDao.removeAll();
	}

	@Override
	public Page<Log> findPage(Pageable pageable) {
		int pageNo = pageable.getPageNumber();
		int pageSize = pageable.getPageSize();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (!StringUtil.isEmpty(pageable.getSearchValue())) {
			paramMap.put(pageable.getSearchProperty(), pageable.getSearchValue());
		}
		Order order = Order.desc("create_date");
		if (!StringUtil.isEmpty(pageable.getOrderProperty())) {
			order = new Order(pageable.getOrderProperty(), pageable.getOrderDirection());
		}
		return logDao.queryForPage(pageSize, pageNo, paramMap, order);
	}

}