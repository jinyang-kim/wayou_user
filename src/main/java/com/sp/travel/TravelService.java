package com.sp.travel;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("travel.travelService")
public class TravelService {
	
	@Autowired
	private CommonDAO dao;
	
	public List<Location> locList(String name){
		List<Location> list = null;
			try {
				list = dao.selectList("workspace.listLocation", name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return list;
	}

	public Location getLocation(int locCode) {
		Location dto = null;
		try {
			dto = dao.selectOne("workspace.basicInfo", locCode);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public int insertWorkspace(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.insertData("workspace.insertWorkspace", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Landmark> landList(Map<String,Object> map) {
		List<Landmark> list = null;
		try {
			list = dao.selectList("workspace.listLandmark", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return list;
	}

	public List<Landmark> landListByTag(Map<String, Object> map) {
		List<Landmark> list = null;
		try {
			list = dao.selectList("workspace.listLandmarkByTag", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int currentWorkSeqNum() {
		int result = 0;
		try {
			result = dao.selectOne("workspace.currentWorkSeqNum");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Landmark> landListByDay(Map<String, Object> map) {
		List<Landmark> list = null;
		try {
			list = dao.selectList("workspace.landListByDay", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int currentWorkDetailSeqNum() {
		int result =0;
		try {
			result = dao.selectOne("workspace.currentWorkDetailSeqNum");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertWorkDetail(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.insertData("workspace.insertWorkDetail",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertWorkLand(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.insertData("workspace.insertWorkLand",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void deleteWorkLand(int seqNum) {
		try {
			dao.insertData("workspace.deleteWorkLand",seqNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int isDetailExist(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("workspace.isDetailExist",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getDetailCode(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int seqNum=0;
		try {
			seqNum = dao.selectOne("workspace.getDetailCode",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return seqNum;
	}
}
