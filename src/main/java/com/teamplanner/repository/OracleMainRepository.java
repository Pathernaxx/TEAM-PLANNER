package com.teamplanner.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teamplanner.mapper.MainMapper;

@Repository(value="mainDao")
public class OracleMainRepository {
	
	private MainMapper mainMapper;
	@Autowired
	@Qualifier(value="MainMapper")
	public void setBoardMapper(MainMapper mainMapper){
		this.mainMapper = mainMapper;
	}
}
