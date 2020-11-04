package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.CodeTypeBiz;
import com.smfy.dao.BaseDao;
import com.smfy.dao.impl.CodeTypeDaoImpl;
import com.smfy.entity.CodeType;

public class CodeTypeBizImpl extends BaseDao implements CodeTypeBiz {

	@Override
	public List<CodeType> findAllCodeType() {
		// TODO Auto-generated method stub
		return new CodeTypeDaoImpl().findAllCodeType();
	}

	@Override
	public int addCodeType(CodeType codeType) {
		// TODO Auto-generated method stub
		return new CodeTypeDaoImpl().addCodeType(codeType);
	}

	@Override
	public int delCodeType(CodeType codeType) {
		// TODO Auto-generated method stub
		return new CodeTypeDaoImpl().delCodeType(codeType);
	}

	@Override
	public int updateCodeType(CodeType codeType) {
		// TODO Auto-generated method stub
		return new CodeTypeDaoImpl().updateCodeType(codeType);
	}

}
