package kr.co.offispace.service.commonCode;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.dao.commonCode.CommonCodeDAO;
import kr.co.offispace.dto.CommonCodeVO;

public class CommonCodeServiceImpl implements CommonCodeService {
	private CommonCodeDAO commonCodeDAO;
	
	public void setCommonCodeDAO(CommonCodeDAO commonCodeDAO) {
		this.commonCodeDAO = commonCodeDAO;
	}
	
	@Override
	public List<CommonCodeVO> getCommonCodeList(Criteria cri) throws SQLException {
		List<CommonCodeVO> commonCodeList = commonCodeDAO.selectCommonCodeList(cri);
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> getHeadOfficeList() throws SQLException {
		List<CommonCodeVO> commonCodeList = commonCodeDAO.selectHeadOfficeList();
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> getGroupList() throws SQLException {
		List<CommonCodeVO> commonCodeList = commonCodeDAO.selectGroupList();
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> getTeamList() throws SQLException {
		List<CommonCodeVO> commonCodeList = commonCodeDAO.selectTeamList();
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> getPositionList() throws SQLException {
		List<CommonCodeVO> commonCodeList = commonCodeDAO.selectPositionList();
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> getChargeList() throws SQLException {
		List<CommonCodeVO> commonCodeList = commonCodeDAO.selectChargeList();
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> getStatusList() throws SQLException {
		List<CommonCodeVO> commonCodeList = commonCodeDAO.selectStatusList();
		return commonCodeList;
	}

	@Override
	public List<CommonCodeVO> getAuthorityList() throws SQLException {
		List<CommonCodeVO> commonCodeList = commonCodeDAO.selectAuthorityList();
		return commonCodeList;
	}

	@Override
	public Map<String, Object> getOrganizationChart() throws SQLException {
		Map<String, Object> dataMap=new HashMap<String,Object>();
		
		List<CommonCodeVO> headOfficeList = commonCodeDAO.selectHeadOfficeList();
		List<CommonCodeVO> groupList = commonCodeDAO.selectGroupList();
		List<CommonCodeVO> teamList = commonCodeDAO.selectTeamList();
		
		dataMap.put("headOfficeList", headOfficeList);
		dataMap.put("groupList", groupList);
		dataMap.put("teamList", teamList);
		
		return dataMap;
	}

	@Override
	public CommonCodeVO getCommonCode(String comCode) throws SQLException {
		CommonCodeVO commonCode=commonCodeDAO.selectCommonCodeByComCode(comCode);
		return commonCode;
	}

	@Override
	public String getVideoSeq() throws SQLException {
		return commonCodeDAO.selectVideoSeq();
	}

	
}
