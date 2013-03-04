package com.hao.dao;

import java.util.List;
import java.util.Map;

import com.hao.po.Base;

public interface ICommonDao<T extends Base> {

	/**
	 * 插入数据
	 * 
	 * @param Namespace
	 *            命名空间名称
	 * @param base
	 *            继承Base的实体对象
	 * @return 返回当前插入的ID
	 */
	Integer insert(String namespace, T base);

	/**
	 * 根据fieldName条件修改
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param fieldName
	 *            字段名
	 * @return 返回当前修改的ID
	 */
	Integer updateByField(String namespace, Object fieldName);

	/**
	 * 根据map条件修改
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param map
	 *            map键/值对
	 * @return 返回当前修改的ID
	 */
	Integer updateByMap(String namespace, Map<String, Object> map);

	/**
	 * 根据Base对象修改
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param base
	 *            继承Base的实体对象
	 * @return 返回当前修改的ID
	 */
	Integer updateByBase(String namespace, T base);

	/**
	 * 根据fieldName条件删除
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param fieldName
	 *            字段名
	 * @return 返回当前删除的ID
	 */
	Integer deleteByField(String namespace, Object fieldName);

	/**
	 * 根据map条件删除
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param map
	 *            map键/值对
	 * @return 返回当前删除的ID
	 */
	Integer deleteByMap(String namespace, Map<String, Object> map);

	/**
	 * 根据Base对象删除
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param base
	 *            继承Base的实体对象
	 * @return 返回当前删除的ID
	 */
	Integer deleteByBase(String namespace, T base);

	/**
	 * 根据fieldName条件查询
	 * 
	 * @param Namespace
	 *            命名空间名称
	 * @param fieldName
	 *            字段名
	 * @return 返回Base实体对象
	 */
	T findByField(String namespace, Object fieldName);

	/**
	 * 根据map条件查询
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param map
	 *            map键/值对
	 * @return 返回Base实体对象
	 */
	T findByMap(String namespace, Map<String, Object> map);

	/**
	 * 根据Base对象查询
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param base
	 *            继承Base的实体对象
	 * @return 返回Base实体对象
	 */
	T findByBase(String namespace, T base);

	/**
	 * 根据fieldName条件查询
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param fieldName
	 *            字段名
	 * @return 返回Base的List集合
	 */
	List<T> findByFieldList(String namespace, Object fieldName);

	/**
	 * 根据map条件查询
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param map
	 *            map键/值对
	 * @return 返回Base的List集合
	 */
	List<T> findByMapList(String namespace, Map<String, Object> map);

	/**
	 * 根据Base对象查询
	 * 
	 * @param namespace
	 *            命名空间名称
	 * @param base
	 *            继承Base的实体对象
	 * @return 返回Base的List集合
	 */
	List<T> findByBaseList(String namespace, T base);
}
