package cn.shengyuan.yun.admin.system.service.impl;

import cn.shengyuan.basic.model.Page;
import cn.shengyuan.basic.service.impl.BaseServiceImpl;
import cn.shengyuan.tools.util.StringUtil;
import cn.shengyuan.yun.admin.system.service.RoleService;
import cn.shengyuan.yun.admin.web.Pageable;
import cn.shengyuan.yun.core.admin.dao.RoleAuthorityDao;
import cn.shengyuan.yun.core.admin.dao.RoleDao;
import cn.shengyuan.yun.core.admin.entity.Role;
import cn.shengyuan.yun.core.admin.entity.RoleAuthority;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * 角色服务层实现
 * @Date 2014-12-29
 * @author 欧志辉
 * @version 1.0
 */
@Service("roleServiceImpl")
public class RoleServiceImpl extends BaseServiceImpl<Role, Long> implements RoleService {
	
	@Resource(name = "roleAuthorityDaoImpl")
	private RoleAuthorityDao roleAuthorityDao;
	
	@Resource(name = "roleDaoImpl")
	private RoleDao roleDao;
	
	@Resource(name = "roleDaoImpl")
	public void setRoleDao(RoleDao roleDao) {
		super.setDao(roleDao);
	}

	@Override
	public Long saveRole(Role role, String authorities) {
		role.setCreateDate(new Date());
		role.setModifyDate(new Date());
		Long roleId = roleDao.save(role);
		List<RoleAuthority> roleAuthoritys = new ArrayList<RoleAuthority>();
		String[] arrayAuthority = authorities.split(",");
		for (String authority : arrayAuthority) {
			if (!StringUtil.isEmpty(authority)) {
				RoleAuthority roleAuthority = new RoleAuthority();
				roleAuthority.setRoleId(roleId);
				roleAuthority.setAuthority(authority);
				roleAuthoritys.add(roleAuthority);
			}
		}
		roleAuthorityDao.batchSaveRoleAuthority(roleAuthoritys);
		return roleId;
	}

	@Override
	public void updateRole(Role role, String authorities) {
		role.setModifyDate(new Date());
		roleDao.update(role);
		roleAuthorityDao.deleteByRoleId(role.getId());
		List<RoleAuthority> roleAuthoritys = new ArrayList<RoleAuthority>();
		String[] arrayAuthority = authorities.split(",");
		for (String authority : arrayAuthority) {
			if (!StringUtil.isEmpty(authority)) {
				RoleAuthority roleAuthority = new RoleAuthority();
				roleAuthority.setRoleId(role.getId());
				roleAuthority.setAuthority(authority);
				roleAuthoritys.add(roleAuthority);
			}
		}
		roleAuthorityDao.batchSaveRoleAuthority(roleAuthoritys);
	}

	@Override
	public void batchDelete(List<Role> roles) {
		roleDao.batchDelete(roles);
	}
	
	@Override
	public Page<Role> findPage(Pageable pageable) {
		int pageSize = pageable.getPageSize();
		int pageNo = pageable.getPageNumber();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (!StringUtil.isEmpty(pageable.getSearchValue())) {
			paramMap.put(pageable.getSearchProperty(), pageable.getSearchValue());
		}
		return roleDao.queryForPage(pageSize, pageNo, paramMap);
	}

	@Override
	public Set<Long> getRoleIdsByAdminId(Long adminId) {
		Set<Long> hasRoleIds = new HashSet<Long>();
		List<Role> hasRoles = roleDao.findRoleByAdminId(adminId);
		if (hasRoles != null) {
			for (Role role : hasRoles) {
				hasRoleIds.add(role.getId());
			}
		}
		return hasRoleIds;
	}

	@Override
	public List<Role> findRoleByAdminId(Long id) {
		return roleDao.findRoleByAdminId(id);
	}
	
}