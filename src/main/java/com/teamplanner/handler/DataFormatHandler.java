package com.teamplanner.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class DataFormatHandler implements TypeHandler{

	@Override
	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		if(columnName.toLowerCase().equals("regdate")) {
			SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/dd");
			return format.format(
					new Date( rs.getTimestamp(columnName).getTime() ));
		}
		return null;
	}

	@Override
	public Object getResult(ResultSet arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getResult(CallableStatement arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setParameter(PreparedStatement arg0, int arg1, Object arg2, JdbcType arg3) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
