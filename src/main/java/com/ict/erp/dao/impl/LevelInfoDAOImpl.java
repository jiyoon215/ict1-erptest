package com.ict.erp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.erp.dao.LevelInfoDAO;
import com.ict.erp.vo.LevelInfo;

@Repository
public class LevelInfoDAOImpl implements LevelInfoDAO {
	
	@Autowired
	private SqlSession ss;
	
	@Override
	public List<LevelInfo> getLevelList(LevelInfo li) {
		return ss.selectList("SQL.LEVELINFO.selectLevelInfoList",li);
	}
	
	@Override
	public LevelInfo getLevel(Integer linum) {
		return ss.selectOne("SQL.LEVELINFO.selectLevelInfo",linum);
	}

	@Override
	public int insertLevel(LevelInfo li) {
		return ss.insert("SQL.LEVELINFO.insertLevelInfo",li);
	}

	@Override
	public int updateLevel(LevelInfo li) {
		return ss.update("SQL.LEVELINFO.updateLevelInfo",li);
	}

	@Override
	public int deleteLevel(int linum) {
		return ss.delete("SQL.LEVELINFO.deleteLevelInfo",linum);
	}	

	@Override
	public int updateLevelError(LevelInfo li) {
		return ss.update("SQL.LEVELINFO.updateLevelInfoError",li);
	}

	@Override
	public int getLinum() {			
		return ss.selectOne("SQL.LEVELINFO.selectLinum");
	}

	@Override
	public int insertLevelList(List<LevelInfo> li) {
		int cnt=0;
		for(LevelInfo lilist:li) {
			cnt+=ss.insert("SQL.LEVELINFO.insertLevelInfoList",lilist);
		}
		return cnt;
	}

}
