package org.travel.base.vfdata.impl;

import java.util.Iterator;
import java.util.Map;

import javax.persistence.Query;

import org.travel.common.Common;

public class VfData {

	public String getQuery(String sql, String QueryAdd, String fielName, Object filed, Map<String, Object> listParam) {
		if (!Common.isNullOrEmpty(filed)) {
			sql += QueryAdd;
			listParam.put(fielName, filed);
		}
		return sql;
	}

	public void setParameter(Query query, Map<String, Object> params) {

		Iterator<Map.Entry<String, Object>> it = params.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			query.setParameter(entry.getKey(), entry.getValue());
		}
	}

}
