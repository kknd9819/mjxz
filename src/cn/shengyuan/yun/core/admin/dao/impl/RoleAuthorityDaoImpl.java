package cn.shengyuan.yun.core.admin.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.jdbc.SpringJDBCTemplate;
import cn.shengyuan.yun.core.admin.dao.RoleAuthorityDao;
import cn.shengyuan.yun.core.admin.entity.RoleAuthority;

/**
 * 角色权限关联关系持久层实现
 * @Date 2014-12-29
 * @author 欧志辉
 * @version 1.0
 */
@Repository("roleAuthorityDaoImpl")
public class RoleAuthorityDaoImpl implements RoleAuthorityDao {

	@Resource
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Resource
	private SpringJDBCTemplate springJDBCTemplate;
	
	@Override
	public void batchSaveRoleAuthority(List<RoleAuthority> roleAuthoritys) {
		
		String sql = "insert into xx_role_authority (role, authorities) values(:roleId, :authority)";
		springJDBCTemplate.batchOperate(sql, roleAuthoritys);
	}
	
	@Override
	public void deleteByRoleId(Long roleId) {
		String sql = "delete from xx_role_authority where role = :roleId";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("roleId", roleId);
		namedParameterJdbcTemplate.update(sql, paramMap);
	}

}