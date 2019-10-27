package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.AttendanceMapper;
import com.logistics.po.Attendance;
import com.logistics.service.IAttendanceService;
import com.logistics.vo.AttendanceVo;

@Transactional
@Service("attendanceService")
public class AttendanceServiceImpl implements IAttendanceService {

	@Autowired
	AttendanceMapper attendanceMapper;

	@Override
	public int deleteByPrimaryKey(Integer attendanceid) {

		return attendanceMapper.deleteByPrimaryKey(attendanceid);
	}

	@Override
	public int insert(Attendance record) {

		return attendanceMapper.insert(record);
	}

	@Override
	public int insertSelective(Attendance record) {

		return attendanceMapper.insertSelective(record);
	}

	@Override
	public Attendance selectByPrimaryKey(Integer attendanceid) {

		return attendanceMapper.selectByPrimaryKey(attendanceid);
	}

	@Override
	public int updateByPrimaryKeySelective(Attendance record) {

		return attendanceMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Attendance record) {

		return attendanceMapper.updateByPrimaryKey(record);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<AttendanceVo> findPage(Map map) {

		return attendanceMapper.findPage(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRow(Map map) {

		return attendanceMapper.getTotalRow(map);
	}

	@Override
	public List<Attendance> findAttendance(@SuppressWarnings("rawtypes") Map map) {

		return attendanceMapper.findAttendance(map);
	}

	@Override
	public List<AttendanceVo> findBySQL(@SuppressWarnings("rawtypes") Map map) {

		return attendanceMapper.findBySQL(map);
	}

}
