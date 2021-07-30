package com.test.trade.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.trade.service.CustomService;
import com.test.trade.service.dao.TradeDAO;
import com.test.trade.vo.AccountVO;
import com.test.trade.vo.CustomVO;

@Service("customService")
public class CustomServiceImpl implements CustomService{

	
	
	@Autowired
	private TradeDAO tradedao;
	
	@Override
	public ArrayList<CustomVO> getCustom(CustomVO vo){
		
		return tradedao.getCustom(vo);
	}
	@Override
	public ArrayList<CustomVO> getCustom1(CustomVO vo){
		
		return tradedao.getCustom1(vo);
	}
	@Override
	public ArrayList<CustomVO> getCustom2(CustomVO vo){
		
		return tradedao.getCustom2(vo);
	}
	@Override
	public void insertInfo(CustomVO vo) {
	
		tradedao.insertInfo(vo);
	}
	
	/*거래처 하나만불러오기*/
	@Override
	public ArrayList<CustomVO> getoneCustom(String custom) {
		ArrayList<CustomVO> list = tradedao.getoneCustom(custom);
		return list;
	}
	
	@Override
	public void updateInfo(CustomVO vo) {
		tradedao.updateInfo(vo);
		
	}
	/*@Override
	public int infocheck(CustomVO vo) {
		int count = tradedao.infocheck(vo);
			return  count;
	}*/
	@Override
	public void deleteInfo(CustomVO vo) {
		tradedao.deleteInfo(vo);
	}
	
}
