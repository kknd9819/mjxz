package cn.shengyuan.yun.admin.system.service.impl;

import cn.shengyuan.basic.model.Page;
import cn.shengyuan.basic.service.impl.BaseServiceImpl;
import cn.shengyuan.yun.admin.system.service.MenuValueService;
import cn.shengyuan.yun.core.admin.dao.MenuValueDao;
import cn.shengyuan.yun.core.admin.entity.MenuValue;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 菜单权限值服务层接口实现
 * @Date 2014-12-29
 * @author 欧志辉
 * @version 1.0
 */
@Service("menuValueServiceImpl")
public class MenuValueServiceImpl extends BaseServiceImpl<MenuValue, Long> implements MenuValueService {
	
	@Resource(name = "menuValueDaoImpl")
	private MenuValueDao menuValueDao;
	
	@Resource(name = "menuValueDaoImpl")
	public void setMenuValueDao(MenuValueDao menuValueDao) {
		super.setDao(menuValueDao);
	}

	@Override
	public boolean nameExists(Long id, String vName) {
		
		List<MenuValue> list = menuValueDao.nameExists(id, vName);
		return list != null && list.size() > 0;
	}

	@Override
	public Page<MenuValue> findPage(int pageNo, int pageSize) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		return menuValueDao.queryForPage(pageSize, pageNo, paramMap);
	}

	@Override
	public void batchDelete(List<MenuValue> menuValues) {
		menuValueDao.batchDelete(menuValues);
	}
	
}