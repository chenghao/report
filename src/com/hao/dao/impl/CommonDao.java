package com.hao.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hao.dao.ICommonDao;
import com.hao.po.Base;

@Repository
public class CommonDao extends BaseDao implements ICommonDao<Base> {
	private static String DOT = "\\.";

	/**
	 * 处理sql
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param obj
	 *            sql参数
	 * @param sqlType
	 *            sql类型. insert, delete, update, queryForObject, queryForList
	 * @param sqlMethodName
	 *            sqlID. 一般使用该方法
	 * @return 返回Object对象
	 */
	protected Object dispose(String namespace, Object obj, String sqlType, String sqlMethodName) {
		String[] namespaceArray = namespace.split(DOT);
		int length = namespaceArray.length;
		if (length == 1) {
			if (sqlType.equals("insert")) {
				return getSqlMapClientTemplate().insert(namespaceArray[0] + "." + sqlMethodName, obj);
			} else if (sqlType.equals("delete")) {
				return getSqlMapClientTemplate().delete(namespaceArray[0] + "." + sqlMethodName, obj);
			} else if (sqlType.equals("update")) {
				return getSqlMapClientTemplate().update(namespaceArray[0] + "." + sqlMethodName, obj);
			} else if (sqlType.equals("queryForObject")) {
				return getSqlMapClientTemplate().queryForObject(namespaceArray[0] + "." + sqlMethodName, obj);
			} else if (sqlType.equals("queryForList")) {
				return getSqlMapClientTemplate().queryForList(namespaceArray[0] + "." + sqlMethodName, obj);
			}
		} else if (length == 2) {
			if (sqlType.equals("insert")) {
				return getSqlMapClientTemplate().insert(namespaceArray[0] + "." + namespaceArray[1], obj);
			} else if (sqlType.equals("delete")) {
				return getSqlMapClientTemplate().delete(namespaceArray[0] + "." + namespaceArray[1], obj);
			} else if (sqlType.equals("update")) {
				return getSqlMapClientTemplate().update(namespaceArray[0] + "." + namespaceArray[1], obj);
			} else if (sqlType.equals("queryForObject")) {
				return getSqlMapClientTemplate().queryForObject(namespaceArray[0] + "." + namespaceArray[1], obj);
			} else if (sqlType.equals("queryForList")) {
				return getSqlMapClientTemplate().queryForList(namespaceArray[0] + "." + namespaceArray[1], obj);
			}
		}

		return null;
	}

	@Override
	public Integer insert(String namespace, Base base) {
		Object obj = dispose(namespace, base, "insert", "insert");
		return (Integer) obj;
	}

	@Override
	public Base findByField(String namespace, Object fieldName) {
		Object obj = dispose(namespace, fieldName, "queryForObject", "findByField");
		return (Base) obj;
	}

	@Override
	public Base findByBase(String namespace, Base base) {
		Object obj = dispose(namespace, base, "queryForObject", "findByBase");
		return (Base) obj;
	}

	@Override
	public Base findByMap(String namespace, Map<String, Object> map) {
		Object obj = dispose(namespace, map, "queryForObject", "findByMap");
		return (Base) obj;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Base> findByFieldList(String namespace, Object fieldName) {
		Object obj = dispose(namespace, fieldName, "queryForList", "findByFieldList");
		return (List<Base>) obj;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Base> findByMapList(String namespace, Map<String, Object> map) {
		Object obj = dispose(namespace, map, "queryForList", "findByMapList");
		return (List<Base>) obj;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Base> findByBaseList(String namespace, Base base) {
		Object obj = dispose(namespace, base, "queryForList", "findByBaseList");
		return (List<Base>) obj;
	}

	@Override
	public Integer updateByField(String namespace, Object fieldName) {
		Object obj = dispose(namespace, fieldName, "update", "updateByField");
		return (Integer) obj;
	}

	@Override
	public Integer updateByMap(String namespace, Map<String, Object> map) {
		Object obj = dispose(namespace, map, "update", "updateByMap");
		return (Integer) obj;
	}

	@Override
	public Integer updateByBase(String namespace, Base base) {
		Object obj = dispose(namespace, base, "update", "updateByBase");
		return (Integer) obj;
	}

	@Override
	public Integer deleteByField(String namespace, Object fieldName) {
		Object obj = dispose(namespace, fieldName, "delete", "deleteByField");
		return (Integer) obj;
	}

	@Override
	public Integer deleteByMap(String namespace, Map<String, Object> map) {
		Object obj = dispose(namespace, map, "delete", "deleteByMap");
		return (Integer) obj;
	}

	@Override
	public Integer deleteByBase(String namespace, Base base) {
		Object obj = dispose(namespace, base, "delete", "deleteByBase");
		return (Integer) obj;
	}

}
