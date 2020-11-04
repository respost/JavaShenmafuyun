package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.CodeBiz;
import com.smfy.dao.impl.CodeDaoImpl;
import com.smfy.entity.Code;

public class CodeBizImpl implements CodeBiz {

	@Override
	public int AddCode(Code code) {
		// TODO Auto-generated method stub
		return new CodeDaoImpl().AddCode(code);
	}
	
	@Override
	public int editCode(Code code) {
		// TODO Auto-generated method stub
		return new CodeDaoImpl().editCode(code);
	}
	
	@Override
	public List<Code> findAllCode(String tj,int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		return new CodeDaoImpl().findAllCode(tj,pageIndex, pageSize);
	}

	@Override
	public int findAllCodeCount(String tj) {
		// TODO Auto-generated method stub
		return new CodeDaoImpl().findAllCodeCount(tj);
	}

	@Override
	public Code findCodeInfo(String tj) {
		// TODO Auto-generated method stub
		return new CodeDaoImpl().findCodeInfo(tj);
	}

	@Override
	public int updateCodeStatus(Code code) {
		// TODO Auto-generated method stub
		return new CodeDaoImpl().updateCodeStatus(code);
	}

	@Override
	public int delCode(Code code) {
		// TODO Auto-generated method stub
		return new CodeDaoImpl().delCode(code);
	}

}
