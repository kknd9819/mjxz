package cn.shengyuan.yun.core.system.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.shengyuan.yun.core.system.dao.SnDao;
import cn.shengyuan.yun.core.system.entity.Sn.Type;
import cn.shengyuan.yun.core.system.service.SnService;

/**
 * Service - 序列号
 */
@Service("snServiceImpl")
public class SnServiceImpl implements SnService {

	@Resource(name = "snDaoImpl")
	private SnDao snDao;

	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public String generate(Type type) {
		return snDao.generate(type);
	}

}