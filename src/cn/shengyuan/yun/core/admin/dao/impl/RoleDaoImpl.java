package cn.shengyuan.yun.core.admin.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.yun.core.admin.dao.RoleDao;
import cn.shengyuan.yun.core.admin.entity.Role;
/**
 * 角色持久层实现
 * @Date 2014-12-29
 * @author 欧志辉
 * @version 1.0
 */
@Repository("roleDaoImpl")
public class RoleDaoImpl extends BaseDaoImpl<Role, Long> implements RoleDao {

	@Override
	public void batchDelete(List<Role> roles) {
		String sql = "delete from xx_role where id = :id";
		super.batch(sql, roles);
	}

	@Override
	public List<Role> findRoleByAdminId(Long adminId) {
		if (adminId == null) {
			return null;
		}
		StringBuilder sqlSB = new StringBuilder("select r.* from xx_role r ");
		sqlSB.append("left join xx_admin_role ar on r.id = ar.roles where ar.admins = :adminId");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("adminId", adminId);
		return super.query(sqlSB.toString(), paramMap);
	}

}