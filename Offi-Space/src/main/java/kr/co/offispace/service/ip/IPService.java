package kr.co.offispace.service.ip;

import java.sql.SQLException;

import kr.co.offispace.dto.IPVO;

public interface IPService {

	public boolean IPCheck(IPVO IP) throws SQLException;
}
