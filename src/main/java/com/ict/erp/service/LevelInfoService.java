package com.ict.erp.service;

import java.util.List;

import com.ict.erp.vo.LevelInfo;

public interface LevelInfoService {
	
	public List<LevelInfo> getLevelList(LevelInfo li);
	public LevelInfo getLevel(Integer linum);
	public int insertLevel(LevelInfo li);
	public int updateLevel(LevelInfo li);
	public int deleteLevel(int linum);
	
	public int testTransaction(LevelInfo li);
	public int testTransaction2(LevelInfo li);
	
	public int getLinum();
	public int insertLevelList(List<LevelInfo> li);
}
