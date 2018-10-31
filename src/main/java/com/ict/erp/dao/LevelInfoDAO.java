package com.ict.erp.dao;

import java.util.List;

import com.ict.erp.vo.LevelInfo;

public interface LevelInfoDAO {
	
	public List<LevelInfo> getLevelList(LevelInfo li);
	public LevelInfo getLevel(Integer linum);
	public int insertLevel(LevelInfo li);
	public int updateLevel(LevelInfo li);
	public int deleteLevel(int linum);
	
	public int updateLevelError(LevelInfo li);
	
	public int getLinum();
	public int insertLevelList(List<LevelInfo> li);
}
