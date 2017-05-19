package cn.shengyuan.yun.admin.system.service;

import cn.shengyuan.basic.model.Page;
import cn.shengyuan.basic.service.BaseService;
import cn.shengyuan.yun.admin.web.Pageable;
import cn.shengyuan.yun.core.admin.entity.Log;

/**
 * 日志服务层接口
 * @Date 2014-12-30
 * @author 欧志辉
 * @version 1.0
 */
public interface LogService extends BaseService<Log, Long> {

	/**
	 * 清空日志
	 */
	public void clear();
	
	/**
	 * 分页查询日志
	 * @param pageable
	 * @return Page<Log>
	 */
	public Page<Log> findPage(Pageable pageable);

}