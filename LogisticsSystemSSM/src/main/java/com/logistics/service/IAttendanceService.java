package com.logistics.service;

import java.util.List;
import java.util.Map;

import com.logistics.po.Attendance;
import com.logistics.vo.AttendanceVo;

public interface IAttendanceService {
	int deleteByPrimaryKey(Integer attendanceid);

	int insert(Attendance record);

	int insertSelective(Attendance record);

	Attendance selectByPrimaryKey(Integer attendanceid);

	int updateByPrimaryKeySelective(Attendance record);

	int updateByPrimaryKey(Attendance record);

	@SuppressWarnings("rawtypes")
	public List<AttendanceVo> findBySQL(Map map);

	@SuppressWarnings("rawtypes")
	public List<AttendanceVo> findPage(Map map);

	@SuppressWarnings("rawtypes")
	public int getTotalRow(Map map);

	@SuppressWarnings("rawtypes")
	public List<Attendance> findAttendance(Map map);

}
