package com.smfy.biz;

import java.util.List;

import com.smfy.entity.CodeType;

public interface CodeTypeBiz {
	/**
	 * 查找全部源码类型
	 * @return
	 */
	List<CodeType> findAllCodeType();
	/**
	 * 添加源码类型
	 * @param codeType 对象
	 * @return
	 */
	int addCodeType(CodeType codeType);
	/**
	 * 删除源码类型
	 * @param codeType 对象
	 * @return
	 */
	int delCodeType(CodeType codeType);
	/**
	 * 编辑源码类型
	 * @param codeType
	 * @return
	 */
	int updateCodeType(CodeType codeType);
}
