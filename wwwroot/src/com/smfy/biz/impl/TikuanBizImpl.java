package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.TikuanBiz;
import com.smfy.dao.impl.TikuanDaoImpl;
import com.smfy.entity.Tikuan;

public class TikuanBizImpl implements TikuanBiz {

	@Override
	public List<Tikuan> findAllTikuan(String tj, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		return new TikuanDaoImpl().findAllTikuan(tj, pageIndex, pageSize);
	}

	@Override
	public int findAllCount(String tj) {
		// TODO Auto-generated method stub
		return new TikuanDaoImpl().findAllCount(tj);
	}

	@Override
	public int delTikuan(Tikuan tikuan) {
		// TODO Auto-generated method stub
		return new TikuanDaoImpl().delTikuan(tikuan);
	}

}
