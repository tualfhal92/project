package com.misoot.lar.common.interfaces;

import java.util.List;

public interface LarService<T> {
	T selectOne(int index);
	List<T> selectList();
	int insert(T t);
	int update(T t);
	int delete(int index);
}