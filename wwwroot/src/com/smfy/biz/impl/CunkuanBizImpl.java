package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.CunkuanBiz;
import com.smfy.dao.impl.CunkuanDaoImpl;
import com.smfy.entity.Cunkuan;

public class CunkuanBizImpl implements CunkuanBiz {

	@Override
	public List<Cunkuan> findAllCunkuan(String tj,int pageIndex,int pageSize) {
		return new CunkuanDaoImpl().findAllCunkuan(tj, pageIndex, pageSize);
		// TODO Auto-generated method stub
	
	}

	@Override
	public int delCunkuan(Cunkuan cunkuan) {
		// TODO Auto-generated method stub
		return new CunkuanDaoImpl().delCunkuan(cunkuan);
	}

	@Override
	public int findAllCount(String tj) {
		// TODO Auto-generated method stub
		return new CunkuanDaoImpl().findAllCount(tj);
	}

}
