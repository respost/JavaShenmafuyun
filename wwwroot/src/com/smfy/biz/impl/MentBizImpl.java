package com.smfy.biz.impl;

import java.util.List;

import com.smfy.biz.MentBiz;
import com.smfy.dao.BaseDao;
import com.smfy.dao.impl.MentDaoImpl;
import com.smfy.entity.Ment;

public class MentBizImpl extends BaseDao implements MentBiz {

	@Override
	public int addMent(Ment ment) {
		// TODO Auto-generated method stub
		return new MentDaoImpl().addMent(ment);
	}

	@Override
	public int delMent(Ment ment) {
		// TODO Auto-generated method stub
		return new MentDaoImpl().delMent(ment);
	}

	@Override
	public int dpMent(Ment ment) {
		// TODO Auto-generated method stub
		return new MentDaoImpl().dpMent(ment);
	}

	@Override
	public List<Ment> findAllMent(String tj,int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		return new MentDaoImpl().findAllMent(tj,pageIndex, pageSize);
	}

	@Override
	public int reMent(Ment ment) {
		// TODO Auto-generated method stub
		return new MentDaoImpl().reMent(ment);
	}

	@Override
	public int findAllMentCount(String tj) {
		// TODO Auto-generated method stub
		return new MentDaoImpl().findAllMentCount(tj);
	}

	@Override
	public int updateMnet(Ment ment) {
		// TODO Auto-generated method stub
		return new MentDaoImpl().updateMnet(ment);
	}

}
