package kr.co.offispace.dao.commonCode;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.dto.CommonCodeVO;

public interface CommonCodeDAO {

	List<CommonCodeVO> selectCommonCodeList(Criteria cri) throws SQLException;
	List<CommonCodeVO> selectHeadOfficeList() throws SQLException;
	List<CommonCodeVO> selectGroupList() throws SQLException;
	List<CommonCodeVO> selectTeamList() throws SQLException;
	List<CommonCodeVO> selectPositionList() throws SQLException;
	List<CommonCodeVO> selectChargeList() throws SQLException;
	List<CommonCodeVO> selectStatusList() throws SQLException;
	List<CommonCodeVO> selectAuthorityList() throws SQLException;
	String selectComCode1(String comCode) throws SQLException;
	CommonCodeVO selectCommonCodeByComCode(String comCode) throws SQLException;
	String selectVideoSeq() throws SQLException;
}
