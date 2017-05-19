package cn.shengyuan.yun.core.system.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import cn.shengyuan.basic.dao.base.impl.BaseDaoImpl;
import cn.shengyuan.tools.util.DateUtil;
import cn.shengyuan.yun.core.system.dao.SnDao;
import cn.shengyuan.yun.core.system.entity.Sn;
import cn.shengyuan.yun.core.system.entity.Sn.Type;

@Repository("snDaoImpl")
public class SnDaoImpl extends BaseDaoImpl<Sn, Long> implements SnDao, InitializingBean {
	private Map<Integer, HiloOptimizer> optimizerMap = new HashMap<Integer, HiloOptimizer>();

	public void afterPropertiesSet() throws Exception {
		for (Type t : Type.values()) {
			HiloOptimizer ho = new HiloOptimizer(t, 100);
			optimizerMap.put(t.getCode(), ho);
		}
	}

	public String generate(Type type) {
		Assert.notNull(type);
		HiloOptimizer hiloOptimizer = optimizerMap.get(type.getCode());
		if (hiloOptimizer != null) {
			return hiloOptimizer.generate();
		}
		return null;
	}

	/**
	 * 获取
	 * 
	 * @param type
	 * @return
	 */
	private long getLastValue(Type type) {
		String sql = "/*master*/SELECT id,create_date,modify_date,last_value,type FROM yun_sn WHERE type=:type";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type.getCode());

		List<Sn> list = query(sql, map);
		if (list.size() > 0) {
			Sn sn = list.get(0);
			long lastValue = sn.getLastValue();
			if (lastValue > 999) {
				lastValue = 100;
			}
			sn.setLastValue(lastValue + 1);
			sn.setModifyDate(new Date());
			update(sn);
			return lastValue;
		} else {
			Sn sn = new Sn();
			sn.setCreateDate(new Date());
			sn.setLastValue(100L);
			sn.setModifyDate(new Date());
			sn.setType(type.getCode());
			save(sn);
			return sn.getLastValue();
		}
	}

	/**
	 * 高低位算法
	 */
	private class HiloOptimizer {

		private Type type;
		private int maxLo;
		private int lo;
		private long hi;
		private long lastValue;

		public HiloOptimizer(Type type, int maxLo) {
			this.type = type;
			this.maxLo = maxLo;
			this.lo = maxLo + 1;
		}

		/**
		 * 线程同步 获取订单编码
		 * 
		 * @return
		 */
		public synchronized String generate() {
			StringBuilder builder = new StringBuilder();
			if (lo > maxLo) {
				lastValue = getLastValue(type);
				lo = lastValue == 0 ? 1 : 0;
				hi = lastValue * (maxLo + 1);
			}
			String prefix = type.getCode() < 10 ? "0" + type.getCode() : "" + type.getCode();
			builder.append(prefix);
			builder.append(DateUtil.formatDate(new Date()).substring(2));
			builder.append(hi + lo++);
			return builder.toString();
		}
	}

}
