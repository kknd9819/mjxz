package cn.shengyuan.yun.admin.system.service;

import cn.shengyuan.basic.model.Page;
import cn.shengyuan.basic.service.BaseService;
import cn.shengyuan.yun.core.admin.entity.MenuValue;

import java.util.List;

/**
 * 菜单权限值服务层接口
 * @Date 2014-12-29
 * @author 欧志辉
 * @version 1.0
 */
public interface MenuValueService extends BaseService<MenuValue, Long> {
	
	/**
	 * 判断菜单权限值名称是否存在
	 * @param id 菜单权限主键
	 * @param vName 菜单权限值(忽略大小写)
	 * @return 名称是否存在
	 */
	boolean nameExists(Long id, String vName);
	
	/**
	 * 分页查找所有的菜单权限值
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<MenuValue> findPage(int pageNo, int pageSize);
	
	/**
	 * 批量删除菜单权限值
	 * @param menuValues
	 */
	public void batchDelete(List<MenuValue> menuValues);
}