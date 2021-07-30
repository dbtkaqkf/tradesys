package com.test.trade.service;

import java.util.ArrayList;
import com.test.trade.vo.*;
public interface CustomService {
	ArrayList <CustomVO> getCustom(CustomVO vo) throws Exception;
	ArrayList <CustomVO> getCustom1(CustomVO vo) throws Exception;
	ArrayList <CustomVO> getCustom2(CustomVO vo) throws Exception;
	/*거래처 하나만불러오기*/
	ArrayList<CustomVO> getoneCustom(String custom)throws Exception;
	void insertInfo(CustomVO vo);
	void updateInfo(CustomVO vo);
	void deleteInfo(CustomVO vo);
}
