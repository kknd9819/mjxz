package cn.shengyuan.yun.core.system.dao.impl;

import org.springframework.stereotype.Repository;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.yun.core.system.dao.FeedBackDao;
import cn.shengyuan.yun.core.system.entity.FeedBack;
@Repository("feedBackDaoImpl")
public class FeedBackDaoImpl extends BaseDaoImpl<FeedBack, Long> implements FeedBackDao{

}
