package com.ict.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.erp.dao.LevelInfoDAO;
import com.ict.erp.service.LevelInfoService;
import com.ict.erp.vo.LevelInfo;

@Service
public class LevelInfoServiceImpl implements LevelInfoService {
	
	@Autowired
	private LevelInfoDAO ldao;

	@Override
	public List<LevelInfo> getLevelList(LevelInfo li) {
		return ldao.getLevelList(li);
	}
	
	@Override
	public LevelInfo getLevel(Integer linum) {
		return ldao.getLevel(linum);
	}

	@Override
	public int insertLevel(LevelInfo li) {
		return ldao.insertLevel(li);
	}

	@Override
	public int updateLevel(LevelInfo li) {
		return ldao.updateLevel(li);
	}

	@Override
	public int deleteLevel(int linum) {
		return ldao.deleteLevel(linum);
	}

	@Override
	public int testTransaction(LevelInfo li) {
		int cnt  = ldao.updateLevel(li);
		cnt = ldao.insertLevel(li);
		return cnt;
	}
	
	@Override
	public int testTransaction2(LevelInfo li) {
		int cnt  = ldao.updateLevel(li);
		System.out.println(getLevel(li.getLinum()));
		cnt = ldao.updateLevelError(li);
		return cnt;
	}

	@Override
	public int getLinum() {		
		return ldao.getLinum();
	}

	@Override
	public int insertLevelList(List<LevelInfo> li) {
		return ldao.insertLevelList(li);
	}

}
