package com.test.trade.service.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.test.trade.vo.AccountVO;
import com.test.trade.vo.CustomVO;
public interface TradeDAO {

	ArrayList <CustomVO> getCustom(CustomVO vo);
	ArrayList <CustomVO> getCustom1(CustomVO vo);
	ArrayList <CustomVO> getCustom2(CustomVO vo);
	/*거래처 하나만불러오기*/
	ArrayList<CustomVO> getoneCustom(String custom);
	void insertInfo(CustomVO vo);
	void updateInfo (CustomVO vo);
	void deleteInfo (CustomVO vo);
}
