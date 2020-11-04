package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.HuikuanBiz;
import com.smfy.dao.impl.HuikuanDaoImpl;
import com.smfy.entity.Huikuan;

public class HuikuaiBizImpl implements HuikuanBiz {

	@Override
	public List<Huikuan> findAllHuikuan(String tj,int pageIndex,int pageSize) {
		// TODO Auto-generated method stub
		return new HuikuanDaoImpl().findAllHuikuan(tj, pageIndex, pageSize);
	}

	@Override
	public int delHuikuan(Huikuan huikuan) {
		// TODO Auto-generated method stub
		return new HuikuanDaoImpl().delHuikuan(huikuan);
	}

	@Override
	public int findAllCount(String tj) {
		// TODO Auto-generated method stub
		return new HuikuanDaoImpl().findAllCount(tj) ;
	}

}
